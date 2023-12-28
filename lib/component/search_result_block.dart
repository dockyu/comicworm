// 文件：search_result_block.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/search_result_provider.dart'; // 引入 SearchResultProvider
import '../model/search_result.dart'; // 引入 SearchResult 类

class SearchResultBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 从 Provider 获取搜索结果
    final searchResults = Provider.of<SearchResultProvider>(context).searchResults;

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final result = searchResults[index];
        return ListTile(
          title: Text(result.name),
          subtitle: Text(result.url),
          // 其他 UI 元素...
        );
      },
    );
  }
}
