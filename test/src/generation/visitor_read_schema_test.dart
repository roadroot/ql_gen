import 'dart:io';

import 'package:ql_gen/src/ql_gen_base.dart';
import 'package:test/test.dart';

void main() {
  group('Visitor.readSchema', () {
    test('reads full file content', () async {
      final dir = Directory.systemTemp.createTempSync('ql_gen_schema_');
      try {
        final schemaFile = File('${dir.path}/schema.gql');
        const content = 'type Query {\n  version: String\n}\n';
        schemaFile.writeAsStringSync(content);

        final read = await Visitor.readSchema(schemaFile.path);
        expect(read, content);
      } finally {
        dir.deleteSync(recursive: true);
      }
    });
  });
}
