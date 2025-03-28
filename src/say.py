#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Say-Salomon for Eden AI - Python Version
#
# Copyright (C) 2025 Siergej Sobolewski <s.sobolewski@hotmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.

import json
import requests

class SaySalomon:
    def __init__(self, api_key):
        self.api_key = api_key
        self.headers = {"Authorization": f"Bearer {self.api_key}"}

    # Function to convert text to speech
    def text_to_speech(self, text):
        url = "https://api.edenai.run/v2/audio/text_to_speech"
        payload = {
            "providers": "google,amazon",
            "language": "en-US",
            "option": "MALE",
            "text": text
        }
        response = requests.post(url, json=payload, headers=self.headers)
        result = json.loads(response.text)
        return result['google']['audio']

    # Function to convert text to speech asynchronously
    def text_to_speech_async(self, text):
        url = "https://api.edenai.run/v2/audio/text_to_speech_async"
        payload = {
            "providers": "lovoai",
            "language": "en-US",
            "option": "MALE",
            "text": text
        }
        response = requests.post(url, json=payload, headers=self.headers)
        result = json.loads(response.text)
        return result

    # Function to translate text
    def translate(self, text, source_language="en", target_lang="ru"):
        url = "https://api.edenai.run/v2/translation/automatic_translation"
        payload = {
            "providers": "google,amazon",
            "source_language": source_language,
            "target_language": target_lang,
            "text": text
        }
        response = requests.post(url, json=payload, headers=self.headers)
        result = json.loads(response.text)
        return result['google']['text']

    # Function to transcribe speech to text asynchronously
    def speech_to_text_async(self, file_url):
        url = "https://api.edenai.run/v2/audio/speech_to_text_async"
        payload = {
            "providers": "google, amazon",
            "language": "en-US",
            "file_url": file_url
        }
        response = requests.post(url, json=payload, headers=self.headers)
        result = json.loads(response.text)
        return result

    # Function for text generation
    def generate_text(self):
        url = "https://api.edenai.run/v2/text/generation"
        payload = {
            "providers": "openai,cohere",
            "text": "this is a test of Eden AI",
            "temperature": 0.2,
            "max_tokens": 250
        }
        response = requests.post(url, json=payload, headers=self.headers)
        result = json.loads(response.text)
        return result['openai']['generated_text']

    # Function for spell check
    def spell_check(self, text):
        url = "https://api.edenai.run/v2/text/spell_check"
        payload = {
            "providers": "openai,microsoft",
            "language": "en",
            "text": text
        }
        response = requests.post(url, json=payload, headers=self.headers)
        result = json.loads(response.text)
        return result['openai']['items']

# Example usage
if __name__ == "__main__":
    api_key = "🔑 Your_API_Key"
    say = SaySalomon(api_key)
    text = "Hello, how are you?"
    
    audio = say.text_to_speech(text)
    print("Audio URL:", audio)
    
    translated = say.translate(text, "en", "fr")
    print("Translated Text:", translated)
    
    file_url = "🔗 URL of your audio"
    transcription = say.speech_to_text_async(file_url)
    print("Transcription:", transcription)
    
    generated_text = say.generate_text()
    print("Generated Text:", generated_text)
    
    spell_checked = say.spell_check(text)
    print("Spell Check:", spell_checked)
