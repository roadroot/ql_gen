# ql_gen

`ql_gen` generates typed Dart GraphQL helpers from schema files. It parses a
GraphQL schema and produces Dart models plus operation builders to simplify
query and mutation execution in client apps.

## Features

- Generate Dart types from GraphQL schema objects.
- Generate query and mutation helpers.
- Generate selectors/field builders for typed request construction.
- CLI support for schema-to-file generation.

## Install

Add dependency:

```yaml
dependencies:
  ql_gen: ^0.1.5
```

Then run:

```bash
dart pub get
```

## CLI usage

```bash
dart run ql_gen --help
```

Arguments:

```text
-s, --source    The source schema file path (default: schema.gql)
-t, --target    The output Dart file path (default: ql.dart)
-h, --help      Prints this help message
```

Generate output:

```bash
dart run ql_gen -s schema.gql -t lib/src/generated/ql.dart
```

## Programmatic usage

```dart
import 'package:ql_gen/ql_gen.dart';

void main() {
  final generator = ApiGenerator('schema.gql');
  generator.export('lib/src/generated/ql.dart');
}
```

## Runtime integration

Generated methods expect an executor with signature:

```dart
Future<Map<String, dynamic>?> execute(
  (String, Map<String, dynamic>) queryAndVariables,
)
```

This allows using any GraphQL transport/client package. The tuple contains:

- `$1`: GraphQL query string
- `$2`: variables map

## Example schema

```graphql
type Author {
  id: ID
  name: String
  books: [Book!]
}

type Book {
  id: ID
  title: String
  author: Author
}

type Query {
  books: [Book!]
  authors: [Author!]
  book(id: ID!): Book
  author(id: ID!): Author
}
```

A complete generated sample is available in [doc/result.dart](doc/result.dart).

## Development

- Run tests: `dart test`
- Run analysis: `dart analyze`

## Issues

Bug reports and feature requests are welcome at:

- https://github.com/roadroot/ql_gen/issues/new
