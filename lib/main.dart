import 'package:flutter/material.dart';
import 'bridge_generated.dart'; // 導入自動生成的橋接代碼
import 'dart:ffi' as ffi; // 導入 dart:ffi

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Rust Bridge Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late RustImpl rust;

  @override
  void initState() {
    super.initState();
    // 初始化 RustImpl，加載您的 Rust DLL
    rust = RustImpl(ffi.DynamicLibrary.open('rust/target/release/rust.dll'));
  }

  String _message = ''; // 用於顯示 Rust 函數的返回值

  // 調用 Rust 中的長任務
  void _runLongTask() async {
    try {
      String result = await rust.longTask();
      setState(() {
        _message = result;
      });
    } catch (e) {
      setState(() {
        _message = '錯誤: $e';
      });
    }
  }

  // 調用 Rust 中的短任務
  void _runShortTask() async {
    try {
      String result = await rust.shortTask();
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
