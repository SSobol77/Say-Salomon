require 'json'
require 'net/http'

# Function to convert text to speech
def text_to_speech(text)
    headers = {"Authorization" => "Bearer 🔑 Your_API_Key"}
    url = URI.parse("https://api.edenai.run/v2/audio/text_to_speech")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(url.path, headers)
    request.body = {"providers" => "google,amazon", "language" => "en-US", "option" => "MALE", "text" => text}.to_json
    response = http.request(request)
    result = JSON.parse(response.body)
    return result['google']['audio']
end

# Function to convert text to speech asynchronously
def text_to_speech_async(text)
    headers = {"Authorization" => "Bearer 🔑 Your_API_Key"}
    url = URI.parse("https://api.edenai.run/v2/audio/text_to_speech_async")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(url.path, headers)
    request.body = {"providers" => "lovoai", "language" => "en-US", "option" => "MALE", "text" => text}.to_json
    response = http.request(request)
    result = JSON.parse(response.body)
    return result
end

# Function for automatic translation
def automatic_translation(text, source_language, target_language)
    headers = {"Authorization" => "Bearer 🔑 Your_API_Key"}
    url = URI.parse("https://api.edenai.run/v2/translation/automatic_translation")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(url.path, headers)
    request.body = {"providers" => "google,amazon", "source_language" => source_language, "target_language" => target_language, "text" => text}.to_json
    response = http.request(request)
    result = JSON.parse(response.body)
    return result['google']['text']
end

# Function for speech to text conversion
def speech_to_text_async(file_url)
    headers = {"Authorization" => "Bearer 🔑 Your_API_Key"}
    url = URI.parse("https://api.edenai.run/v2/audio/speech_to_text_async")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(url.path, headers)
    request.body = {"providers" => "google, amazon", "language" => "en-US", "file_url" => file_url}.to_json
    response = http.request(request)
    result = JSON.parse(response.body)
    return result
end

# Function for text generation
def generate_text()
    headers = {"Authorization" => "Bearer 🔑 Your_API_Key"}
    url = URI.parse("https://api.edenai.run/v2/text/generation")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(url.path, headers)
    request.body = {
        "providers" => "openai,cohere",
        "text" => "this is a test of Eden AI",
        "temperature" => 0.2,
        "max_tokens" => 250
    }.to_json
    response = http.request(request)
    result = JSON.parse(response.body)
    return result['openai']['generated_text']
end

# Function for spell check
def spell_check(text)
    headers = {"Authorization" => "Bearer 🔑 Your_API_Key"}
    url = URI.parse("https://api.edenai.run/v2/text/spell_check")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(url.path, headers)
    request.body = {"providers" => "openai,microsoft", "language" => "en", "text" => text}.to_json
    response = http.request(request)
    result = JSON.parse(response.body)
    return result['openai']['items']
end

# Example usage
text = "Hello, how are you?"
audio = text_to_speech(text)
puts audio

translated_text = automatic_translation(text, "en", "fr")
puts translated_text

file_url = "🔗 URL of your audio file"
transcribed_text = speech_to_text_async(file_url)
puts transcribed_text

generated_text = generate_text()
puts generated_text

spell_checked_text = spell_check(text)
puts spell_checked_text
