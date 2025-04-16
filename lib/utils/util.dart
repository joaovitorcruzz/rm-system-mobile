import 'dart:math';

class Util {
  static const String kLanguageCode = 'pt';
  static const String kCountryCode = 'BR';

  static String generateRandomCode() {
    final Random random = Random();
    final List<int> codeUnits = List.generate(10, (_) => random.nextInt(10) + 48);
    return String.fromCharCodes(codeUnits);
  }
}