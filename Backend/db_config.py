import mysql.connector

def get_connection():
    return mysql.connector.connect(
        host="thomas.proxy.rlwy.net",
        user="root",
        password="iySoXjLudJRRJpBQzFKVCDHeruqhPzuv",
        port=23368,
        database="railway"
    )