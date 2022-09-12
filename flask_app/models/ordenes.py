from unittest import result
from flask_app.config.mysqlconnection import connectToMySQL
from flask import render_template, redirect, session, request, flash, jsonify

class Ordenes:
    def __init__(self, data):
        self.id= data['id']
        self.ofname= data['ofname']
        self.pid= data['pid']
        self.quantity= data['quantity']
        self.oplace= data['oplace']
        self.mobile= data['mobile']
        self.dstatus= data['dstatus']
        self.odate= data['odate']
        self.ddate= data['ddate']
        self.uid= data['uid']
        self.updated_at= data['updated_at']
        self.id_pedido = data['id_pedido']

    @classmethod
    def guardar_pedido(cls, formulario):
        query = "INSERT INTO orders (ofname,	pid,	quantity,	oplace,	mobile,	dstatus, ddate,	uid,id_pedido) VALUES (%(ofname)s,	%(pid)s,	%(quantity)s,	%(oplace)s,	%(mobile)s,	%(dstatus)s,	%(ddate)s,	%(uid)s,%(id_pedido)s);"
        result = connectToMySQL('ecomerce_algo').query_db(query,formulario)
        return result

    @classmethod
    def consulta_todo_por_usuario(cls, data):
        query = "SELECT * FROM orders WHERE  dstatus = 'borrador' AND uid=%(id)s"
        result = connectToMySQL('ecomerce_algo').query_db(query,data)
        lista_resultados = []
        if len(result) < 1: 
            return False
        else:
            for resultado in result:
                lista_resultados.append(cls(resultado))
            return lista_resultados

    @classmethod
    def vaciar_carrito(cls,data):
        query = "DELETE FROM orders WHERE dstatus = 'borrador' AND uid=%(id)s"
        result = connectToMySQL('ecomerce_algo').query_db(query,data)
        return result

    @classmethod
    def consulta_todo_por_pedido(cls, data):
        query = "SELECT * FROM orders WHERE  dstatus = 'borrador' AND id_pedido=%(id)s"
        result = connectToMySQL('ecomerce_algo').query_db(query,data)
        lista_resultados = []
        if len(result) < 1: 
            return False
        else:
            for resultado in result:
                lista_resultados.append(cls(resultado))
            return lista_resultados

    @classmethod
    def eliminar_producto_odenado_id(cls,data):
        query = "DELETE FROM orders WHERE id=%(id)s;"
        result = connectToMySQL('ecomerce_algo').query_db(query,data)
        return result