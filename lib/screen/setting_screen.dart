import 'package:flutter/material.dart';
import '../component/setting/source_block.dart';
import '../component/setting/reset_button.dart'; // 引入 ResetButton
import '../bridge_generated.dart';

class SettingScreen extends StatelessWidget {
  final RustImpl rust;

  SettingScreen({Key? key, required this.rust}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 0),  // 設置上邊距為 0
      children: [
        SourceBlock(),
        // 可以在這裡添加更多的組件
        ResetButton(), // 在所有 Blocks 下方添加 ResetButton
      ],
    );
  }
}
