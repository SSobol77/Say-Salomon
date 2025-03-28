/*
 * Say-Salomon for Eden AI - Rust Version
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

use reqwest::header::{HeaderMap, AUTHORIZATION, CONTENT_TYPE};
use serde_json::json;

// Function to convert text to speech
pub async fn text_to_speech(text: &str) -> Result<String, reqwest::Error> {
    let url = "https://api.edenai.run/v2/audio/text_to_speech";
    let payload = json!({
        "providers": "google,amazon",
        "language": "en-US",
        "option": "MALE",
        "text": text
    });

    let mut headers = HeaderMap::new();
    headers.insert(AUTHORIZATION, "Bearer 🔑 Your_API_Key".parse().unwrap());
    headers.insert(CONTENT_TYPE, "application/json".parse().unwrap());

    let client = reqwest::Client::new();
    let response = client
        .post(url)
        .headers(headers)
        .json(&payload)
        .send()
        .await?;

    let result: serde_json::Value = response.json().await?;
    Ok(result["google"]["audio"].to_string())
}

// Function to convert text to speech asynchronously
pub async fn text_to_speech_async(text: &str) -> Result<serde_json::Value, reqwest::Error> {
    let url = "https://api.edenai.run/v2/audio/text_to_speech_async";
    let payload = json!({
        "providers": "lovoai",
        "language": "en-US",
        "option": "MALE",
        "text": text
    });

    let client = reqwest::Client::new();
    let response = client.post(url).json(&payload)
        .header(AUTHORIZATION, "Bearer 🔑 Your_API_Key")
        .send()
        .await?;

    let result: serde_json::Value = response.json().await?;
    Ok(result)
}

// Function for automatic translation
pub async fn automatic_translation(
    text: &str,
    source_language: &str,
    target_language: &str,
) -> Result<String, reqwest::Error> {
    let url = "https://api.edenai.run/v2/translation/automatic_translation";
    let payload = json!({
        "providers": "google,amazon",
        "source_language": source_language,
        "target_language": target_language,
        "text": text
    });

    let client = reqwest::Client::new();
    let response = client.post(url).json(&payload)
        .header(AUTHORIZATION, "Bearer 🔑 Your_API_Key")
        .send()
        .await?;

    let result: serde_json::Value = response.json().await?;
    Ok(result["google"]["text"].to_string())
}

// Function for speech to text conversion asynchronously
pub async fn speech_to_text_async(file_url: &str) -> Result<serde_json::Value, reqwest::Error> {
    let url = "https://api.edenai.run/v2/audio/speech_to_text_async";
    let payload = json!({
        "providers": "google, amazon",
        "language": "en-US",
        "file_url": file_url
    });

    let client = reqwest::Client::new();
    let response = client.post(url).json(&payload)
        .header(AUTHORIZATION, "Bearer 🔑 Your_API_Key")
        .send()
        .await?;

    let result: serde_json::Value = response.json().await?;
    Ok(result)
}

// Function for text generation
pub async fn generate_text() -> Result<String, reqwest::Error> {
    let url = "https://api.edenai.run/v2/text/generation";
    let payload = json!({
        "providers": "openai,cohere",
        "text": "this is a test of Eden AI",
        "temperature": 0.2,
        "max_tokens": 250
    });

    let client = reqwest::Client::new();
    let response = client.post(url).json(&payload)
        .header(AUTHORIZATION, "Bearer 🔑 Your_API_Key")
        .send()
        .await?;

    let result: serde_json::Value = response.json().await?;
    Ok(result["openai"]["generated_text"].to_string())
}

// Function for spell check
pub async fn spell_check(text: &str) -> Result<serde_json::Value, reqwest::Error> {
    let url = "https://api.edenai.run/v2/text/spell_check";
    let payload = json!({
        "providers": "openai,microsoft",
        "language": "en",
        "text": text
    });

    let client = reqwest::Client::new();
    let response = client.post(url).json(&payload)
        .header(AUTHORIZATION, "Bearer 🔑 Your_API_Key")
        .send()
        .await?;

    let result: serde_json::Value = response.json().await?;
    Ok(result["openai"]["items"].to_owned())
}

#[tokio::main]
async fn main() {
    let text = "Hello, how are you?";

    match text_to_speech(text).await {
        Ok(audio) => println!("Audio URL: {}", audio),
        Err(e) => eprintln!("Error in text_to_speech: {:?}", e),
    }

    match automatic_translation(text, "en", "fr").await {
        Ok(translated) => println!("Translated Text: {}", translated),
        Err(e) => eprintln!("Error in automatic_translation: {:?}", e),
    }

    let file_url = "🔗 URL of your audio file";
    match speech_to_text_async(file_url).await {
        Ok(transcription) => println!("Transcription: {:?}", transcription),
        Err(e) => eprintln!("Error in speech_to_text_async: {:?}", e),
    }

    match generate_text().await {
        Ok(generated) => println!("Generated Text: {}", generated),
        Err(e) => eprintln!("Error in generate_text: {:?}", e),
    }

    match spell_check(text).await {
        Ok(spell_checked) => println!("Spell Check: {:?}", spell_checked),
        Err(e) => eprintln!("Error in spell_check: {:?}", e),
    }
}
