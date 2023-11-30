# app.py

from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello, World! This is my Flask web server.'

if __name__ == '__main__':
    app.run(debug=True)