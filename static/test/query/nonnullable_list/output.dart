// GENERATED CODE - DO NOT MODIFY BY HAND
extension InsertAt on StringBuffer {
  void insertAt(int index, String value) {
    if (index < 0 || index > length) {
      throw RangeError('index $index out of bounds');
    }
    String temp = toString();
    clear();
    write(temp.substring(0, index));
    write(value);
    write(temp.substring(index));
  }
}

dynamic construct(dynamic data,
    {dynamic Function(Map<String, dynamic>)? fromMap}) {
  if (data == null) {
    return null;
  }
  if (data is List) {
    return data.map((e) => construct(e, fromMap: fromMap)).toList();
  }
  if (fromMap != null) {
    return fromMap(data);
  }
  return data;
}

class KeyGenerator {
  int key = 0;

  @override
  String toString() {
    return (key++).toRadixString(36);
  }
}

final keyGenerator = KeyGenerator();

class VariableInfo {
  final String name;
  final dynamic value;
  final String type;

  VariableInfo(this.value, this.type, [String? name])
      : name = name ?? keyGenerator.toString();
}

class VariableContainer {
  final Set<VariableInfo> variables = {};

  void add(dynamic value, String type, [String? name]) {
    variables.add(VariableInfo(value, type, name));
  }

  void concat(VariableContainer other) {
    variables.addAll(other.variables);
  }

  Map<String, dynamic> get map {
    Map<String, dynamic> map = {};
    for (VariableInfo variable in variables) {
      map[variable.name] = variable.value;
    }
    return map;
  }
}

class Query {
  final Future<Map<String, dynamic>?> Function(
      (String, Map<String, dynamic>) queryAndVariables) _executor;

  const Query(this._executor);

  Future<List<Item>> items(
    ItemSelector $selector,
  ) async {
    return (construct(
          (await _executor(itemsQl(
            $selector,
          )))?['items'],
          fromMap: Item.fromMap,
        ) as List?)
            ?.cast<Item>() ??
        [];
  }

  (String, Map<String, dynamic>) itemsQl(
    ItemSelector $selector,
  ) {
    StringBuffer output = StringBuffer();
    VariableContainer variables = VariableContainer();
    output.writeln('items');
    output.writeln($selector);
    output.writeln('}');
    String params =
        variables.variables.map((e) => '\$${e.name}: ${e.type}').join(', ');
    if (params.isNotEmpty) {
      params = '($params)';
    }
    output.insertAt(0, 'query$params {');
    return (output.toString(), variables.map);
  }

  (String, VariableContainer) build() {
    StringBuffer output = StringBuffer();
    final VariableContainer variables = VariableContainer();
    output.writeln('{');
    output.writeln('}');
    return (output.toString(), variables);
  }
}

class Item {
  final String id;
  final String name;

  const Item({
    required this.id,
    required this.name,
  });

  factory Item.fromMap(Map<String, dynamic> data) {
    return Item(
      id: data['id'],
      name: data['name'],
    );
  }

  (String, VariableContainer) build() {
    StringBuffer output = StringBuffer();
    final VariableContainer variables = VariableContainer();
    output.writeln('{');
    output.write('id: ');
    output.writeln(
        '"${id.replaceAll('\\', r'\\\\').replaceAll('\n', r'\\n').replaceAll('\r', r'\\r').replaceAll('\t', r'\\t').replaceAll('"', r'\\\"')}"');

    output.write('name: ');
    output.writeln(
        '"${name.replaceAll('\\', r'\\\\').replaceAll('\n', r'\\n').replaceAll('\r', r'\\r').replaceAll('\t', r'\\t').replaceAll('"', r'\\\"')}"');

    output.writeln('}');
    return (output.toString(), variables);
  }
}

class ItemSelector {
  const ItemSelector();
  @override
  String toString() {
    StringBuffer output = StringBuffer();
    output.writeln('{');
    output.writeln('id');
    output.writeln('name');
    output.writeln('}');
    return output.toString();
  }
}
