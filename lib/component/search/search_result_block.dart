// 文件：search_result_block.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/search_result_provider.dart'; // 引入 SearchResultProvider
import 'search_result_card.dart';

class SearchResultBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 從 Provider 獲取搜索結果
    final searchResults = Provider.of<SearchResultProvider>(context).searchResults;

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final result = searchResults[index];
        return SearchResultCard(searchResult: result);
      },
    );
  }
}
