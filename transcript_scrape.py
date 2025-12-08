from flask import Flask, render_template, request
import json
import os
from dotenv import load_dotenv, dotenv_values
from youtube_transcript_api import YouTubeTranscriptApi

app = Flask(__name__)
load_dotenv()
ytt_api = YouTubeTranscriptApi()

@app.route("/", methods=["POST", "GET"])
def link():

    transcript = None
    
    
    if request.method == "POST":
        link = request.form.get("link")
    try:
        video_id = link.replace("https://www.youtube.com/watch?v=","")
        transcript = ytt_api.fetch(video_id)
    except Exception as e:
        error = str(e)
    
    return render_template("index.html", transcript=transcript)

if __name__ == "__main__":
    app.run(debug=True)