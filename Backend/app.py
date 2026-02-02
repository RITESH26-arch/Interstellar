from flask import Flask, request, jsonify
from flask_cors import CORS
from login_logic import register_user, login_user, sessions
from db_config import get_connection

app = Flask(__name__)
CORS(app)

# -------------------------
# SIGNUP API
# -------------------------
@app.route("/signup", methods=["POST"])
def signup():
    data = request.json
    msg = register_user( 
        data.get("email"),
        data.get("email"),
        data.get("password"),
        data.get("location")
    )
    return jsonify(msg)

# -------------------------
# LOGIN API
# -------------------------
@app.route("/login", methods=["POST"])
def login():
    data = request.json
    email = data.get("email")
    password = data.get("password")
    result = login_user(email,password)
    return jsonify(result)

# -------------------------
# SERVER RUN
# -------------------------
if __name__ == "__main__":
    app.run(debug=True,use_reloader=False)
