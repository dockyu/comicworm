import 'package:flutter/material.dart';
import '../bridge_generated.dart';

class SettingScreen extends StatelessWidget {
  final RustImpl rust;

  SettingScreen({Key? key, required this.rust}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('這裡是設定頁'),
    );
  }
}
