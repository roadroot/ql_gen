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
  final String id;
  final String name;
  final List<Author>? books;
  final String? phone;

  const Author({
    required this.id,
    required this.name,
    this.books,
    this.phone,
  });

  factory Author.fromMap(Map<String, dynamic> data) {
    return Author(
      id: data['id'],
      name: data['name'],
      books: construct(data['books'], fromMap: Author.fromMap)?.cast<Author>(),
      phone: data['phone'],
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
    if (phone != null) {
      output.write('phone: ');
      output.writeln(
          '"${phone!.replaceAll('\\', r'\\\\').replaceAll('\n', r'\\n').replaceAll('\r', r'\\r').replaceAll('\t', r'\\t').replaceAll('"', r'\\\"')}"');
    }
    output.writeln('}');
    return (output.toString(), variables);
  }
}

class AuthorSelector {
  final bool phone;
  final AuthorSelector? books;
  const AuthorSelector({
    this.phone = false,
    this.books,
  });
  @override
  String toString() {
    StringBuffer output = StringBuffer();
    output.writeln('{');
    output.writeln('id');
    output.writeln('name');
    if (phone) {
      output.writeln('phone');
    }
    if (books != null) {
      output.writeln('books ${books!}');
    }
    output.writeln('}');
    return output.toString();
  }
}

class Book {
  final String id;
  final String title;
  final Author author;
  final Author? coAuthor;

  const Book({
    required this.id,
    required this.title,
    required this.author,
    this.coAuthor,
  });

  factory Book.fromMap(Map<String, dynamic> data) {
    return Book(
      id: data['id'],
      title: data['title'],
      author: Author.fromMap(data['author']),
      coAuthor:
          data['coAuthor'] == null ? null : Author.fromMap(data['coAuthor']),
    );
  }

  (String, VariableContainer) build() {
    StringBuffer output = StringBuffer();
    final VariableContainer variables = VariableContainer();
    output.writeln('{');
    output.write('id: ');
    output.writeln(
        '"${id.replaceAll('\\', r'\\\\').replaceAll('\n', r'\\n').replaceAll('\r', r'\\r').replaceAll('\t', r'\\t').replaceAll('"', r'\\\"')}"');

    output.write('title: ');
    output.writeln(
        '"${title.replaceAll('\\', r'\\\\').replaceAll('\n', r'\\n').replaceAll('\r', r'\\r').replaceAll('\t', r'\\t').replaceAll('"', r'\\\"')}"');

    output.write('author: ');
    {
      final result = author.build();
      variables.concat(result.$2);
      output.write(result.$1);
    }

    if (coAuthor != null) {
      output.write('coAuthor: ');
      {
        final result = coAuthor!.build();
        variables.concat(result.$2);
        output.write(result.$1);
      }
    }
    output.writeln('}');
    return (output.toString(), variables);
  }
}

class BookSelector {
  final AuthorSelector author;
  final AuthorSelector? coAuthor;
  const BookSelector({
    this.author = const AuthorSelector(),
    this.coAuthor,
  });
  @override
  String toString() {
    StringBuffer output = StringBuffer();
    output.writeln('{');
    output.writeln('id');
    output.writeln('title');
    if (coAuthor != null) {
      output.writeln('coAuthor ${coAuthor!}');
    }
    output.writeln('author $author');
    output.writeln('}');
    return output.toString();
  }
}
