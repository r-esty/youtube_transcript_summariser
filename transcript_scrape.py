from flask import Flask, render_template, request
import json

import os
from dotenv import load_dotenv,dotenv_values

app = Flask(__name__)

@app.route("/", methods=["POST", "GET"])
def link():

    if request.method == "POST" :
        link = request.form.get("link")
        print(link)
       

    return render_template("index.html")

load_dotenv()

print(os.getenv("api_key")) 
#