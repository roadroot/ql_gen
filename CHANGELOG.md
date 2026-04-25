## 0.1.7

- Add `build_runner` support: `.graphql` and `.gql` files are now automatically
  compiled to Dart when running `dart run build_runner build`.
- Add `ApiGenerator.fromContent(String content)` constructor for in-memory schema input.
- Add `build.yaml` builder registration with `auto_apply: dependents`.
- Add `build` package as a dependency.

## 0.1.0

- Initial version.

## 0.1.1

- Fixed missing `!` in `List` type.
- Documentation improvements.

## 0.1.2

- implemented feature [#1](https://github.com/roadroot/ql_gen/issues/1), `dart run ql_gen` creates folder structure.
- Fixed issue [#2](https://github.com/roadroot/ql_gen/issues/2), Cast error when having returning List.

## 0.1.3

- Implemented feature [#3](https://github.com/roadroot/ql_gen/issues/3), Make parameters of a query/mutation/subscription named parameters instead of positional parameters.

## 0.1.4

- Bump dependecy versions

## 0.1.5

- Improve README with practical installation, usage, and generation workflow docs.
- Upgrade `tokenizer_parser` dependency to `^0.1.2`.
- Add API documentation comments and clean analyzer issues.
- Add tests for utility helpers and schema file reader behavior.

## 0.1.6

- Fixed issue where non-nullable list return types would crash with `TypeError` when executor returns null.
  - Changed `as List` cast to `as List?` to safely handle null transport errors.
  - Added `?? []` fallback for non-nullable lists to satisfy schema contract.
  - Added static test coverage for `[Item!]!` return type.
