import os
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from dotenv import load_dotenv


load_dotenv()
username = os.getenv('USERNAME')
password = os.getenv('PASSWORD')

db = SQLAlchemy()

def create_app():
    app = Flask(__name__)

    # MySQL configuration
    app.config['SQLALCHEMY_DATABASE_URI'] = f'mysql+pymysql://{username}:{password}@localhost/hospital'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    # Initialize SQLAlchemy
    db.init_app(app)

    from .views import views
    app.register_blueprint(views)
    
    return app
