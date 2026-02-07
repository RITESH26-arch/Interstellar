import re, hashlib, uuid
from Backend.db_config import get_connection
import mysql.connector

sessions = {}

def validate_email(email):
    return re.match(r'^[\w\.-]+@[\w\.-]+\.\w+$', email)

def hash_password(password):
    return hashlib.sha256(password.encode()).hexdigest()

def verify_password(input_value, stored_hash):
    return hash_password(input_value) == stored_hash

#register user
def register_user(name, email, password, location, question_id, answer):

    if not validate_email(email):
        return {"status": "fail", "msg": "Invalid Email"}

    conn = get_connection()
    cur = conn.cursor()

    try:
        cur.execute(
            "INSERT INTO users (username, email, password, location) VALUES (%s, %s, %s, %s)",
            (name, email, hash_password(password), location)
        )

        user_id = cur.lastrowid

        cur.execute(
            """
            INSERT INTO user_security (user_id, question_id, answer)
            VALUES (%s, %s, %s)
            """,
            (user_id, question_id, hash_password(answer))
        )

        conn.commit()
        return {"status": "success"}

    except mysql.connector.IntegrityError as e:
        conn.rollback()

        if e.errno == 1062:
            return {"status": "fail", "msg": "User already exists"}
        else:
            return {"status": "fail", "msg": "Database error"}

    finally:
        conn.close()


# login 
        
def login_user(email, password):
    conn = get_connection()
    cur = conn.cursor()

    cur.execute("SELECT user_id, password FROM users WHERE email=%s", (email,))
    user = cur.fetchone()

    if not user:
        conn.close()
        return {"status":"fail","msg":"User not found"}

    if  not verify_password(password,user[1]):
        conn.close()
        return {"status":"fail","msg":"Wrong password"}

    token = str(uuid.uuid4())
    sessions[token] = user[0]
    conn.close()

    return {"status":"success","token":token}

#Fetching security question

def get_security_question_by_email(email):
    conn = get_connection()
    cur = conn.cursor(dictionary=True)

    try:
        cur.execute("""
            SELECT sq.id AS question_id, sq.question
            FROM users u
            JOIN user_security us ON u.user_id = us.user_id
            JOIN security_questions sq ON us.question_id = sq.id
            WHERE u.email = %s
        """, (email,))

        return cur.fetchone()

    finally:
        conn.close()

#checking is answer is correct 

def verify_security_answer(email, answer):
    conn = get_connection()
    cur = conn.cursor()

    try:
        cur.execute("""
            SELECT us.answer
            FROM users u
            JOIN user_security us ON u.user_id = us.user_id
            WHERE u.email = %s
        """, (email,))

        row = cur.fetchone()

        if not row:
            return {"status": "fail", "msg": "User not found"}

        if verify_password(answer, row[0]):
            return {"status": "success"}

        return {"status": "fail", "msg": "Incorrect security answer"}

    finally:
        conn.close()

#Re-setting password

def reset_password_logic(email, new_password):
    if len(new_password) < 6:
        return {"status": "fail", "msg": "Password too short"}

    conn = get_connection()
    cur = conn.cursor()

    try:
        cur.execute(
            "UPDATE users SET password = %s WHERE email = %s",
            (hash_password(new_password), email)
        )

        if cur.rowcount == 0:
            return {"status": "fail", "msg": "Email not found"}

        conn.commit()
        return {"status": "success", "msg": "Password updated"}

    except Exception as e:
        conn.rollback()
        return {"status": "fail", "msg": str(e)}

    finally:
        conn.close()

