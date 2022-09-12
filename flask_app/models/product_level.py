from unittest import result
from flask_app.config.mysqlconnection import connectToMySQL
from flask import render_template, redirect, session, request, flash, jsonify

class ProductLevel:

    def __init__(self,data):
        self.id= data['id']
        self.pedicure= data['pedicure']
        self.manicure= data['manicure']
        self.maquillaje= data['maquillaje']
        self.corte= data['corte']
        self.plomeria= data['plomeria']
        self.cerrajeria= data['cerrajeria']
        self.electricidad= data['electricidad']
        self.masajes= data['masajes']
        self.meditacion= data['meditacion']
        self.aromaterapia= data['aromaterapia']
        self.psiquiatria= data['psiquiatria']
        self.psicologia= data['psicologia']
        self.tpareja= data['tpareja']
        self.yoga= data['yoga']
        self.tocupacional= data['tocupacional']
        self.product_id= data['product_id']
        self.created_at= data['created_at']
        self.updated_at= data['updated_at']

    @classmethod
    def crear_nuevo_product_level(cls,formulario):
        query = "INSERT INTO product_level (pedicure,	manicure,	maquillaje,	corte,	plomeria,	cerrajeria,	electricidad,	masajes,	meditacion,	aromaterapia,	yoga,	psiquiatria,psicologia, tpareja, tocupacional,product_id ) VALUES (%(pedicure)s,	%(manicure)s,	%(maquillaje)s,	%(corte)s,	%(plomeria)s,	%(cerrajeria)s,	%(electricidad)s,	%(masajes)s,	%(meditacion)s,	%(aromaterapia)s,	%(yoga)s, %(psiquiatria)s ,%(psicologia)s ,%(tpareja)s ,%(tocupacional)s ,%(product_id)s);"
        result = connectToMySQL('ecomerce_algo').query_db(query,formulario)
        return result
