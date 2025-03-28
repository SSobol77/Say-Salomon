/*
 * Say-Salomon for Eden AI - Java Version
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

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import java.io.IOException;

public class SaySalomon {

    private static final String API_KEY = "Your_API_Key";
    private static final OkHttpClient client = new OkHttpClient();
    private static final MediaType JSON = MediaType.parse("application/json");

    // Helper method for sending POST requests
    private static String sendPostRequest(String url, String jsonPayload) {
        RequestBody body = RequestBody.create(JSON, jsonPayload);
        Request request = new Request.Builder()
                .url(url)
                .post(body)
                .addHeader("Authorization", "Bearer " + API_KEY)
                .build();

        try (Response response = client.newCall(request).execute()) {
            return response.body().string();
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    // Function to convert text to speech
    public static String textToSpeech(String text) {
        String url = "https://api.edenai.run/v2/audio/text_to_speech";
        JsonObject payload = new JsonObject();
        payload.addProperty("providers", "google,amazon");
        payload.addProperty("language", "en-US");
        payload.addProperty("option", "MALE");
        payload.addProperty("text", text);

        String response = sendPostRequest(url, payload.toString());
        JsonObject result = JsonParser.parseString(response).getAsJsonObject();
        return result.getAsJsonObject("google").get("audio").getAsString();
    }

    // Function to convert text to speech asynchronously
    public static String textToSpeechAsync(String text) {
        String url = "https://api.edenai.run/v2/audio/text_to_speech_async";
        JsonObject payload = new JsonObject();
        payload.addProperty("providers", "lovoai");
        payload.addProperty("language", "en-US");
        payload.addProperty("option", "MALE");
        payload.addProperty("text", text);

        return sendPostRequest(url, payload.toString());
    }

    // Function for automatic translation
    public static String automaticTranslation(String text, String sourceLanguage, String targetLanguage) {
        String url = "https://api.edenai.run/v2/translation/automatic_translation";
        JsonObject payload = new JsonObject();
        payload.addProperty("providers", "google,amazon");
        payload.addProperty("source_language", sourceLanguage);
        payload.addProperty("target_language", targetLanguage);
        payload.addProperty("text", text);

        String response = sendPostRequest(url, payload.toString());
        JsonObject result = JsonParser.parseString(response).getAsJsonObject();
        return result.getAsJsonObject("google").get("text").getAsString();
    }

    // Function for speech to text conversion asynchronously
    public static String speechToTextAsync(String fileUrl) {
        String url = "https://api.edenai.run/v2/audio/speech_to_text_async";
        JsonObject payload = new JsonObject();
        payload.addProperty("providers", "google,amazon");
        payload.addProperty("language", "en-US");
        payload.addProperty("file_url", fileUrl);

        return sendPostRequest(url, payload.toString());
    }

    // Function for text generation
    public static String generateText() {
        String url = "https://api.edenai.run/v2/text/generation";
        JsonObject payload = new JsonObject();
        payload.addProperty("providers", "openai,cohere");
        payload.addProperty("text", "this is a test of Eden AI");
        payload.addProperty("temperature", 0.2);
        payload.addProperty("max_tokens", 250);

        String response = sendPostRequest(url, payload.toString());
        JsonObject result = JsonParser.parseString(response).getAsJsonObject();
        return result.getAsJsonObject("openai").get("generated_text").getAsString();
    }

    // Function for spell check
    public static String spellCheck(String text) {
        String url = "https://api.edenai.run/v2/text/spell_check";
        JsonObject payload = new JsonObject();
        payload.addProperty("providers", "openai,microsoft");
        payload.addProperty("language", "en");
        payload.addProperty("text", text);

        String response = sendPostRequest(url, payload.toString());
        JsonObject result = JsonParser.parseString(response).getAsJsonObject();
        return result.getAsJsonObject("openai").get("items").getAsString();
    }

    public static void main(String[] args) {
        String text = "Hello, how are you?";

        String audio = textToSpeech(text);
        System.out.println("Audio: " + audio);

        String ttsAsync = textToSpeechAsync(text);
        System.out.println("Text-to-Speech Async Response: " + ttsAsync);

        String translatedText = automaticTranslation(text, "en", "fr");
        System.out.println("Translated Text: " + translatedText);

        String fileUrl = "URL of your audio file";
        String transcription = speechToTextAsync(fileUrl);
        System.out.println("Transcription: " + transcription);

        String generatedText = generateText();
        System.out.println("Generated Text: " + generatedText);

        String spellCheckedText = spellCheck(text);
        System.out.println("Spell Checked Text: " + spellCheckedText);
    }
}
