# Sourcery Mock Generators

[Sourcery](https://github.com/krzysztofzablocki/Sourcery) templates that
generate mock subclasses for unit tests, so you don't have to hand-write a
`SomethingMock` for every model/protocol in your codebase.

## Templates

- **`Model/ModelMock.stencil`** — for every `class`, generates a
  `<ClassName>Mock` subclass whose initializer sets every property to a
  reasonable default value (`"Default value"` for strings, `0`/`0.00` for
  numbers, `false` for bools, `Date()`, or the type's own default init).
- **`ModelMockV1.stencil`** — an earlier take on the same idea using
  Stencil macros to compute default values per-property as computed
  overrides instead of in an initializer. Kept as a reference for the
  macro-based approach.
- **`Protocol/ProtocolMock.stencil`** — for every `protocol`, generates a
  spy-style `<ProtocolName>Mock`: every property gets a `Called` flag and a
  settable `ReturnValue`, and every method records that it was called, its
  parameters, and returns a configurable value. Handy for verifying
  interactions in tests without a mocking library.

  Known limitation: methods that take parameters produce a variable name
  derived from the full method signature (e.g. `func foo(x: Int)` becomes
  `fooCalled`/`fooReturnValue` per parameter name, but the template doesn't
  strip the parameter list from composite method names with the same base —
  check the generated output for overloaded methods.
- **`SwiftTemplates/ModelMock.swifttemplate`** — the same idea as
  `ModelMock.stencil` but written using Sourcery's `.swifttemplate` syntax
  (plain Swift with `<% %>`/`<%= %>` tags) instead of Stencil, for teams
  that prefer not to learn Stencil's template language.

## How to use

```bash
sourcery --sources /path/to/your/Sources --templates Templates/Model/ModelMock.stencil --output Output
```

## Author

Juan Correa
