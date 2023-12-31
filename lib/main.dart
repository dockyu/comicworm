import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/search_result_provider.dart';
import 'provider/source_provider.dart';
import 'app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SearchResultProvider()),
        ChangeNotifierProvider(create: (context) => SourceProvider()),
      ],
      child: App(),
    ),
    
  );
}