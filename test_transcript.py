from googleapiclient.discovery import build
import os

API_KEY = os.getenv("YOUTUBE_API_KEY")
youtube = build('youtube', 'v3', developerKey=API_KEY)

video_id = "jNQXAC9IVRw"

try:
    # Get caption list
    request = youtube.captions().list(
        videoId=video_id,
        part='snippet'
    )
    captions = request.execute()
    
    # Find English caption track
    caption_id = None
    for item in captions['items']:
        if item['snippet']['language'] == 'en':
            caption_id = item['id']
            break
    
    if caption_id:
        # Download the actual caption text
        caption_request = youtube.captions().download(
            id=caption_id,
            tfmt='srt'  # or 'vtt'
        )
        caption_text = caption_request.execute().decode('utf-8')
        print("Transcript:")
        print(caption_text[:500])  # First 500 chars
    
except Exception as e:
    print(f"Error: {e}")