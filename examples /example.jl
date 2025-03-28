include("../src/say.jl")

# Using Say-Salomon Functions in Julia
function run_examples()
    audio = text_to_speech("Привет, мир!")
    println("Audio URL: ", audio)

    translated = automatic_translation("Hello", "en", "ru")
    println("Translated: ", translated)
end

run_examples()
