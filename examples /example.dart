import 'src/say.dart';

void main() async {
  final say = SaySalomon('🔑 Your_API_Key');
  final audioUrl = await say.textToSpeech("Привет, мир!");
  print("Audio URL: $audioUrl");

  final translation = await say.automaticTranslation("Hello", "en", "ru");
  print("Translated: $translation");
}
