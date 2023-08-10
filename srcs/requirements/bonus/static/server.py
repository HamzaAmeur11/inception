import os
from flask import Flask, render_template

app = Flask(__name__, static_url_path='/static')

@app.route('/')
def main():
    return render_template('index.html', name='hameur', title='static')

if __name__ == "__main__":
    app.run(host="0.0.0.0", port="8080")