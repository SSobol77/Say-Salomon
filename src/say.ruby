#!/usr/bin/env ruby
#
# Say-Salomon for Eden AI - Ruby Version
#
# Copyright (C) 2025 Siergej Sobolewski <s.sobolewski@hotmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.

require 'net/http'
require 'json'
require 'uri'

class SaySalomon
  API_KEY = "Your_API_Key"
  BASE_HEADERS = {
    "Authorization" => "Bearer #{API_KEY}",
    "Content-Type" => "application/json"
  }

  # Helper method for sending POST requests
  def self.post_request(url, payload)
    uri = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri, BASE_HEADERS)
    request.body = payload.to_json
    response = http.request(request)
    JSON.parse(response.body)
  end

  # Function to convert text to speech
  def self.text_to_speech(text)
    url = "https://api.edenai.run/v2/audio/text_to_speech"
    payload = {
      providers: "google,amazon",
      language: "en-US",
      option: "MALE",
      text: text
    }
    result = post_request(url, payload)
    result["google"]["audio"]
  end

  # Function to convert text to speech asynchronously
  def self.text_to_speech_async(text)
    url = "https://api.edenai.run/v2/audio/text_to_speech_async"
    payload = {
      providers: "lovoai",
      language: "en-US",
      option: "MALE",
      text: text
    }
    post_request(url, payload)
  end

  # Function for automatic translation
  def self.automatic_translation(text, source_language = "en", target_language = "ru")
    url = "https://api.edenai.run/v2/translation/automatic_translation"
    payload = {
      providers: "google,amazon",
      source_language: source_language,
      target_language: target_language,
      text: text
    }
    result = post_request(url, payload)
    result["google"]["text"]
  end

  # Function for speech to text conversion asynchronously
  def self.speech_to_text_async(file_url)
    url = "https://api.edenai.run/v2/audio/speech_to_text_async"
    payload = {
      providers: "google, amazon",
      language: "en-US",
      file_url: file_url
    }
    post_request(url, payload)
  end

  # Function for text generation
  def self.generate_text
    url = "https://api.edenai.run/v2/text/generation"
    payload = {
      providers: "openai,cohere",
      text: "this is a test of Eden AI",
      temperature: 0.2,
      max_tokens: 250
    }
    result = post_request(url, payload)
    result["openai"]["generated_text"]
  end

  # Function for spell check
  def self.spell_check(text)
    url = "https://api.edenai.run/v2/text/spell_check"
    payload = {
      providers: "openai,microsoft",
      language: "en",
      text: text
    }
    result = post_request(url, payload)
    result["openai"]["items"]
  end
end

# Example usage
if __FILE__ == $0
  text = "Hello, how are you?"
  audio = SaySalomon.text_to_speech(text)
  puts "Audio URL: #{audio}"

  tts_async = SaySalomon.text_to_speech_async(text)
  puts "Text-to-Speech Async: #{tts_async}"

  translated = SaySalomon.automatic_translation(text, "en", "fr")
  puts "Translated Text: #{translated}"

  file_url = "🔗 URL of your audio file"
  transcription = SaySalomon.speech_to_text_async(file_url)
  puts "Transcription: #{transcription}"

  generated_text = SaySalomon.generate_text
  puts "Generated Text: #{generated_text}"

  spell_checked = SaySalomon.spell_check(text)
  puts "Spell Check: #{spell_checked}"
end
