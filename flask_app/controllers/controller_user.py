from flask import render_template, redirect, session, request, flash, jsonify
from flask_app import app
from flask_app.models.user import RegisterForm
from flask_app.models.products import Productos
from flask_app.models.ordenes import Ordenes
from flask_bcrypt import Bcrypt 
bcrypt = Bcrypt(app)

@app.route('/')
def index():
    # lista_procdutos = Producto.consultar_por_categoria()
    return render_template('home.html')

@app.route('/register')
def register():
    return render_template('register.html')

@app.route('/guardar_usuario', methods=['POST'])
def guardar_usuario():
    pw_hash = bcrypt.generate_password_hash(request.form["password"])
    dic_data = {
        'name': request.form['name'],
        'email': request.form['email'],
        'username': request.form['username'],
        'password': request.form['password'],
        'mobile': request.form['mobile'],
        'password' : pw_hash
    }
    id = RegisterForm.save(dic_data)
    session['user_id'] = id
    return redirect('/ingresar')

@app.route('/ingresar')
def ingresar():
    return render_template('login.html')

@app.route('/login', methods=['POST'])
def login():
    data = {'email': request.form["email"]}
    print(data)
    user = RegisterForm.consulta_por_email(data)
    session['user_id'] = user.id
    userid = user.id
    name = user.name
    # if not user:
    #     flash("Email no se encuentra registrado",'login')
    #     return redirect('/')
        # return jsonify(message="E-mail no encontrado")

    # valifación clave
    if not bcrypt.check_password_hash(user.password,request.form["password"]):
        # flash("Contraseña inválida por favor verifique", 'login')
        # return redirect('/')
        return redirect('/login')
    else:
        session['logged_in'] = True
        session['userid'] = userid
        session['s_name'] = name
        data_id = {
            'id': session['user_id'],
            'online': 1}
        RegisterForm.actualizar_online(data_id)
        data_user = {
            'id': session['userid']
        }
        lista_lo_guardado = Ordenes.consulta_todo_por_usuario(data_user)
        if lista_lo_guardado == False:
            session['cantidad_productos'] = 0
        else: 
            session['cantidad_productos'] = len(lista_lo_guardado)
        return redirect('/') ### Está pendiente redireccionar a la página de incio de usuarios

@app.route('/out')
def out():
    session.clear()
    return redirect('/')

@app.route('/miperfil')
def miperfil():
    data_id = {
        'id':session['userid']
    }
    usuario=RegisterForm.consulta_por_id(data_id)
    return render_template('editar_perfil.html', usuario=usuario)

@app.route('/actualizar_usuario', methods=['POST'])
def actualizar_usuario():
    data_id = {
        'id':session['userid']
    }
    usuario=RegisterForm.consulta_por_id(data_id)
    print("SOY EL FORMULARIO DEL USUARIO", request.form)
    #PASO1: USUARIO NO ACTUALIZA LA CLAVE
    if (usuario.password != request.form["password"]) and (request.form["password"] != ""):
        pw_hash = bcrypt.generate_password_hash(request.form["password"])
        dic_data = {
            'id': request.form['id'],
            'name': request.form['name'],
            'email': request.form['email'],
            'username': request.form['username'],
            'password': pw_hash,
            'mobile': request.form['mobile'],

        }
        RegisterForm.actualziar_user_por_id(dic_data)
    else:
        dic_data = {
            'id': request.form['id'],
            'name': request.form['name'],
            'email': request.form['email'],
            'username': request.form['username'],
            'password': usuario.password,
            'mobile': request.form['mobile'],

        }
        RegisterForm.actualziar_user_por_id(dic_data)

    return redirect('/view_product')
