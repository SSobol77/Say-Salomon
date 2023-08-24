# Say-Salomon for Eden AI
## Integration of Eden AI code for C++, Java, Python, Javascript, Ruby, Ruby in one file.

**What does the code do:**
* Text To Speech
* Text To Speech Async
* Speech To Text Async
* Automatic Translation
* Generation
* Spell Check


Eden AI provides code integration for asynchronous text-to-speech conversion, asynchronous speech-to-text conversion, and automatic translation. 

&nbsp;

To use these functions, previously you had to perform the following steps in the case of Python:

**Install the Eden AI Library:** Before starting the integration, make sure you have the Eden AI library installed. 

You can do this using a package manager like pip:

``$ pip install edenai``

**Import the Library in Your Code:**
For asynchronous text-to-speech conversion:

```
import edenai

# Replace 'YOUR_API_KEY' with your Eden AI API key
api_key = 'YOUR_API_KEY'
client = edenai.TextToSpeech(api_key=api_key)

# Input text and retrieve audio
response = client.text_to_speech(text='Hello, world!')
audio_url = response['audio_url']
```

**For asynchronous speech-to-text conversion:**
```
import edenai

# Replace 'YOUR_API_KEY' with your Eden AI API key
api_key = 'YOUR_API_KEY'
client = edenai.SpeechToText(api_key=api_key)

# Input audio and retrieve text
response = client.speech_to_text(audio_url='URL_of_your_audio')
text = response['text']
```

**For automatic translation:**
```
import edenai

# Replace 'YOUR_API_KEY' with your Eden AI API key
api_key = 'YOUR_API_KEY'
client = edenai.Translation(api_key=api_key)

# Translate text to another language
response = client.translate(text='Hello, world!', target_lang='ru')
translated_text = response['translated_text']
```
&nbsp;

**I suggest making it easier by integrating one of my files into your code:**

* **С++** - file ``say.cpp``

* **Java** - file ``say.java``

* **JavaScript** - file ``say.js``

* **Python** - file ``say.py``

* **Rust** - file ``say.rs``

* **Ruby** - file ``say.ruby``



Please note that in the code above, you should replace 'YOUR_API_KEY' with your own Eden AI API key. After making the respective requests, you will receive results in JSON format from which you can extract the required data.

Remember to handle possible errors and exceptions when making requests to the Eden AI API.





