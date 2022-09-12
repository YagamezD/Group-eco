from flask_app.config.mysqlconnection import connectToMySQL
from flask import render_template, redirect, session, request, flash, jsonify
import re
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]+$')
from flask import flash


class Admin:

    def __init__(self,data):
        self.id= data['id']
        self.firstName= data['firstName']
        self.lastName= data['lastName']
        self.email= data['email']
        self.mobile= data['mobile']
        self.address= data['address']
        self.password= data['password']
        self.type= data['type']
        self.confirmCode= data['confirmCode']
        self.created_at= data['created_at']
        self.updated_at= data['updated_at']


    @classmethod
    def save (cls, formulario):
        query = "INSERT INTO admin (name,	email,	username,	password,	mobile) VALUES (%(name)s,	%(email)s,	%(username)s,	%(password)s,	%(mobile)s)"
        result = connectToMySQL('ecomerce_algo').query_db(query, formulario)#me regresa el Id del nuevo ingreso
        return result

    @classmethod
    def consulta_por_email(cls,data):
        query = "SELECT * FROM admin WHERE email=%(email)s;"
        result = connectToMySQL('ecomerce_algo').query_db(query, data)#me regresa el Id del nuevo ingreso
        if len(result) < 1: #no existe registro del correo
            return False    
        else:
            user = cls(result[0]) #haciendo una instancia con la info del usuario en base a su email
            return user

    @classmethod
    def actualizar_online(cls,data):
        query = "UPDATE admin SET online=%(online)s WHERE id=%(id)s;"
        result = connectToMySQL('ecomerce_algo').query_db(query, data)
        return result