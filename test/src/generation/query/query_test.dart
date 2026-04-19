import 'package:test/test.dart';

import '../generation_util.dart';

void main() {
  group('query tests', () {
    test('empty query must be generated', () => GenUtils.test('query/empty'));
    test('non-nullable list return type must not crash on null executor response',
        () => GenUtils.test('query/nonnullable_list'));
  });
}
