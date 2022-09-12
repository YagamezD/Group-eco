# Ejecuta la aplicación
from flask_app import app
from flask_app.controllers import controller_user
from flask_app.controllers import controller_servicios 
from flask_app.controllers import controller_ordenes
# from flask_app.controllers import 

#Corremos la aplicación: 
if __name__=="__main__":
    app.run(debug=True)