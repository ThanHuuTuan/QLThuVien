from flask import render_template, redirect, request

from qltv import app, login
from flask_login import login_user
import hashlib

from qltv.models import *

@app.route("/login-base", methods=["POST", "GET"])
def login_admin():
    if request.method == "POST":
        username = request.form.get("username")
        password = request.form.get("password")
        password = str(hashlib.md5(password.strip().encode("utf-8")).hexdigest())
        user = User.query.filter(User.username == username.strip(), User.password == password).first()

        if user:
            login_user(user=user)

    return redirect("/base")

@login.user_loader
def user_load(user_id):
    return User.query.get(user_id)

@app.route("/")
def index():
    return render_template("index.html")

# @app.route("/login")
# def login():
#     return render_template("login.html")

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
    from qltv.admin import *
    app.run(debug=True)
