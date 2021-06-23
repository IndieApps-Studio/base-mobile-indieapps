import 'dart:math';

double mappingNumber(
    double x, double inMin, double inMax, double outMin, double outMax) {
  return (x - inMin) * (outMax - outMin) / (inMax - inMin) + outMin;
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));