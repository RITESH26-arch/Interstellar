import re, hashlib, uuid
from Backend.db_config import get_connection

sessions = {}

def validate_email(email):
    return re.match(r'^[\w\.-]+@[\w\.-]+\.\w+$', email)

def hash_password(password):
    return hashlib.sha256(password.encode()).hexdigest()

def register_user(name, email, password, location):
    if not validate_email(email):
        return {"status":"fail","msg":"Invalid Email"}
    if len(password) < 6:
        return {"status":"fail","msg":"Weak Password"}

    conn = get_connection()
    cur = conn.cursor()
    try:
        cur.execute(
            "INSERT INTO users(username,email,password,location) VALUES(%s,%s,%s,%s)",
            (name, email, hash_password(password), location)
        )
        conn.commit()
        return {"status":"success"}
    except Exception as e:
        return {"status":"fail","msg":str(e)}
    finally:
        conn.close()

        
def login_user(email, password):
    conn = get_connection()
    cur = conn.cursor()

    cur.execute("SELECT user_id, password FROM users WHERE email=%s", (email,))
    user = cur.fetchone()

    if not user:
        conn.close()
        return {"status":"fail","msg":"User not found"}

    if user[1] != hash_password(password):
        conn.close()
        return {"status":"fail","msg":"Wrong password"}

    token = str(uuid.uuid4())
    sessions[token] = user[0]
    conn.close()

    return {"status":"success","token":token}
