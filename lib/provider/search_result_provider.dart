import 'package:flutter/material.dart';
import '../model/search_result.dart';

class SearchResultProvider with ChangeNotifier {
  List<SearchResult> _searchResults = [];

  List<SearchResult> get searchResults => _searchResults;

  void setSearchResults(List<SearchResult> results) {
    _searchResults = results;
    notifyListeners();
  }

  // 可以添加更多与搜索结果相关的方法和逻辑
}
