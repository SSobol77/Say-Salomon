import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

import java.io.IOException;

public class Main {

    private static final String API_KEY = "Your_API_Key";

    public static void main(String[] args) {
        String text = "Hello, how are you?";

        String audio = textToSpeech(text);
        System.out.println(audio);

        String translatedText = automaticTranslation(text, "en", "fr");
        System.out.println(translatedText);

        String fileUrl = "URL of your audio file";
        String transcribedText = speechToTextAsync(fileUrl);
        System.out.println(transcribedText);

        String generatedText = generateText();
        System.out.println(generatedText);

        String spellCheckedText = spellCheck(text);
        System.out.println(spellCheckedText);
    }

    private static String textToSpeech(String text) {
        String url = "https://api.edenai.run/v2/audio/text_to_speech";
        String providers = "google,amazon";
        String language = "en-US";
        String option = "MALE";

        JsonObject payload = new JsonObject();
        payload.addProperty("providers", providers);
        payload.addProperty("language", language);
        payload.addProperty("option", option);
        payload.addProperty("text", text);

        String response = sendPostRequest(url, payload);
        JsonObject result = JsonParser.parseString(response).getAsJsonObject();
        return result.getAsJsonObject("google").get("audio").getAsString();
    }

    private static String textToSpeechAsync(String text) {
        String url = "https://api.edenai.run/v2/audio/text_to_speech_async";
        String providers = "lovoai";
        String language = "en-US";
        String option = "MALE";

        JsonObject payload = new JsonObject();
        payload.addProperty("providers", providers);
        payload.addProperty("language", language);
        payload.addProperty("option", option);
        payload.addProperty("text", text);

        return sendPostRequest(url, payload);
    }

    private static String automaticTranslation(String text, String sourceLanguage, String targetLanguage) {
        String url = "https://api.edenai.run/v2/translation/automatic_translation";
        String providers = "google,amazon";

        JsonObject payload = new JsonObject();
        payload.addProperty("providers", providers);
        payload.addProperty("source_language", sourceLanguage);
        payload.addProperty("target_language", targetLanguage);
        payload.addProperty("text", text);

        JsonObject result = JsonParser.parseString(sendPostRequest(url, payload)).getAsJsonObject();
        return result.getAsJsonObject("google").get("text").getAsString();
    }

    private static String speechToTextAsync(String fileUrl) {
        String url = "https://api.edenai.run/v2/audio/speech_to_text_async";
        String providers = "google,amazon";
        String language = "en-US";

        JsonObject payload = new JsonObject();
        payload.addProperty("providers", providers);
        payload.addProperty("language", language);
        payload.addProperty("file_url", fileUrl);

        return sendPostRequest(url, payload);
    }

    private static String generateText() {
        String url = "https://api.edenai.run/v2/text/generation";
        String providers = "openai,cohere";
        String text = "this is a test of Eden AI";
        double temperature = 0.2;
        int maxTokens = 250;

        JsonObject payload = new JsonObject();
        payload.addProperty("providers", providers);
        payload.addProperty("text", text);
        payload.addProperty("temperature", temperature);
        payload.addProperty("max_tokens", maxTokens);

        JsonObject result = JsonParser.parseString(sendPostRequest(url, payload)).getAsJsonObject();
        return result.getAsJsonObject("openai").get("generated_text").getAsString();
    }

    private static String spellCheck(String text) {
        String url = "https://api.edenai.run/v2/text/spell_check";
        String providers = "openai,microsoft";
        String language = "en";

        JsonObject payload = new JsonObject();
        payload.addProperty("providers", providers);
        payload.addProperty("language", language);
        payload.addProperty("text", text);

        JsonObject result = JsonParser.parseString(sendPostRequest(url, payload)).getAsJsonObject();
        return result.getAsJsonObject("openai").get("items").getAsString();
    }

    private static String sendPostRequest(String url, JsonObject payload) {
        OkHttpClient client = new OkHttpClient();

        MediaType mediaType = MediaType.parse("application/json");
        RequestBody body = RequestBody.create(mediaType, payload.toString());

        Request request = new Request.Builder()
                .url(url)
                .post(body)
                .addHeader("Authorization", "Bearer " + API_KEY)
                .build();

        try {
            Response response = client.newCall(request).execute();
            return response.body().string();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }
}
