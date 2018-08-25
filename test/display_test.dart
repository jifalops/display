@TestOn('vm')

import 'package:test/test.dart';
import 'package:display/display.dart';

void main() {
  final display = Display(height: 1920.0, width: 1080.0);
  test('No platform dependencies', () {});
}
