from flask import Flask, request, jsonify
from flask_cors import CORS
from Backend.login_logic import register_user, login_user, sessions
from Backend.login_logic import get_security_question_by_email,reset_password_logic,verify_security_answer
from Backend.db_config import get_connection

app = Flask(__name__)
CORS(app)

# -------------------------
# SIGNUP API
# -------------------------
@app.route("/signup", methods=["POST"])
def signup():
    data = request.json
    email=data.get("email")
    msg = register_user(
        email,
        email,
        data.get("password"),
        data.get("location"),
        data.get("security_question"),
        data.get("security_answer")
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

@app.route("/forgot-password/question", methods=["POST"])
def forgot_password_question():
    email = request.json.get("email")

    result = get_security_question_by_email(email)

    if not result:
        return jsonify({"status": "fail", "msg": "Email not found"})

    return jsonify({
        "status": "success",
        "question_id": result["question_id"],
        "question": result["question"]
    })


@app.route("/forgot-password/reset", methods=["POST"])
def forgot_password_reset():
    data = request.json

    response = reset_password_logic(
        data.get("email"),
        data.get("new_password")
    )

    return jsonify(response)


@app.route("/forgot-password/verify", methods=["POST"])
def forgot_password_verify():
    data = request.json

    return jsonify(
        verify_security_answer(
            data.get("email"),
            data.get("answer")
        )
    )


# -------------------------
# SERVER RUN
# -------------------------
if __name__ == "__main__":
    app.run(debug=True,use_reloader=False)
