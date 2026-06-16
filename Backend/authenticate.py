import smtplib
from email.mime.text import MIMEText
import random
from datetime import datetime, timedelta

# Store OTPs here temporarily
otp_storage = {}

def send_valid_email(user_email, action):

    otp = str(random.randint(100000, 999999))

    otp_storage[user_email] = {
        "otp": otp,
        "time": datetime.now(),
        "action": action
    }

    our_email = "snehasmtptest1@gmail.com"
    password = "kezkduckvjgdiuoj"

    body = f"""Welcome to Interstellar!
This is your OTP for {action}.
Please do not share with anyone.

{otp}

This OTP is valid for 5 minutes.
"""

    msg = MIMEText(body, "plain")
    msg["Subject"] = f"Interstellar OTP for {action}"
    msg["From"] = our_email
    msg["To"] = user_email

    try:
        print("STEP 1")
        server = smtplib.SMTP_SSL("smtp.gmail.com", 465, timeout=10)

        print("STEP 2")
        server.login(our_email, password)

        print("STEP 3")
        server.send_message(msg)

        print("STEP 4")
        server.quit()
    
        return True

    except Exception as e:
        print("SMTP ERROR:", str(e))
        raise


def otp_validation(user_email, action, user_otp):

    if user_email not in otp_storage:
        return False

    data = otp_storage[user_email]

    # check action match
    if data["action"] != action:
        return False

    # check time validity
    if datetime.now() - data["time"] > timedelta(minutes=5):
        del otp_storage[user_email]
        return False

    # check OTP
    if data["otp"] == user_otp.strip():
        del otp_storage[user_email]  # remove after success
        return True

    return False