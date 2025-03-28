# Say-Salomon for Eden AI - Julia Version
#
# Copyright (C) 2025 Siergej Sobolewski <s.sobolewski@hotmail.com>
# This program is distributed under the GPL-3.0 License
# See <https://www.gnu.org/licenses/> for more info

using HTTP, JSON3

const API_KEY = "Your_API_Key"
const BASE_HEADERS = ["Authorization" => "Bearer \$API_KEY", "Content-Type" => "application/json"]

function text_to_speech(text::String)
    url = "https://api.edenai.run/v2/audio/text_to_speech"
    payload = Dict(
        "providers" => "google,amazon",
        "language" => "en-US",
        "option" => "MALE",
        "text" => text
    )
    response = HTTP.post(url, BASE_HEADERS, JSON3.write(payload))
    result = JSON3.read(String(response.body))
    return result["google"]["audio"]
end

function automatic_translation(text::String, source::String, target::String)
    url = "https://api.edenai.run/v2/translation/automatic_translation"
    payload = Dict(
        "providers" => "google,amazon",
        "source_language" => source,
        "target_language" => target,
        "text" => text
    )
    response = HTTP.post(url, BASE_HEADERS, JSON3.write(payload))
    result = JSON3.read(String(response.body))
    return result["google"]["text"]
end

function main()
    audio = text_to_speech("Hello, world!")
    println("Audio URL: ", audio)

    translated = automatic_translation("Hello", "en", "fr")
    println("Translated: ", translated)
end

main()
