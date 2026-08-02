# Localizable.strings → JSON Converter

Converts an iOS `Localizable.strings` file into the JSON shape expected by
Firebase Remote Config/Realtime Database (`{"data": {key: value, ...}}`),
preserving literal `\n` line breaks and UTF-8 special characters. Useful when
your translations live in a `.strings` file but need to be served from
Firebase for a hybrid/remote-config-driven app.

Two equivalent implementations are included — pick whichever fits your
toolchain:

- **`convertir_strings.py`** — Python, uses a regex to extract `"key" = "value";` pairs.
- **`convertir_strings.swift`** — Swift, `NSRegularExpression`-based, same output shape.

## How to use

Set `input_file`/`output_file` (Python) or the paths in the `do` block at
the bottom of the file (Swift) to your `Localizable.strings` and desired
output path, then run:

```bash
python3 convertir_strings.py
# or
swift convertir_strings.swift
```

## Author

Juan Correa
