import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/source_provider.dart';
import '../../provider/search_result_provider.dart';
import '../../model/search_result.dart';
import '../../bridge_generated.dart';
import 'dart:convert';

class SearchBox extends StatefulWidget {
  final TextEditingController searchController;
  final RustImpl rust;

  const SearchBox({
    Key? key,
    required this.searchController,
    required this.rust,
  }) : super(key: key);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  bool _isSearching = false;

  Future<void> _startSearch(String query) async {
    if (query.isEmpty) return;

    setState(() {
      _isSearching = true;
    });

    try {
      final sourceProvider = Provider.of<SourceProvider>(context, listen: false);
      final sourcesStatus = sourceProvider.sources.map((key, value) => MapEntry(key, {
        'isEnabled': value.isEnabled,
        'isSelected': value.isSelected,
      }));

      final sourcesStatusJson = json.encode(sourcesStatus);

      // print('發送搜索請求: $query, $sourcesStatusJson');
      final jsonString = await widget.rust.ffiSearch(query: query, sourcesStatus: sourcesStatusJson);
      // print('接收到的響應: $jsonString');
      // 使用 SearchResultParser 解析 JSON 字符串
      final List<SearchResult> searchResults = SearchResultParser.fromJsonList(jsonString);

      Provider.of<SearchResultProvider>(context, listen: false).setSearchResults(searchResults);
    } catch (e) {
      print('搜索出錯: $e');
    } finally {
      setState(() {
        _isSearching = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300, width: 1.0),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: TextField(
        controller: widget.searchController,
        decoration: InputDecoration(
          hintText: '搜索...',
          prefixIcon: null,
          suffixIcon: widget.searchController.text.isEmpty
              ? Icon(Icons.search)
              : IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    widget.searchController.clear();
                    _startSearch('');
                  },
                ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 10).copyWith(left: 20),
        ),
        style: TextStyle(fontSize: 16),
        onChanged: (value) {
          setState(() {});
        },
        onSubmitted: _startSearch,
      ),
    );
  }
}
