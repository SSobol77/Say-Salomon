from src.say import SaySalomon

say = SaySalomon("🔑 Your_API_Key")

# Convert text to speech
audio_url = say.text_to_speech("Hello, world!")
print("Audio URL:", audio_url)

# Translate text
translated = say.translate("Hello", "en", "fr")
print("Translated:", translated)

# Speech to text
file_url = "🔗 URL of your audio file"
transcription = say.speech_to_text_async(file_url)
print("Transcription:", transcription)

# Generate text
generated = say.generate_text()
print("Generated Text:", generated)

# Spell check
spell = say.spell_check("Hello, how are you?")
print("Spell Check:", spell)
