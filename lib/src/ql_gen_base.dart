import 'dart:io';

/// Utility helpers used by the generator runtime.
class Visitor {
  /// Reads schema content from [path] as a UTF-8 string.
  static Future<String> readSchema(String path) async {
    final file = File(path);
    return String.fromCharCodes((await (file
        .openRead()
        .reduce((previous, element) => previous + element))));
  }
}
