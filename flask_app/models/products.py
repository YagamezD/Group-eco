from unittest import result
from flask_app.config.mysqlconnection import connectToMySQL
from flask import render_template, redirect, session, request, flash, jsonify

class Productos:

    def __init__(self,data):
        self.id= data['id']
        self.pName= data['pName']
        self.price= data['price']
        self.description= data['description']
        self.available= data['available']
        self.category= data['category']
        self.item= data['item']
        self.pCode= data['pCode']
        self.picture= data['picture']
        self.date= data['date']
        self.updated_at= data['updated_at']
        self.user_id = data['user_id']
        #Datos adicionales para obtener información de las órdenes
        self.id_order = data['id_order']
        self.comprador = data['comprador']
        self.id_pedido = data['id_pedido']
        if 'quantity'in data:
            self.quantity = data['quantity']
        if 'total_producto' in data:
            self.total_producto = data['total_producto']
        

    @classmethod
    def crear_producto(self,formulario):
        query = "INSERT INTO products (pName,	price,	description,	available,	category,	item,	pCode,	picture, user_id) VALUES (%(pName)s,	%(price)s,	%(description)s,	%(available)s,	%(category)s,	%(item)s,	%(pCode)s,	%(picture)s, %(user_id)s);"
        result = connectToMySQL('ecomerce_algo').query_db(query,formulario)
        return result

    @classmethod
    def consultar_todos(cls):
        query = "SELECT p.*,  o.id as id_order, o.uid as comprador, o.id_pedido as id_pedido FROM products as p LEFT JOIN  (SELECT group_concat(id) as id ,group_concat(uid) as uid,group_concat(id_pedido) as id_pedido, pid FROM orders GROUP BY pid) AS o ON o.pid = p.id;"
        result = connectToMySQL('ecomerce_algo').query_db(query)
        lista_resultados= []
        for resultado in result:
            lista_resultados.append(cls(resultado))
        return lista_resultados

    @classmethod
    def consultar_por_categoria(cls, data):
        query = "SELECT p.*,  o.id as id_order, o.uid as comprador, o.id_pedido as id_pedido FROM products as p LEFT JOIN  (SELECT group_concat(id) as id ,group_concat(uid) as uid,group_concat(id_pedido) as id_pedido, pid FROM orders GROUP BY pid) AS o ON o.pid = p.id WHERE category = %(category)s;"
        result = connectToMySQL('ecomerce_algo').query_db(query,data)
        lista_resultados = []
        for resultado in result:
            lista_resultados.append(cls(resultado))
        return lista_resultados

    @classmethod
    def consultar_mis_productos_creados(cls,data):
        query = "SELECT p.*,  o.id as id_order, o.uid as comprador, o.id_pedido as id_pedido FROM products as p LEFT JOIN  (SELECT group_concat(id) as id ,group_concat(uid) as uid,group_concat(id_pedido) as id_pedido, pid FROM orders GROUP BY pid) AS o ON o.pid = p.id WHERE user_id = %(id)s"
        result = connectToMySQL('ecomerce_algo').query_db(query,data)
        lista_mis_productos = []
        for resultado in result:
            lista_mis_productos.append(cls(resultado))
        return lista_mis_productos

    @classmethod
    def consultar_por_id_producto(cls,data):
        query = "SELECT p.*,  o.id as id_order, o.uid as comprador, o.id_pedido as id_pedido FROM products as p LEFT JOIN  (SELECT group_concat(id) as id ,group_concat(uid) as uid,group_concat(id_pedido) as id_pedido, pid FROM orders GROUP BY pid) AS o ON o.pid = p.id WHERE p.id = %(id)s"
        result = connectToMySQL('ecomerce_algo').query_db(query,data)
        return cls(result[0])
    
    @classmethod
    def actualizar_producto_por_id(cls,data):
        query = "UPDATE products SET pName=%(pName)s, price=%(price)s, description=%(description)s,available=%(available)s,category=%(category)s,item=%(item)s,pCode=%(pCode)s,picture=%(picture)s WHERE id=%(id)s;"
        result = connectToMySQL('ecomerce_algo').query_db(query,data)
        return result

    @classmethod
    def eliminar_producto_id(cls,data):
        query = "DELETE FROM products WHERE id=%(id)s;"
        result = connectToMySQL('ecomerce_algo').query_db(query,data)
        return result

    @classmethod
    def consultar_productos_ordenados_por_id_user(cls,data): ## SE DEBE MODIFICAR YA QUE CONSULTA TODOS LOS PRODUCTOS SOLICITADOS POR UN X USUARIO NO LOS CREADOS
        query ="SELECT distinct o.id as id_order, o.uid as comprador, o.id_pedido as id_pedido,p.* FROM orders o LEFT JOIN  (SELECT * FROM products) as p ON o.pid = p.id WHERE dstatus in ('borrador') AND o.uid = %(id)s;"
        result = connectToMySQL('ecomerce_algo').query_db(query,data)
        lista_productos = []
        if len(result) <1:
            return False
        else:
            for resultado in result:
                lista_productos.append(cls(resultado))
            return lista_productos

    @classmethod
    def consultar_productos_por_pedido(cls,data):
        query = "SELECT distinct o.id as id_order, o.uid as comprador, o.id_pedido as id_pedido, o.quantity as quantity,(o.quantity*p.price) as total_producto,p.* FROM orders o LEFT JOIN  (SELECT * FROM products) as p ON o.pid = p.id WHERE o.id_pedido = %(id_pedido)s;"
        result = connectToMySQL('ecomerce_algo').query_db(query,data)
        lista_productos = []
        if len(result) <1:
            return False
        else:
            for resultado in result:
                lista_productos.append(cls(resultado))
            return lista_productos
