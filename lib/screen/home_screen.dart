import 'package:flutter/material.dart';
import '../bridge_generated.dart';

class HomeScreen extends StatelessWidget {
  final RustImpl rust;

  HomeScreen({Key? key, required this.rust}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('這裡是首頁'),
    );
  }
}
