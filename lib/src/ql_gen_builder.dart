import 'package:build/build.dart';
import 'package:ql_gen/src/ql_gen/ql_parser.dart';

class QlGenBuilder implements Builder {
  @override
  final buildExtensions = const {
    '.graphql': ['.graphql.dart'],
    '.gql': ['.gql.dart'],
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    final content = await buildStep.readAsString(buildStep.inputId);
    final generator = ApiGenerator.fromContent(content);
    final outputId = buildStep.inputId.addExtension('.dart');
    await buildStep.writeAsString(outputId, generator.dartQlApi);
  }
}

Builder qlGenBuilder(BuilderOptions options) => QlGenBuilder();
