const say = require('../src/say.js');

// Convert text to speech
say.text_to_speech("Hello, world!").then(audio => {
    console.log("Audio URL:", audio);
});

// Translate text
say.automatic_translation("Hello", "en", "fr").then(translated => {
    console.log("Translated:", translated);
});

// Speech to text
say.speech_to_text_async("🔗 URL of your audio file").then(result => {
    console.log("Transcription:", result);
});

// Generate text
say.generate_text().then(text => {
    console.log("Generated Text:", text);
});

// Spell check
say.spell_check("Hello, how are you?").then(result => {
    console.log("Spell Check:", result);
});
