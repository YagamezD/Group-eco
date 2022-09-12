# Inicializa la aplicación
from flask import Flask
app = Flask(__name__)

# Establecemos una secret key
app.secret_key="Es algo importante"

app.config['UPLOAD_FOLDER'] = 'flask_app/static/image'