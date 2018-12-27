import 'dart:math';

int randomInRange(int min, int max) {
  final _random = new Random();
  return min + _random.nextInt(max - min);
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

String slugify(String s) => s.replaceAll(' ', '-').trim();
