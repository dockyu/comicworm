# comicworm

An integrated comic crawler.

## Development  Environment

### Requirement

1. [install Flutter](https://docs.flutter.dev/get-started/install)
2. [install Rust](https://www.rust-lang.org/tools/install)
3. [install LLVM](https://pub.dev/documentation/ffigen/latest/#installing-llvm)

### Download Flutter Dependencies

```
cd <path_to_project>
flutter pub get
```

## Build

### Generate Dart FFI

```
flutter_rust_bridge_codegen --rust-input src/api.rs --dart-output ../lib/bridge_generated.dart --llvm-path "<LLVM_path>"
```

### Compile rust.dll

```
cd <path_to_project>/rust
cargo build --release --lib
```

the `rust.dll` will be compile to `<path_to_project>/rust/target/release/`, move it to `<path_to_project>/assets/`

### Build Windows Application

```
flutter build Windows
```