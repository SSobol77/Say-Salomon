// Unit test for Say-Salomon Dart

import 'package:test/test.dart';
import '../src/say.dart';

void main() {
  group('SaySalomon Tests', () {
    final say = SaySalomon('🔑 Your_API_Key');

    test('Text to Speech returns audio URL', () async {
      final result = await say.textToSpeech('Hello');
      expect(result, isA<String>());
    });

    test('Translation returns string', () async {
      final result = await say.automaticTranslation('Hello', 'en', 'fr');
      expect(result, isA<String>());
    });
  });
}
