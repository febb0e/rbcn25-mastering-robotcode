from flask import Flask
from flask import render_template
from flask import request

app = Flask(__name__)

@app.route('/')
def hello():
    return render_template("index_2.html")

@app.route('/', methods=['GET', 'POST'])
def login():
    error = None
    if request.method == 'POST':
        error = 'Invalid Credentials. Please try again.'
    return render_template('index_2.html', error=error)