import 'package:flutter/material.dart';
import '../bridge_generated.dart';

class TaskScreen extends StatelessWidget {
  final RustImpl rust;

  TaskScreen({Key? key, required this.rust}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('這裡是任務頁'),
    );
  }
}
