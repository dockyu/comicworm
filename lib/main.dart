import 'package:flutter/material.dart';
import 'bridge_generated.dart'; // 導入自動生成的橋接代碼
import 'dart:ffi' as ffi; // 導入 dart:ffi
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Rust Bridge Demo',
      home: FutureBuilder<RustImpl>(
        future: _initRust(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            // Rust DLL 加載完成，返回主頁面
            return MyHomePage(rust: snapshot.data!);
          } else if (snapshot.hasError) {
            // 加載過程中發生錯誤
            return Scaffold(
              body: Center(child: Text('加載錯誤: ${snapshot.error}')),
            );
          } else {
            // Rust DLL 正在加載，顯示加載指示器
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
  // 從資源中提取 DLL
  final dllPath = await extractDllFromAssets('assets/rust.dll');

  // 使用提取的 DLL 初始化 RustImpl
  return RustImpl(ffi.DynamicLibrary.open(dllPath));
}

Future<String> extractDllFromAssets(String assetPath) async {
  // 獲取臨時目錄
  final dir = await getTemporaryDirectory();
  final dllPath = '${dir.path}/rust.dll';

  // 從資源中讀取 DLL 文件
  final byteData = await rootBundle.load(assetPath);

  // 將 DLL 文件寫入文件系統
  final file = File(dllPath);
  await file.writeAsBytes(
    byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
  );

  return dllPath;
}

class MyHomePage extends StatefulWidget {
  final RustImpl rust;

  MyHomePage({Key? key, required this.rust}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _message = ''; // 用於顯示 Rust 函數的返回值

  void _runLongTask() async {
    try {
      String result = await widget.rust.longTask();
      setState(() {
        _message = result;
      });
    } catch (e) {
      setState(() {
        _message = '錯誤: $e';
      });
    }
  }

  void _runShortTask() async {
    try {
      String result = await widget.rust.shortTask();
      setState(() {
        _message = result;
      });
    } catch (e) {
      setState(() {
        _message = '錯誤: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Rust Bridge Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _runShortTask,
              child: Text('短按鈕'),
            ),
            ElevatedButton(
              onPressed: _runLongTask,
              child: Text('長按鈕'),
            ),
            SizedBox(height: 20),
            Text(_message), // 顯示 Rust 函數的返回值
          ],
        ),
      ),
    );
  }
}
