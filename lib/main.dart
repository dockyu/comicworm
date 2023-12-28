import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/search_result_provider.dart';
import 'app.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SearchResultProvider(),
      child: App(),
    ),
    
  );
}