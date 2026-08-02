# iOS Helper Tools

**Small, independent helpers accumulated while shipping iOS apps.**

Not a framework — a toolbox. Grab the piece you need: safer git rebase, Localizable → Firebase JSON, Sourcery mocks, a UITest sandbox, or one-liner accessibility extensions.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Swift](https://img.shields.io/badge/Swift-UIKit%20%7C%20SwiftUI-orange.svg)](#)
[![Tools](https://img.shields.io/badge/tools-git%20%7C%20Sourcery%20%7C%20Python-lightgrey.svg)](#)
[![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg)](#)

---

## Why this exists

| Everyday friction | Helper here |
|-------------------|-------------|
| Rebase onto `development` loses WIP or leaves a half-rebase | `Git/update_branch.sh` |
| `Localizable.strings` must land in Firebase Remote Config JSON | `Localizables/` |
| Hand-writing mocks for every model/protocol | `Unit_Testing/Sourcery/` |
| Trying accessibility parsers without a full production app | `Unit_Testing/UITestHelper/` |
| Setting label + hint + traits in four separate lines | `UIViewExtension` / `ViewExtension` |
| Hiding a URL/secret from casual greps (not real crypto) | `EncryptorObfuscator.playground` |

---

## What’s inside

```text
ios-helper-tools/
├── Git/
│   ├── update_branch.sh
│   └── merge_stashes.sh
├── Localizables/                 # Python + Swift converters
├── Unit_Testing/
│   ├── Sourcery/                 # mock templates
│   └── UITestHelper/             # minimal iOS sandbox app
├── EncryptorObfuscator.playground/
├── UIViewExtension.swift
└── ViewExtension.swift
```

| Component | Role |
|-----------|------|
| **[Git/](Git/)** | Safe stash → rebase onto `development` → pop; worked stash-merge example |
| **[Localizables/](Localizables/)** | `Localizable.strings` → Firebase Remote Config / RTDB JSON |
| **[Unit_Testing/Sourcery/](Unit_Testing/Sourcery/)** | Sourcery templates for model + protocol mocks (spies) |
| **[Unit_Testing/UITestHelper/](Unit_Testing/UITestHelper/)** | Tiny iOS app + storyboards/xibs for tooling experiments |
| **[EncryptorObfuscator.playground/](EncryptorObfuscator.playground/)** | Byte-array obfuscation demo (**not** encryption) |
| **[UIViewExtension.swift](UIViewExtension.swift)** / **[ViewExtension.swift](ViewExtension.swift)** | One-call accessibility label/hint/value/traits |

---

## Quick start

### Git: update branch safely

```bash
cd Git
# Optional: set DEVELOPMENT_BRANCH if not "development"
./update_branch.sh
```

Stashes WIP, rebases onto `development` only when behind, restores stash; aborts and restores if the rebase conflicts.

### Localizables → Firebase JSON

```bash
cd Localizables
python3 convertir_strings.py
# or open convertir_strings.swift in an Xcode playground / script context
```

### Sourcery mocks

1. Install Sourcery (`brew install sourcery`)  
2. Point Sourcery at `Unit_Testing/Sourcery/Templates/`  
3. Generate mocks for your models/protocols  

See [Unit_Testing/Sourcery/README.md](Unit_Testing/Sourcery/README.md).

### UITestHelper sandbox

```bash
open Unit_Testing/UITestHelper/UITestHelper.xcodeproj
```

Run on a simulator and point storyboard/xib parsers (e.g. [accessibility-helper](https://github.com/serenoj/accessibility-helper)) at its UI files.

### Accessibility extensions

Copy `UIViewExtension.swift` (UIKit) and/or `ViewExtension.swift` (SwiftUI) into your app target and set label, hint, value, and traits in a single call.

### Obfuscator playground

Open `EncryptorObfuscator.playground` in Xcode. Useful for demos of **obscurity**, not security — do not treat it as encryption.

---

## Requirements

| Piece | Needs |
|-------|--------|
| Git scripts | bash, git |
| Localizables | Python 3 and/or Swift |
| Sourcery templates | [Sourcery](https://github.com/krzysztofzablocki/Sourcery) |
| UITestHelper / playground | Xcode |

---

## License

[MIT](LICENSE) — Copyright (c) 2021–2026 Juan Carlos Correa Arango

## Author

**Juan Correa** ([@serenoj](https://github.com/serenoj))

## Related repos

| Repo | Relation |
|------|----------|
| [accessibility-helper](https://github.com/serenoj/accessibility-helper) | Full accessibility ID + test generation suite |
| [ios-analysis-toolkit](https://github.com/serenoj/ios-analysis-toolkit) | Sourcery project-structure + Periphery |
