/*
 * Say-Salomon for Eden AI - JavaScript Version
 *
 * Copyright (C) 2025 Siergej Sobolewski <s.sobolewski@hotmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */

const fetch = require('node-fetch');

const API_KEY = "Your_API_Key";
const headers = {"Authorization": `Bearer ${API_KEY}`, "Content-Type": "application/json"};

// Function to convert text to speech
async function text_to_speech(text) {
    const url = "https://api.edenai.run/v2/audio/text_to_speech";
    const payload = { providers: "google,amazon", language: "en-US", option: "MALE", text: text };
    const response = await fetch(url, {
        method: 'POST',
        headers: headers,
        body: JSON.stringify(payload)
    });
    const result = await response.json();
    return result.google.audio;
}

// Function to convert text to speech asynchronously
async function text_to_speech_async(text) {
    const url = "https://api.edenai.run/v2/audio/text_to_speech_async";
    const payload = { providers: "lovoai", language: "en-US", option: "MALE", text: text };
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
    const url = "https://api.edenai.run/v2/translation/automatic_translation";
    const payload = { providers: "google,amazon", source_language: source_language, target_language: target_language, text: text };
    const response = await fetch(url, {
        method: 'POST',
        headers: headers,
        body: JSON.stringify(payload)
    });
    const result = await response.json();
    return result.google.text;
}

// Function for speech to text conversion asynchronously
async function speech_to_text_async(file_url) {
    const url = "https://api.edenai.run/v2/audio/speech_to_text_async";
    const payload = { providers: "google, amazon", language: "en-US", file_url: file_url };
    const response = await fetch(url, {
        method: 'POST',
        headers: headers,
        body: JSON.stringify(payload)
    });
    const result = await response.json();
    return result;
}

// Function for text generation
async function generate_text() {
    const url = "https://api.edenai.run/v2/text/generation";
    const payload = { providers: "openai,cohere", text: "this is a test of Eden AI", temperature: 0.2, max_tokens: 250 };
    const response = await fetch(url, {
        method: 'POST',
        headers: headers,
        body: JSON.stringify(payload)
    });
    const result = await response.json();
    return result.openai.generated_text;
}

// Function for spell check
async function spell_check(text) {
    const url = "https://api.edenai.run/v2/text/spell_check";
    const payload = { providers: "openai,microsoft", language: "en", text: text };
    const response = await fetch(url, {
        method: 'POST',
        headers: headers,
        body: JSON.stringify(payload)
    });
    const result = await response.json();
    return result.openai.items;
}

// Example usage
(async () => {
    const text = "Hello, how are you?";
    const audio = await text_to_speech(text);
    console.log("Audio URL:", audio);

    const ttsAsync = await text_to_speech_async(text);
    console.log("Text-to-Speech Async:", ttsAsync);

    const translated = await automatic_translation(text, "en", "fr");
    console.log("Translated Text:", translated);

    const file_url = "🔗 URL of your audio file";
    const transcription = await speech_to_text_async(file_url);
    console.log("Transcription:", transcription);

    const generatedText = await generate_text();
    console.log("Generated Text:", generatedText);

    const spellChecked = await spell_check(text);
    console.log("Spell Check:", spellChecked);
})();
