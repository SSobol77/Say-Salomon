require_relative '../src/say.ruby'

# Convert text to speech
audio = SaySalomon.text_to_speech("Hello, world!")
puts "Audio URL: #{audio}"

# Translate text
translated = SaySalomon.automatic_translation("Hello", "en", "fr")
puts "Translated: #{translated}"

# Speech to text
transcription = SaySalomon.speech_to_text_async("🔗 URL of your audio file")
puts "Transcription: #{transcription}"

# Generate text
generated = SaySalomon.generate_text
puts "Generated Text: #{generated}"

# Spell check
spell = SaySalomon.spell_check("Hello, how are you?")
puts "Spell Check: #{spell}"
