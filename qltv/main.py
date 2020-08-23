from flask import render_template
from qltv import app
from qltv.models import *
@app.route("/")
def index():
    return render_template("index.html")

@app.route("/login")
def login():
    return render_template("login.html")

@app.route("/employee")
def employee():
    return render_template("employee.html")

@app.route("/employee_list")
def employee_list():
    return render_template("employee_list.html")

@app.route("/permission")
def permission():
    return render_template("permission.html")

if __name__ == "__main__":
    app.run(debug=True)
