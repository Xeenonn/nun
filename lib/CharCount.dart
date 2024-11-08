import 'dart:io';

Map<String, int> countCharacters({required String input}) {
  Map<String, int> charCount = {};

  for (var char in input.split('')) {
    if (charCount.containsKey(char)) {
      charCount[char] = charCount[char]! + 1;
    } else {
      charCount[char] = 1;
    }
  }

  return charCount;
}

void main() {
  stdout.write('Enter Text: ');
  String input = stdin.readLineSync() ?? '';

  Map<String, int> charCount = countCharacters(input: input);

  print('  -------------------');
  print('  Char Count: ');
  charCount.forEach((key, value) {
    print('  $key: $value');
  });
}
