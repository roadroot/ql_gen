<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# QlGen

**QlGen** is a library for generating dart code from GraphQL schema.

## Features

Given a GraphQL schema, QlGen generates dart code for the following:

- [x] Types
- [x] Queries
- [x] Mutations
- [-] Subscriptions (not yet tested)

## Getting started

To use this package, add `ql_gen` as a [dependency in your pubspec.yaml file](https://dart.dev/tools/pub/dependencies).

## Usage

<!-- command and result example -->

```bash
dart run ql_gen --help
```

```bash
-s, --source    The source file
                (defaults to "schema.gql")
-t, --target    The target file
                (defaults to "ql.dart")
-h, --help      Prints this help message
```

```bash
dart run ql_gen -s schema.gql -t lib/src/generated/ql.dart
```

## Example

For this example, we will use a simple GraphQL schema with authors and books.

```graphql
# schema.gql
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
  version: String
}
```

The result (can be found [here](./doc/result.dart)) will be a dart file having classes for each type and query (`Query`, `Author`, `Book`).

To fetch all the books of the author with id `1`, you can use the following code:

> Note: we are using `graphql_flutter` package to execute the query.

```dart
import 'package:graphql_flutter/graphql_flutter.dart';
import 'ql.dart'; // generated file

Future<Map<String, dynamic>?> query(
    (String, Map<String, dynamic>) qlAndVariables) async {
  logger.info('Query: ${qlAndVariables.$1}');
  logger.info('Variables: ${qlAndVariables.$2}');
  try {
    return await client
        .query(QueryOptions(
          document: gql(qlAndVariables.$1),
          variables: qlAndVariables.$2,
          cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
        ))
        .then((value) => value.data);
  } catch (e) {
    logger.severe(e);
    rethrow;
  }
}

void main() async {
  final query = Query(query);
  List<Author>? authors = await query.authors(AuthorSelector(
    id: true,
    name: true,
    books: BookSelector(
        id: true,
        title: false, // or don't include it at all
    )
  ));
}
```

You can use any plugin for GraphQL, you just need to pass the executor a function that has the bellow signature.

```dart
Future<Map<String, dynamic>?> query(
    (String, Map<String, dynamic>) qlAndVariables)
```

`qlAndVariables` is a tuple of the query and the variables. The query is a string and the variables are a map of string to dynamic.
It must return a `Future` of a map of string to dynamic. The map is the result of the query.

## Issues

Please feel free to open an issue if you find any bugs or have any feature requests [here](https://github.com/roadroot/ql_gen/issues/new).
