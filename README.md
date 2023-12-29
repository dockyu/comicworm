# comicworm

An integrated comic crawler.

## Development  Environment

### Requirement

1. [install Flutter](https://docs.flutter.dev/get-started/install)
2. [install Rust](https://www.rust-lang.org/tools/install)
3. [install LLVM](https://pub.dev/documentation/ffigen/latest/#installing-llvm)

### Download Flutter Dependencies

```
flutter pub get
```

## Build

### Generate Dart FFI

```bash
flutter_rust_bridge_codegen --rust-input src/api.rs --dart-output ../lib/bridge_generated.dart --llvm-path "A:\LLVM"
```

### Compile rust.dll

```bash
cargo build --release --lib
```

### Add rust.dll to asset

```bash
setdll.bat
```

### Build Windows Application

```bash
flutter build Windows
```