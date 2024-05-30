import cx_Oracle
import time
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

smtp_server = 'smtp.gmail.com'
smtp_port = 587
smtp_username = 'something@gmail.com'
smtp_password = '1234 5678 qqqq wwww'

sender_email = 'something@gmail.com'
receiver_email = 'rec@yandex.by'

db_user = 'system'
db_password = 'Syspassword'
db_dsn = 'localhost/pkrama_cw.mshome.net'

def connect_to_db():
    try:
        connection = cx_Oracle.connect(db_user, db_password, db_dsn, encoding="UTF-8")
        print("Connected to the database successfully!")
        return connection
    except cx_Oracle.Error as error:
        print("Error connecting to the database:", error)
        return None

def send_email_notification(ORDER_ID, ORDERER, COST):
    message = MIMEMultipart()
    message['From'] = sender_email
    message['To'] = receiver_email
    message['Subject'] = 'New Order Added'
    body = f'"{ORDERER}" made a new order\n'
    body += f'Order Id: {ORDER_ID}\n'
    body += f'Cost: {COST}'
    message.attach(MIMEText(body, 'plain'))
    try:
        with smtplib.SMTP(smtp_server, smtp_port) as server:
            server.starttls()
            server.login(smtp_username, smtp_password)
            server.sendmail(sender_email, receiver_email, message.as_string())
        print("Email notification sent successfully!")
        return True
    except Exception as e:
        print("Error sending email notification:", e)
        return False

def check_orders(connection):
    try:
        cursor = connection.cursor()
        cursor.execute(f"SELECT COUNT(*) FROM C##DEVELOPER.ORDERS")
        prev_count = cursor.fetchone()[0]
        while True:
            time.sleep(1)
            cursor.execute(f"SELECT COUNT(*) FROM C##DEVELOPER.ORDERS")
            current_count = cursor.fetchone()[0]
            if current_count > prev_count:
                cursor.execute(f"SELECT * FROM C##DEVELOPER.ORDERS WHERE ORDER_ID = :new_rows", {'new_rows': current_count - 1})
                new_orders = cursor.fetchall()
                for order in new_orders:
                    ORDER_ID, ORDERER, _, _, COST, *_ = order
                    send_email_notification(ORDER_ID, ORDERER, COST)
                prev_count = current_count
    except Exception as e:
        print("Error:", e)
    finally:
        cursor.close()

def main():
    connection = connect_to_db()
    if connection:
        check_orders(connection)
        connection.close()

if __name__ == "__main__":
    main()
