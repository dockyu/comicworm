import 'package:flutter/material.dart';
import '../bridge_generated.dart';

class DownloadScreen extends StatelessWidget {
  final RustImpl rust;

  DownloadScreen({Key? key, required this.rust}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('這裡是下載頁'),
    );
  }
}
