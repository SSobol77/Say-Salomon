require_relative '../src/say.ruby'
require 'minitest/autorun'

class TestSayRuby < Minitest::Test
  def test_text_to_speech
    result = SaySalomon.text_to_speech("test")
    refute_nil result
  end
end
