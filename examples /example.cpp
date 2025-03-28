#include "say.cpp"
#include <iostream>

int main() {
    std::string text = "Hello, world!";

    // Convert text to speech
    std::string audio = text_to_speech(text);
    std::cout << "Audio URL: " << audio << std::endl;

    // Translate text
    std::string translated = automatic_translation(text, "en", "fr");
    std::cout << "Translated: " << translated << std::endl;

    // Speech to text
    std::string transcription = speech_to_text_async("🔗 URL of your audio file");
    std::cout << "Transcription: " << transcription << std::endl;

    // Generate text
    std::string generated = generate_text();
    std::cout << "Generated Text: " << generated << std::endl;

    // Spell check
    std::string spell = spell_check(text);
    std::cout << "Spell Check: " << spell << std::endl;

    return 0;
}
