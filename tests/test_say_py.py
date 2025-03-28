import unittest
from src.say import SaySalomon

class TestSaySalomon(unittest.TestCase):

    def setUp(self):
        self.say = SaySalomon("🔑 Your_API_Key")

    def test_text_to_speech(self):
        result = self.say.text_to_speech("test")
        self.assertIsInstance(result, str)

if __name__ == "__main__":
    unittest.main()
  
