from flask import render_template, redirect, session, request, flash, jsonify
from importlib.metadata import requires
from flask_app import app
from datetime import datetime
from flask_app.models.products import Productos
from flask_app.models.product_level import ProductLevel
import os
from werkzeug.utils import secure_filename
from flask_app.models.user import RegisterForm
# session["hoy"] = (datetime.today()).strftime('%Y-%m-%d')

@app.route('/admin_add_product')
def admin_add_product():
    data_user = {
            'id': session['userid']
        }
    user = RegisterForm.consulta_por_id(data_user)
    return render_template('add_product.html', user=user)

@app.route('/registrar_producto', methods=['POST'])
def registrar_producto():

    image = request.files.getlist('picture')
    # if archivo.filename != "":
    #     return render_template('/')
    nombre_archivo = secure_filename(image[0].filename)
    image[0].save(os.path.join(app.config['UPLOAD_FOLDER'], nombre_archivo))
    
    data_producto = {
        'pName':  request.form['pName'],
        'price':  request.form['price'],
        'description':  request.form['description'],
        'available':  request.form['available'],
        'category':  request.form['category'],
        'item':  request.form['item'],
        'pCode':  request.form['pCode'],
        'picture':  nombre_archivo,
        'user_id': request.form['user_id']    
    }

    print('HOLA SOY EL REQUETE DEL PRODUCTO', request.form)
    producto = Productos.crear_producto(data_producto)
    # Vamos a agregar en la tabla product_level
    lista_categorias = request.form.getlist(f'{request.form["category"]}')
    print('HOLA SOY las lista de checbox', lista_categorias)
    cate_level = ['pedicure', 'manicure', 'maquillaje', 'corte', 'plomeria', 'cerrajeria', 'electricidad','masajes', 'meditacion', 'aromaterapia','psiquiatria','psicologia','tpareja','tocupacional','yoga']
    data_product_leve = {
        'product_id': producto
    }

    for i in range(0,len(cate_level)):
        if cate_level[i] in lista_categorias:
            data_product_leve[cate_level[i]] ='yes'
        else: 
            data_product_leve[cate_level[i]] ='no'

    print("HOLA SOY LA DATA PARA ENVIAR A PRODUT:LEVE", data_product_leve)
    nivel = ProductLevel.crear_nuevo_product_level(data_product_leve)

    return redirect('/')

@app.route('/view_product')
def view_product():
    productos = Productos.consultar_todos()
    # print("ESTO ES LO QUE BUSCAS", session['logged_in'] )
    data_usuario = {'id': session['user_id']}
    usuario = RegisterForm.consulta_por_id(data_usuario)
    return render_template('view_product.html', productos=productos,usuario=usuario)

@app.route('/producto/<string:valor>')
def producto_individual(valor):
    category = {'category': valor}
    productos = Productos.consultar_por_categoria(category)
    data_usuario = {'id': session['user_id']}
    usuario = RegisterForm.consulta_por_id(data_usuario)
    return render_template('productos_individuales.html',producto=productos,valor=valor,usuario=usuario)

@app.route('/lista_mis_productos')
def lista_mis_productos():
    data_usuario = {'id': session['user_id']}
    productos = Productos.consultar_mis_productos_creados(data_usuario)
    usuario = RegisterForm.consulta_por_id(data_usuario)
    return render_template('ver_mis_productos.html',productos=productos,usuario=usuario)

@app.route('/ver_producto_individual/<int:id>')
def ver_producto_individual(id):
    data_id_prducto = {
        'id':id
    }
    producto = Productos.consultar_por_id_producto(data_id_prducto)
    return render_template('modal_viewproduct.html', product=producto)

@app.route('/editar_producto/<int:id>')
def editar_producto(id):
    data_producto = {'id':id}
    producto = Productos.consultar_por_id_producto(data_producto)
    return render_template('edit_product.html',producto=producto)

@app.route('/actualizar_producto', methods=['POST']) ##FALTA LA PARTE DE ACTUALIZAR PRODUCT LEVEL SEGÚN LAS LECCIONES
def actualizar_producto():
    #PASO 1: Validar si hay imagen nueva
    imagen_nueva = request.files['picture']
    if imagen_nueva.filename == "":
        data_actualizar = {
            'id': request.form['id'],
            'pName': request.form['pName'],
            'price': request.form['price'],
            'description': request.form['description'],
            'available': request.form['available'],
            'category': request.form['category'],
            'item': request.form['item'],
            'pCode': request.form['pCode'],
            'picture': request.form['picture']
        }
        Productos.actualizar_producto_por_id(data_actualizar)
    else:
        image = request.files.getlist('picture')
        nombre_archivo = secure_filename(image[0].filename)
        image[0].save(os.path.join(app.config['UPLOAD_FOLDER'], nombre_archivo))
        data_actualizar = {
            'id': request.form['id'],
            'pName': request.form['pName'],
            'price': request.form['price'],
            'description': request.form['description'],
            'available': request.form['available'],
            'category': request.form['category'],
            'item': request.form['item'],
            'pCode': request.form['pCode'],
            'picture': nombre_archivo
        }
        Productos.actualizar_producto_por_id(data_actualizar)

    print("SOY LA IMAGEN QUE BUSCAS", imagen_nueva.filename, request.form, request.form.getlist(f'{request.form["category"]}'))
    return redirect('/view_product')

@app.route('/eliminar_producto/<int:id>')
def eliminar_producto(id):
    data_producto_eliminar={
        'id':id
    }
    Productos.eliminar_producto_id(data_producto_eliminar)
    return redirect('/view_product')












































@app.route('/search') #PENDIENTE CONTINUAR
def search():
    return render_template('search.html')



