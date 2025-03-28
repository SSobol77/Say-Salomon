/*
 * Say-Salomon for Eden AI - Dart Version (Flutter Compatible)
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

import 'dart:convert';
import 'package:http/http.dart' as http;

class SaySalomon {
  final String apiKey;
  final Map<String, String> headers;

  SaySalomon(this.apiKey)
      : headers = {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json'
        };

  Future<String?> textToSpeech(String text) async {
    const url = 'https://api.edenai.run/v2/audio/text_to_speech';
    final body = jsonEncode({
      'providers': 'google,amazon',
      'language': 'en-US',
      'option': 'MALE',
      'text': text
    });
    final response = await http.post(Uri.parse(url), headers: headers, body: body);
    final result = jsonDecode(response.body);
    return result['google']['audio'];
  }

  Future<Map<String, dynamic>> textToSpeechAsync(String text) async {
    const url = 'https://api.edenai.run/v2/audio/text_to_speech_async';
    final body = jsonEncode({
      'providers': 'lovoai',
      'language': 'en-US',
      'option': 'MALE',
      'text': text
    });
    final response = await http.post(Uri.parse(url), headers: headers, body: body);
    return jsonDecode(response.body);
  }

  Future<String?> automaticTranslation(String text, String sourceLang, String targetLang) async {
    const url = 'https://api.edenai.run/v2/translation/automatic_translation';
    final body = jsonEncode({
      'providers': 'google,amazon',
      'source_language': sourceLang,
      'target_language': targetLang,
      'text': text
    });
    final response = await http.post(Uri.parse(url), headers: headers, body: body);
    final result = jsonDecode(response.body);
    return result['google']['text'];
  }

  Future<Map<String, dynamic>> speechToTextAsync(String fileUrl) async {
    const url = 'https://api.edenai.run/v2/audio/speech_to_text_async';
    final body = jsonEncode({
      'providers': 'google,amazon',
      'language': 'en-US',
      'file_url': fileUrl
    });
    final response = await http.post(Uri.parse(url), headers: headers, body: body);
    return jsonDecode(response.body);
  }

  Future<String?> generateText() async {
    const url = 'https://api.edenai.run/v2/text/generation';
    final body = jsonEncode({
      'providers': 'openai,cohere',
      'text': 'this is a test of Eden AI',
      'temperature': 0.2,
      'max_tokens': 250
    });
    final response = await http.post(Uri.parse(url), headers: headers, body: body);
    final result = jsonDecode(response.body);
    return result['openai']['generated_text'];
  }

  Future<List<dynamic>> spellCheck(String text) async {
    const url = 'https://api.edenai.run/v2/text/spell_check';
    final body = jsonEncode({
      'providers': 'openai,microsoft',
      'language': 'en',
      'text': text
    });
    final response = await http.post(Uri.parse(url), headers: headers, body: body);
    final result = jsonDecode(response.body);
    return result['openai']['items'];
  }
}

// Example usage
void main() async {
  final say = SaySalomon('🔑 Your_API_Key');
  final audioUrl = await say.textToSpeech("Hello, world!");
  print('Audio URL: \$audioUrl');

  final translation = await say.automaticTranslation("Hello", "en", "fr");
  print('Translated: \$translation');
}
