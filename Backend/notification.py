import mysql.connector
from Backend.db_config import get_connection
from datetime import datetime
import smtplib
from email.mime.text import MIMEText


# -----------------------------
# SEND EMAIL FUNCTION
# -----------------------------
def send_event_email(to_email, username, event):
    subject = f"Upcoming Event: {event['ename']}"

    body = f"""
Hello {username},

An astronomical event is happening in your location!

Event Name: {event['ename']}
Type: {event['etype']}
Date: {event['event_date']}
Description: {event['description']}

Don't miss it! 🌙✨

Regards,
Interstellar Team
"""

    msg = MIMEText(body)
    msg["Subject"] = subject
    msg["From"] = "snehasmtptest1@gmail.com"
    msg["To"] = to_email

    server = smtplib.SMTP("smtp.gmail.com", 587)
    server.starttls()
    server.login("snehasmtptest1@gmail.com", "kezkduckvjgdiuoj")
    server.sendmail(msg["From"], [msg["To"]], msg.as_string())
    server.quit()


# -----------------------------
# MAIN NOTIFICATION LOGIC
# -----------------------------
def check_and_send_notifications():
    conn = get_connection()
    cur = conn.cursor()

    query = """
    SELECT 
        u.user_id,
        u.username,
        u.email,
        e.event_id,
        e.ename,
        e.etype,
        e.description,
        e.event_date
    FROM users u
    JOIN event_visibility ev ON u.location = ev.location
    JOIN events e ON ev.event_id = e.event_id
    WHERE 
        e.event_date >= CURDATE()
        AND e.event_date <= DATE_ADD(CURDATE(), INTERVAL 7 DAY)
        AND NOT EXISTS (
            SELECT 1 FROM notifications n
            WHERE n.user_id = u.user_id
            AND n.event_id = e.event_id
        )
    """

    cur.execute(query)
    rows = cur.fetchall()

    for row in rows:
        user_id, username, email, event_id, ename, etype, description, event_date = row

        event_data = {
            "ename": ename,
            "etype": etype,
            "description": description,
            "event_date": event_date
        }

        # Send Email
        send_event_email(email, username, event_data)

        # Store Notification
        cur.execute("""
            INSERT INTO notifications (user_id, event_id, prediction_id, sent_at, status)
            VALUES (%s, %s, %s, %s, %s)
        """, (
            user_id,
            event_id,
            None,
            datetime.now(),
            "sent"
        ))

    conn.commit()
    cur.close()
    conn.close()