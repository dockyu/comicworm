import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/search_result_provider.dart';
import 'provider/source_provider.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 創建 SourceProvider 實例並加載設置
  var sourceProvider = SourceProvider();
  await sourceProvider.loadSettings();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SearchResultProvider>(create: (context) => SearchResultProvider()),
        ChangeNotifierProvider<SourceProvider>.value(value: sourceProvider),
      ],
      child: App(),
    ),
  );
}