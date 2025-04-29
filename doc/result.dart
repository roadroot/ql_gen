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

class Author {
  final String? id;
  final String? name;
  final List<Book>? books;

  const Author({
    this.id,
    this.name,
    this.books,
  });

  factory Author.fromMap(Map<String, dynamic> data) {
    return Author(
      id: data['id'],
      name: data['name'],
      books: construct(data['books'], fromMap: Book.fromMap)?.cast<Book>(),
    );
  }

  (String, VariableContainer) build() {
    StringBuffer output = StringBuffer();
    final VariableContainer variables = VariableContainer();
    output.writeln('{');
    if (id != null) {
      output.write('id: ');
      output.writeln(
          '"${id!.replaceAll('\\', r'\\\\').replaceAll('\n', r'\\n').replaceAll('\r', r'\\r').replaceAll('\t', r'\\t').replaceAll('"', r'\\\"')}"');
    }
    if (name != null) {
      output.write('name: ');
      output.writeln(
          '"${name!.replaceAll('\\', r'\\\\').replaceAll('\n', r'\\n').replaceAll('\r', r'\\r').replaceAll('\t', r'\\t').replaceAll('"', r'\\\"')}"');
    }
    if (books != null) {
      output.write('books: ');
      output.write('[');
      for (var element in books!) {
        {
          final result = element.build();
          variables.concat(result.$2);
          output.write(result.$1);
        }

        output.write(',');
      }
      output.write(']');
    }
    output.writeln('}');
    return (output.toString(), variables);
  }
}

class AuthorSelector {
  final bool id;
  final bool name;
  final BookSelector? books;
  const AuthorSelector({
    this.id = false,
    this.name = false,
    this.books,
  });
  @override
  String toString() {
    StringBuffer output = StringBuffer();
    output.writeln('{');
    if (id) {
      output.writeln('id');
    }
    if (name) {
      output.writeln('name');
    }
    if (books != null) {
      output.writeln('books ${books!}');
    }
    output.writeln('}');
    return output.toString();
  }
}

class Book {
  final String? id;
  final String? title;
  final Author? author;

  const Book({
    this.id,
    this.title,
    this.author,
  });

  factory Book.fromMap(Map<String, dynamic> data) {
    return Book(
      id: data['id'],
      title: data['title'],
      author: data['author'] == null ? null : Author.fromMap(data['author']),
    );
  }

  (String, VariableContainer) build() {
    StringBuffer output = StringBuffer();
    final VariableContainer variables = VariableContainer();
    output.writeln('{');
    if (id != null) {
      output.write('id: ');
      output.writeln(
          '"${id!.replaceAll('\\', r'\\\\').replaceAll('\n', r'\\n').replaceAll('\r', r'\\r').replaceAll('\t', r'\\t').replaceAll('"', r'\\\"')}"');
    }
    if (title != null) {
      output.write('title: ');
      output.writeln(
          '"${title!.replaceAll('\\', r'\\\\').replaceAll('\n', r'\\n').replaceAll('\r', r'\\r').replaceAll('\t', r'\\t').replaceAll('"', r'\\\"')}"');
    }
    if (author != null) {
      output.write('author: ');
      {
        final result = author!.build();
        variables.concat(result.$2);
        output.write(result.$1);
      }
    }
    output.writeln('}');
    return (output.toString(), variables);
  }
}

class BookSelector {
  final bool id;
  final bool title;
  final AuthorSelector? author;
  const BookSelector({
    this.id = false,
    this.title = false,
    this.author,
  });
  @override
  String toString() {
    StringBuffer output = StringBuffer();
    output.writeln('{');
    if (id) {
      output.writeln('id');
    }
    if (title) {
      output.writeln('title');
    }
    if (author != null) {
      output.writeln('author ${author!}');
    }
    output.writeln('}');
    return output.toString();
  }
}

class Query {
  final Future<Map<String, dynamic>?> Function(
      (String, Map<String, dynamic>) queryAndVariables) _executor;

  const Query(this._executor);

  Future<List<Book>?> books(
    BookSelector $selector,
  ) async {
    return (construct(
      (await _executor(booksQl(
        $selector,
      )))?['books'],
      fromMap: Book.fromMap,
    ) as List?)
        ?.cast<Book>();
  }

  (String, Map<String, dynamic>) booksQl(
    BookSelector $selector,
  ) {
    StringBuffer output = StringBuffer();
    VariableContainer variables = VariableContainer();
    output.writeln('books');
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

  Future<List<Author>?> authors(
    AuthorSelector $selector,
  ) async {
    return (construct(
      (await _executor(authorsQl(
        $selector,
      )))?['authors'],
      fromMap: Author.fromMap,
    ) as List?)
        ?.cast<Author>();
  }

  (String, Map<String, dynamic>) authorsQl(
    AuthorSelector $selector,
  ) {
    StringBuffer output = StringBuffer();
    VariableContainer variables = VariableContainer();
    output.writeln('authors');
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

  Future<Book?> book(
    BookSelector $selector, {
    required String id,
  }) async {
    return construct(
      (await _executor(bookQl(
        $selector,
        id,
      )))?['book'],
      fromMap: Book.fromMap,
    );
  }

  (String, Map<String, dynamic>) bookQl(
    BookSelector $selector,
    String id,
  ) {
    StringBuffer output = StringBuffer();
    VariableContainer variables = VariableContainer();
    output.writeln('book(');
    output.write('id: ');
    output.writeln(
        '"${id.replaceAll('\\', r'\\\\').replaceAll('\n', r'\\n').replaceAll('\r', r'\\r').replaceAll('\t', r'\\t').replaceAll('"', r'\\\"')}"');

    output.writeln(')');
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

  Future<Author?> author(
    AuthorSelector $selector, {
    required String id,
  }) async {
    return construct(
      (await _executor(authorQl(
        $selector,
        id,
      )))?['author'],
      fromMap: Author.fromMap,
    );
  }

  (String, Map<String, dynamic>) authorQl(
    AuthorSelector $selector,
    String id,
  ) {
    StringBuffer output = StringBuffer();
    VariableContainer variables = VariableContainer();
    output.writeln('author(');
    output.write('id: ');
    output.writeln(
        '"${id.replaceAll('\\', r'\\\\').replaceAll('\n', r'\\n').replaceAll('\r', r'\\r').replaceAll('\t', r'\\t').replaceAll('"', r'\\\"')}"');

    output.writeln(')');
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

  Future<String?> version() async {
    return construct(
      (await _executor(versionQl()))?['version'],
    );
  }

  (String, Map<String, dynamic>) versionQl() {
    StringBuffer output = StringBuffer();
    VariableContainer variables = VariableContainer();
    output.writeln('version');
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
