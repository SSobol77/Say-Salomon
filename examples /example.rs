mod say;
use say::*;

#[tokio::main]
async fn main() {
    let text = "Hello, world!";

    // Convert text to speech
    if let Ok(audio) = text_to_speech(text).await {
        println!("Audio URL: {}", audio);
    }

    // Translate text
    if let Ok(translated) = automatic_translation(text, "en", "fr").await {
        println!("Translated: {}", translated);
    }

    // Speech to text
    if let Ok(transcribed) = speech_to_text_async("🔗 URL of your audio file").await {
        println!("Transcription: {:?}", transcribed);
    }

    // Generate text
    if let Ok(generated) = generate_text().await {
        println!("Generated Text: {}", generated);
    }

    // Spell check
    if let Ok(spell) = spell_check(text).await {
        println!("Spell Check: {:?}", spell);
    }
}
