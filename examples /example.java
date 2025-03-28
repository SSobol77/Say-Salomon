import src.SaySalomon;

public class Example {
    public static void main(String[] args) {
        SaySalomon say = new SaySalomon("🔑 Your_API_Key");

        // Convert text to speech
        String audio = say.textToSpeech("Hello, world!");
        System.out.println("Audio URL: " + audio);

        // Translate text
        String translated = say.automaticTranslation("Hello", "en", "fr");
        System.out.println("Translated: " + translated);

        // Speech to text
        String fileUrl = "🔗 URL of your audio file";
        String transcription = say.speechToTextAsync(fileUrl);
        System.out.println("Transcription: " + transcription);

        // Generate text
        String generated = say.generateText();
        System.out.println("Generated Text: " + generated);

        // Spell check
        String spell = say.spellCheck("Hello, how are you?");
        System.out.println("Spell Check: " + spell);
    }
}
