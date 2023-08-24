# Say-Salomon

import json
import requests

# Function to convert text to speech
def text_to_speech(text):
    headers = {"Authorization": "Bearer 🔑 Your_API_Key"}
    url = "https://api.edenai.run/v2/audio/text_to_speech"
    payload = {"providers": "google,amazon", "language": "en-US", "option": "MALE", "text": text}
    response = requests.post(url, json=payload, headers=headers)
    result = json.loads(response.text)
    return result['google']['audio']

# Function to convert text to speech asynchronously
def text_to_speech_async(text):
    headers = {"Authorization": "Bearer 🔑 Your_API_Key"}
    url = "https://api.edenai.run/v2/audio/text_to_speech_async"
    payload = {"providers": "lovoai", "language": "en-US", "option": "MALE", "text": text}
    response = requests.post(url, json=payload, headers=headers)
    result = json.loads(response.text)
    return result

# Function to translate text
def translate_text(text, source_language, target_language):
    headers = {"Authorization": "Bearer 🔑 Your_API_Key"}
    url = "https://api.edenai.run/v2/translation/automatic_translation"
    payload = {"providers": "google,amazon", 'source_language': source_language, 'target_language': target_language, 'text': text}
    response = requests.post(url, json=payload, headers=headers)
    result = json.loads(response.text)
    return result['google']['text']

# Function to transcribe speech to text asynchronously
def speech_to_text_async(file_url):
    headers = {"Authorization": "Bearer 🔑 Your_API_Key"}
    url = "https://api.edenai.run/v2/audio/speech_to_text_async"
    payload = {"providers": "google, amazon", "language": "en-US", "file_url": file_url}
    response = requests.post(url, json=payload, headers=headers)
    result = json.loads(response.text)
    return result

# Example usage
text = "This is a test"
audio = text_to_speech(text)
print(audio)

translated_text = translate_text(text, "en", "fr")
print(translated_text)

file_url = "🔗 URL of your audio"
transcription = speech_to_text_async(file_url)
print(transcription)
