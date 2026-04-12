import 'package:ql_gen/src/utils/iterables.dart' as i;
import 'package:test/test.dart';

void main() {
  group('iterables util', () {
    test('equal handles null and nested iterables', () {
      expect(i.equal(null, null), isTrue);
      expect(
          i.equal([
            1,
            [2, 3]
          ], [
            1,
            [2, 3]
          ]),
          isTrue);
      expect(
          i.equal([
            1,
            [2, 3]
          ], [
            1,
            [3, 2]
          ]),
          isFalse);
    });

    test('notEqual is inverse of equal', () {
      expect(i.notEqual([1, 2], [1, 2]), isFalse);
      expect(i.notEqual([1, 2], [2, 1]), isTrue);
    });

    test('hash is stable for same nested content', () {
      final h1 = i.hash([
        1,
        2,
        [3, 4]
      ]);
      final h2 = i.hash([
        1,
        2,
        [3, 4]
      ]);
      expect(h1, equals(h2));
    });
  });
}
