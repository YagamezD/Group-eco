from unittest import result
from flask_app.config.mysqlconnection import connectToMySQL
from flask import render_template, redirect, session, request, flash, jsonify
import re
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$')
from flask import flash


class RegisterForm:

    def __init__(self,data):
        self.id= data['id']
        self.name= data['name']
        self.email= data['email']
        self.username= data['username']
        self.password= data['password']
        self.mobile= data['mobile']
        self.reg_time= data['reg_time']
        self.online= data['online']
        self.activation= data['activation']
        self.updated_at= data['updated_at']

    @classmethod
    def save (cls, formulario):
        query = "INSERT INTO users (name,	email,	username,	password,	mobile) VALUES (%(name)s,	%(email)s,	%(username)s,	%(password)s,	%(mobile)s)"
        result = connectToMySQL('ecomerce_algo').query_db(query, formulario)#me regresa el Id del nuevo ingreso
        return result

    @classmethod
    def consulta_por_email(cls,data):
        query = "SELECT * FROM users WHERE email=%(email)s;"
        result = connectToMySQL('ecomerce_algo').query_db(query, data)#me regresa el Id del nuevo ingreso
        if len(result) < 1: #no existe registro del correo
            return False    
        else:
            user = cls(result[0]) #haciendo una instancia con la info del usuario en base a su email
            return user

    @classmethod
    def actualizar_online(cls,data):
        query = "UPDATE users SET online=%(online)s WHERE id=%(id)s;"
        result = connectToMySQL('ecomerce_algo').query_db(query, data)
        return result

    @classmethod
    def consulta_por_id(cls,data):
        query = "SELECT * FROM users WHERE id=%(id)s;"
        result = connectToMySQL('ecomerce_algo').query_db(query, data)#me regresa el Id del nuevo ingreso
        if len(result) < 1: #no existe registro del correo
            return False    
        else:
            user = cls(result[0]) #haciendo una instancia con la info del usuario en base a su email
            return user

    @classmethod
    def actualziar_user_por_id(cls,data):
        query = "UPDATE users SET id = %(id)s, name=%(name)s,email=%(email)s,username=%(username)s,password=%(password)s,mobile=%(mobile)s WHERE id=%(id)s;"
        result = connectToMySQL('ecomerce_algo').query_db(query, data)
        return result

    @classmethod
    def consultar_todos_los_usuarios(cls):
        query = 'SELECT * FROM users;'
        result = connectToMySQL('ecomerce_algo').query_db(query)
        lista_de_usarios = []
        for resultado in result:
            lista_de_usarios.append(cls(resultado))
        return lista_de_usarios