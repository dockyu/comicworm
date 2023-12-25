import 'package:flutter/material.dart';
import 'home_page.dart';
import 'bridge_generated.dart'; // 導入自動生成的橋接代碼
import 'dart:ffi' as ffi; // 導入 dart:ffi
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Rust Bridge Demo',
      home: FutureBuilder<RustImpl>(
        future: _initRust(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            return HomePage(rust: snapshot.data!);
          } else if (snapshot.hasError) {
            return Scaffold(
              body: Center(child: Text('加載錯誤: ${snapshot.error}')),
            );
          } else {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}

Future<RustImpl> _initRust() async {
  final dllPath = await extractDllFromAssets('assets/rust.dll');
  return RustImpl(ffi.DynamicLibrary.open(dllPath));
}

Future<String> extractDllFromAssets(String assetPath) async {
  final dir = await getTemporaryDirectory();
  final dllPath = '${dir.path}/rust.dll';
  final byteData = await rootBundle.load(assetPath);
  final file = File(dllPath);
  await file.writeAsBytes(
    byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
  );
  return dllPath;
}
