const fetch = require('node-fetch');

// Function to convert text to speech
async function text_to_speech(text) {
    const headers = {"Authorization": "Bearer 🔑 Your_API_Key"};
    const url = "https://api.edenai.run/v2/audio/text_to_speech";
    const payload = {"providers": "google,amazon", "language": "en-US", "option": "MALE", "text": text};
    const response = await fetch(url, {
        method: 'POST',
        headers: headers,
        body: JSON.stringify(payload)
    });
    const result = await response.json();
    return result['google']['audio'];
}

// Function to convert text to speech asynchronously
async function text_to_speech_async(text) {
    const headers = {"Authorization": "Bearer 🔑 Your_API_Key"};
    const url = "https://api.edenai.run/v2/audio/text_to_speech_async";
    const payload = {"providers": "lovoai", "language": "en-US", "option": "MALE", "text": text};
    const response = await fetch(url, {
        method: 'POST',
        headers: headers,
        body: JSON.stringify(payload)
    });
    const result = await response.json();
    return result;
}

// Function for automatic translation
async function automatic_translation(text, source_language, target_language) {
    const headers = {"Authorization": "Bearer 🔑 Your_API_Key"};
    const url = "https://api.edenai.run/v2/translation/automatic_translation";
    const payload = {"providers": "google,amazon", 'source_language': source_language, 'target_language': target_language, 'text': text};
    const response = await fetch(url, {
        method: 'POST',
        headers: headers,
        body: JSON.stringify(payload)
    });
    const result = await response.json();
    return result['google']['text'];
}

// Function for speech to text conversion
async function speech_to_text_async(file_url) {
    const headers = {"Authorization": "Bearer 🔑 Your_API_Key"};
    const url = "https://api.edenai.run/v2/audio/speech_to_text_async";
    const json_payload = {"providers": "google, amazon", "language": "en-US", "file_url": file_url};
    const response = await fetch(url, {
        method: 'POST',
        headers: headers,
        body: JSON.stringify(json_payload)
    });
    const result = await response.json();
    return result;
}

// Function for text generation
async function generate_text() {
    const headers = {"Authorization": "Bearer 🔑 Your_API_Key"};
    const url = "https://api.edenai.run/v2/text/generation";
    const payload = {
        "providers": "openai,cohere",
        "text": "this is a test of Eden AI",
        "temperature": 0.2,
        "max_tokens": 250
    };
    const response = await fetch(url, {
        method: 'POST',
        headers: headers,
        body: JSON.stringify(payload)
    });
    const result = await response.json();
    return result['openai']['generated_text'];
}

// Function for spell check
async function spell_check(text) {
    const headers = {"Authorization": "Bearer 🔑 Your_API_Key"};
    const url = "https://api.edenai.run/v2/text/spell_check";
    const payload = {"providers": "openai,microsoft", "language": "en", "text": text};
    const response = await fetch(url, {
        method: 'POST',
        headers: headers,
        body: JSON.stringify(payload)
    });
    const result = await response.json();
    return result['openai']['items'];
}

// Example usage
const text = "Hello, how are you?";
text_to_speech(text)
    .then(audio => console.log(audio));

const translated_text = automatic_translation(text, "en", "fr");
console.log(translated_text);

const file_url = "🔗 URL of your audio file";
speech_to_text_async(file_url)
    .then(transcribed_text => console.log(transcribed_text));

generate_text()
    .then(generated_text => console.log(generated_text));

spell_check(text)
    .then(spell_checked_text => console.log(spell_checked_text));
