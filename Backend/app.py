from flask import Flask, request, jsonify
from flask_cors import CORS
import mysql.connector

from Backend.login_logic import (
    register_user,
    login_user,
    sessions,
    get_security_question_by_email,
    reset_password_logic,
    verify_security_answer
)

from Backend.authenticate import send_valid_email, otp_validation

from flask import send_from_directory

app = Flask(__name__, static_folder="../Frontend", static_url_path="")
CORS(app)
# -------------------------
# SERVE FRONTEND FILES
# -------------------------

@app.route("/")
def serve_home():
    return send_from_directory(app.static_folder, "index.html")


@app.route("/<path:filename>")
def serve_static_files(filename):
    return send_from_directory(app.static_folder, filename)


# -------------------------
# SEND OTP API
# -------------------------
@app.route("/send-otp", methods=["POST"])
def send_otp():
    data = request.json

    email = data.get("email")
    action = data.get("action")  # signup / login / forgot

    if not email:
        return jsonify({"status": "fail", "msg": "Email required"})

    send_valid_email(email, action)
    return jsonify({
        "status": "success",
        "msg": "OTP sent successfully"
    })


# -------------------------
# VERIFY OTP API
# -------------------------
@app.route("/verify-otp", methods=["POST"])
def verify_otp_route():
    data = request.json

    email = data.get("email")
    action = data.get("action")
    otp = data.get("otp")

    if otp_validation(email, action,otp):
        return jsonify({"status": "success"})
    else:
        return jsonify({
            "status": "fail",
            "msg": "Invalid or expired OTP"
        })


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

    result = login_user(
        data.get("email"),
        data.get("password")
    )

    return jsonify(result)


# -------------------------
# FORGOT PASSWORD - GET QUESTION
# -------------------------
@app.route("/forgot-password/question", methods=["POST"])
def forgot_password_question():
    email = request.json.get("email")

    result = get_security_question_by_email(email)

    if not result:
        return jsonify({
            "status": "fail",
            "msg": "Email not found"
        })

    return jsonify({
        "status": "success",
        "question_id": result["question_id"],
        "question": result["question"]
    })


# -------------------------
# VERIFY SECURITY ANSWER
# -------------------------
@app.route("/forgot-password/verify", methods=["POST"])
def forgot_password_verify():
    data = request.json

    return jsonify(
        verify_security_answer(
            data.get("email"),
            data.get("answer")
        )
    )


@app.route("/forgot-password/reset", methods=["POST"])
def forgot_password_reset():
    try:
        data = request.json
        email = data.get("email")
        new_password = data.get("new_password")

        if not email or not new_password:
            return jsonify({"status": "fail", "msg": "Missing email or password"}), 400

        response = reset_password_logic(email, new_password)
        return jsonify(response)  # always jsonify

    except Exception as e:
        import traceback
        print(traceback.format_exc())
        return jsonify({"status": "fail", "msg": "Server error"}), 500




# -------------------------
# EVENTS API
# -------------------------
@app.route("/Events", methods=["GET"])
def get_events():

    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",   # agar password hai to yaha daal
        database="interstellar_database"
    )

    cursor = conn.cursor(dictionary=True)

    cursor.execute("""
        SELECT event_id, ename, etype, description, event_date, frequency
        FROM events
        ORDER BY event_date ASC
    """)

    events = cursor.fetchall()

    cursor.close()
    conn.close()

    return jsonify(events)

# -------------------------
# RUN SERVER
# -------------------------
if __name__ == "__main__":
    app.run(debug=True, use_reloader=False)