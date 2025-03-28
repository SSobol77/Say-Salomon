/*
 * Say-Salomon for Eden AI - C++ Version
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

#include <iostream>
#include <sstream>
#include <string>
#include <curl/curl.h>
#include <jsoncpp/json/json.h>

// Callback function to write received data into a std::string
static size_t WriteCallback(void *contents, size_t size, size_t nmemb, void *userp) {
    ((std::string*)userp)->append((char*)contents, size * nmemb);
    return size * nmemb;
}

// Helper function to send POST request
std::string send_post_request(const std::string &url, const std::string &json_payload, const std::string &api_key) {
    CURL *curl;
    CURLcode res;
    std::string readBuffer;
    
    curl_global_init(CURL_GLOBAL_DEFAULT);
    curl = curl_easy_init();
    if(curl) {
        struct curl_slist *headers = NULL;
        std::string auth_header = "Authorization: Bearer " + api_key;
        headers = curl_slist_append(headers, auth_header.c_str());
        headers = curl_slist_append(headers, "Content-Type: application/json");

        curl_easy_setopt(curl, CURLOPT_URL, url.c_str());
        curl_easy_setopt(curl, CURLOPT_HTTPHEADER, headers);
        curl_easy_setopt(curl, CURLOPT_POSTFIELDS, json_payload.c_str());
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, WriteCallback);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, &readBuffer);

        res = curl_easy_perform(curl);
        if(res != CURLE_OK) {
            std::cerr << "curl_easy_perform() failed: " << curl_easy_strerror(res) << std::endl;
        }
        curl_slist_free_all(headers);
        curl_easy_cleanup(curl);
    }
    curl_global_cleanup();
    return readBuffer;
}

// Function to convert text to speech
std::string text_to_speech(const std::string &text) {
    std::string api_key = "🔑 Your_API_Key";
    std::string url = "https://api.edenai.run/v2/audio/text_to_speech";
    
    Json::Value payload;
    payload["providers"] = "google,amazon";
    payload["language"] = "en-US";
    payload["option"] = "MALE";
    payload["text"] = text;
    
    Json::StreamWriterBuilder writer;
    std::string json_payload = Json::writeString(writer, payload);
    
    std::string response = send_post_request(url, json_payload, api_key);
    
    Json::CharReaderBuilder reader;
    Json::Value result;
    std::istringstream ss(response);
    std::string errs;
    Json::parseFromStream(reader, ss, &result, &errs);
    return result["google"]["audio"].asString();
}

// Function to convert text to speech asynchronously
std::string text_to_speech_async(const std::string &text) {
    std::string api_key = "🔑 Your_API_Key";
    std::string url = "https://api.edenai.run/v2/audio/text_to_speech_async";
    
    Json::Value payload;
    payload["providers"] = "lovoai";
    payload["language"] = "en-US";
    payload["option"] = "MALE";
    payload["text"] = text;
    
    Json::StreamWriterBuilder writer;
    std::string json_payload = Json::writeString(writer, payload);
    
    return send_post_request(url, json_payload, api_key);
}

// Function for automatic translation
std::string automatic_translation(const std::string &text, const std::string &source_language, const std::string &target_language) {
    std::string api_key = "🔑 Your_API_Key";
    std::string url = "https://api.edenai.run/v2/translation/automatic_translation";
    
    Json::Value payload;
    payload["providers"] = "google,amazon";
    payload["source_language"] = source_language;
    payload["target_language"] = target_language;
    payload["text"] = text;
    
    Json::StreamWriterBuilder writer;
    std::string json_payload = Json::writeString(writer, payload);
    
    std::string response = send_post_request(url, json_payload, api_key);
    
    Json::CharReaderBuilder reader;
    Json::Value result;
    std::istringstream ss(response);
    std::string errs;
    Json::parseFromStream(reader, ss, &result, &errs);
    return result["google"]["text"].asString();
}

// Function for speech to text conversion asynchronously
std::string speech_to_text_async(const std::string &file_url) {
    std::string api_key = "🔑 Your_API_Key";
    std::string url = "https://api.edenai.run/v2/audio/speech_to_text_async";
    
    Json::Value payload;
    payload["providers"] = "google,amazon";
    payload["language"] = "en-US";
    payload["file_url"] = file_url;
    
    Json::StreamWriterBuilder writer;
    std::string json_payload = Json::writeString(writer, payload);
    
    return send_post_request(url, json_payload, api_key);
}

// Function for text generation
std::string generate_text() {
    std::string api_key = "🔑 Your_API_Key";
    std::string url = "https://api.edenai.run/v2/text/generation";
    
    Json::Value payload;
    payload["providers"] = "openai,cohere";
    payload["text"] = "this is a test of Eden AI";
    payload["temperature"] = 0.2;
    payload["max_tokens"] = 250;
    
    Json::StreamWriterBuilder writer;
    std::string json_payload = Json::writeString(writer, payload);
    
    std::string response = send_post_request(url, json_payload, api_key);
    
    Json::CharReaderBuilder reader;
    Json::Value result;
    std::istringstream ss(response);
    std::string errs;
    Json::parseFromStream(reader, ss, &result, &errs);
    return result["openai"]["generated_text"].asString();
}

// Function for spell check
std::string spell_check(const std::string &text) {
    std::string api_key = "🔑 Your_API_Key";
    std::string url = "https://api.edenai.run/v2/text/spell_check";
    
    Json::Value payload;
    payload["providers"] = "openai,microsoft";
    payload["language"] = "en";
    payload["text"] = text;
    
    Json::StreamWriterBuilder writer;
    std::string json_payload = Json::writeString(writer, payload);
    
    std::string response = send_post_request(url, json_payload, api_key);
    
    Json::CharReaderBuilder reader;
    Json::Value result;
    std::istringstream ss(response);
    std::string errs;
    Json::parseFromStream(reader, ss, &result, &errs);
    return result["openai"]["items"].asString();
}

int main() {
    std::string text = "Hello, how are you?";
    
    std::string audio = text_to_speech(text);
    std::cout << "Audio URL: " << audio << std::endl;
    
    std::string tts_async = text_to_speech_async(text);
    std::cout << "Text-to-Speech Async Response: " << tts_async << std::endl;
    
    std::string translated_text = automatic_translation(text, "en", "fr");
    std::cout << "Translated Text: " << translated_text << std::endl;
    
    std::string file_url = "🔗 URL of your audio file";
    std::string transcription = speech_to_text_async(file_url);
    std::cout << "Transcription: " << transcription << std::endl;
    
    std::string generated_text = generate_text();
    std::cout << "Generated Text: " << generated_text << std::endl;
    
    std::string spell_checked_text = spell_check(text);
    std::cout << "Spell Checked Text: " << spell_checked_text << std::endl;
    
    return 0;
}
