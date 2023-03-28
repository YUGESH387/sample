import tkinter as tk
import sqlite3
from tkinter import *


def submitact():
	username = Username.get()
	psw = password.get()
	login(username,psw)
def login(username,psw):
    conn.execute("SELECT * FROM user WHERE username = ? AND password = ?", (username, psw))
    result = cursor.fetchone()
    if result:
        print("Login successful!")
        a = tk.Label(root, text ="LOGIN SUCCESSFULLY")
        a.place(x = 80, y = 100,width =100)
    else:
        print("Invalid username or password.")
conn = sqlite3.connect('example.db')
cursor=conn.execute("select * from user")
conn.commit()


root = tk.Tk()
root.geometry("300x300")
root.title("DBMS Login Page")
lblfrstrow = tk.Label(root, text ="Username:", )
lblfrstrow.place(x = 50, y = 20)
Username = tk.Entry(root, width = 35)
Username.place(x = 150, y = 20, width = 100)
lblsecrow = tk.Label(root, text ="Password:")
lblsecrow.place(x = 50, y = 50)
password = tk.Entry(root, width = 35)
password.place(x = 150, y = 50, width = 100)
submitbtn = tk.Button(root, text ="Login",
					bg ='blue', command = submitact)
submitbtn.place(x = 150, y = 135, width = 55)
root.mainloop()
conn.close()
