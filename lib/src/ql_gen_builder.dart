import 'dart:io';

import 'package:build/build.dart';
import 'package:path/path.dart' as p;
import 'package:ql_gen/src/ql_gen/ql_parser.dart';

class QlGenBuilder implements Builder {
  @override
  final buildExtensions = const {
    '.graphql': ['.graphql.dart'],
    '.gql': ['.gql.dart'],
  };

  final String? schemaPath;
  final String? outputPath;

  QlGenBuilder([BuilderOptions? options])
      : schemaPath = options?.config['schema_path'] as String?,
        outputPath = options?.config['output_path'] as String?;

  @override
  Future<void> build(BuildStep buildStep) async {
    String content;
    AssetId outputId;

    if (schemaPath != null) {
      // Resolve schema path relative to the package root directory.
      // buildStep.inputId.package is the package name, not a filesystem path.
      // We need to resolve the schema_path relative to the current working
      // directory (which is the package root when running build_runner).
      final schemaFile = File(
        p.joinAll([
          Directory.current.path,
          ...schemaPath!
              .replaceAll('\\', '/')
              .split('/')
              .where((s) => s.isNotEmpty),
        ]),
      );
      content = await schemaFile.readAsString();
    } else {
      content = await buildStep.readAsString(buildStep.inputId);
    }

    if (outputPath != null) {
      if (outputPath!.endsWith('/') || outputPath!.endsWith('\\')) {
        // outputPath is a directory: use input file name inside it
        final inputName = buildStep.inputId.path.split('/').last;
        outputId = AssetId(
          buildStep.inputId.package,
          '$outputPath$inputName.dart',
        );
      } else {
        // outputPath is a full file path
        outputId = AssetId(buildStep.inputId.package, outputPath!);
      }
    } else {
      outputId = buildStep.inputId.addExtension('.dart');
    }

    final generator = ApiGenerator.fromContent(content);
    await buildStep.writeAsString(outputId, generator.dartQlApi);
  }
}

Builder qlGenBuilder(BuilderOptions options) => QlGenBuilder(options);
