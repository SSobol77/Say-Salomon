# Unit test for Say-Salomon Julia

include("../src/say.jl")
using Test

@testset "SaySalomon Tests" begin
    audio = text_to_speech("test")
    @test !isempty(audio)

    translated = automatic_translation("Hello", "en", "fr")
    @test !isempty(translated)
end
