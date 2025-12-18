from flask import Flask, render_template, request
import json
import os
from dotenv import load_dotenv, dotenv_values
from youtube_transcript_api import YouTubeTranscriptApi
from openai import OpenAI

load_dotenv()
client = OpenAI(
    api_key=os.getenv("OPENAI_API_KEY")
)
app = Flask(__name__)
ytt_api = YouTubeTranscriptApi()

@app.route("/", methods=["POST", "GET"])
def link():
    transcript = None
    summary = None
    
    if request.method == "POST":
        youtube_link = request.form.get("link")
        try:
            video_id = youtube_link.replace("https://www.youtube.com/watch?v=","").split("&")[0]
            transcript = ytt_api.fetch(video_id)
            
            response = client.responses.create(
                model="gpt-4o",
                input=f"Give a short but detailed summary of {transcript}. However if the transcript is none then just greet and ask them to give a Youtube link with transcript use the word transcript enabled so that you can provide a summary of the Youtube video"
            )
            summary = response.output_text
            print(response.output_text)
        except Exception as e:
            print(f"Error: {e}")
            summary = "Hi! Please share a YouTube link **that has transcript enabled**, and I'll give you a short but detailed summary of the video."
    
    return render_template("index.html", transcript=transcript, summary=summary)

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')