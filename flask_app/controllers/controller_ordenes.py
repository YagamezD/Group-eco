from flask import render_template, redirect, session, request, flash, jsonify
from importlib.metadata import requires
from flask_app import app
from datetime import datetime
from flask_app.models.products import Productos
from flask_app.models.product_level import ProductLevel
from flask_app.models.ordenes import Ordenes
from flask_app.models.user import RegisterForm
import os
from werkzeug.utils import secure_filename

@app.route('/guadar_elecciones', methods=['POST'])
def guadar_elecciones():
    if 'user_id' not in session:
        session.clear()
        return redirect('/')
    
    data_usuario = {'id': session['user_id']}
    usuario = RegisterForm.consulta_por_id(data_usuario)
    id = usuario.id
    lista_productos = [int(x) for x in request.form.getlist('producto_elegido')] 
    #PASO 1: Revisar si lo que está pidiendo ya está en el borrador
    lista_lo_guardado = Ordenes.consulta_todo_por_usuario(data_usuario)
    if lista_lo_guardado == False:
        for producto in lista_productos:
            data_producto = {
                'ofname': usuario.name,
                'pid': producto,
                'quantity': 1,
                'oplace': "local",
                'mobile': "0000",
                'dstatus': "borrador",
                'ddate': (datetime.today()).strftime('%Y-%m-%d'),
                'uid': id,
                'id_pedido': (datetime.today()).strftime('%Y%m%d%H%M%S')+usuario.username
            }
            Ordenes.guardar_pedido(data_producto)
    else:
        lista_id_guadardo = []
        for i in range(0,len(lista_lo_guardado)):
            lista_id_guadardo.append(lista_lo_guardado[i].pid)
        #PASO 2:Guardado temporal en la base de datos de órdenes
        
        print("son la lista de los ID", lista_productos)
        for producto in lista_productos:
            if producto not in lista_id_guadardo:
                data_producto = {
                    'ofname': usuario.name,
                    'pid': producto,
                    'quantity': 1,
                    'oplace': "local",
                    'mobile': "0000",
                    'dstatus': "borrador",
                    'ddate': (datetime.today()).strftime('%Y-%m-%d'),
                    'uid': id,
                    'id_pedido': (datetime.today()).strftime('%Y%m%d%H%M%S')+usuario.username
                }
                Ordenes.guardar_pedido(data_producto)

    return redirect('/view_product')

@app.route('/carrito_render')
def carrito_render():
    if 'user_id' not in session:
        session.clear()
        return redirect('/')
    #Vamos a consultar todas las órdenes del usuario que está en sesión
    data_usuario = {'id': session['user_id']}
    usuario = RegisterForm.consulta_por_id(data_usuario)
    productos = Productos.consultar_todos_por_id_user(data_usuario)
    ordenes = Ordenes.consulta_todo_por_usuario(data_usuario)
    print("REVISAR EL CARRIRO", productos)
    return render_template('order_product.html',productos=productos,ordenes=ordenes)

@app.route('/enviar_compra', methods=['POST'])
def enviar_compra():
    if 'user_id' not in session:
        session.clear()
        return redirect('/')
    data_usuario = {'id': session['user_id']}
    usuario = RegisterForm.consulta_por_id(data_usuario)
    productos = Productos.consultar_todos_por_id_user(data_usuario)
    print("SOY LA CONFIRMACIÓN DEL PEDIDO", request.form)
    if request.form['accion'] == 'Vaciar':
        Ordenes.vaciar_carrito(data_usuario)
        return redirect('/view_product')
    elif request.form['accion'] == "Confirmar orden":
        Ordenes.actualizar_por_pedido()
        return redirect('/resumen_dela_compra')
        
@app.route('/resumen_dela_compra')
def resumen_dela_compra():
    pass

# @app.route('/eliminar_un_producto/<int:id>')
# def eliminar_un_producto(id):
#     id_orden = {'id':id}
#     Ordenes.eliminar_producto_odenado_id(id_orden)
#     return redirect('/carrito_render')