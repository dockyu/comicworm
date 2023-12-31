import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert'; // 導入 dart:convert 庫

import '../provider/search_result_provider.dart';
import '../provider/source_provider.dart';
import '../component/search_box.dart'; // 引入 SearchBox 組件
import '../component/filter_button.dart'; // 引入 FilterButton 組件
import '../component/filter_dialog.dart'; // 導入 filter_dialog
import '../component/search_result_block.dart'; // 引入 SearchResultBlock
import '../model/search_result.dart';
import '../bridge_generated.dart';

class HomeScreen extends StatefulWidget {
  final RustImpl rust;

  HomeScreen({Key? key, required this.rust}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40.0, // 設置 AppBar 的高度
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight - 10),
          child: Padding(
            padding: EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 10.0),
            child: Row(
              children: [
                Expanded(
                  child: SearchBox(
                    searchController: _searchController,
                    onSearch: _startSearch,
                    isSearching: _isSearching,
                  ),
                ),
                SizedBox(width: 8.0), // 添加間隔
                FilterButton(onFilterTap: _showFilterDialog),
              ],
            ),
          ),
        ),
        // 其他 AppBar 配置...
      ),
      body: SearchResultBlock(), // 直接使用 SearchResultBlock
    );
  }

  void _startSearch(String query) async {
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

      final jsonString = await widget.rust.performSearch(query: query, sitesStatus: sourcesStatusJson);
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      final List<dynamic> jsonList = jsonMap['results'];
      final List<SearchResult> searchResults = jsonList
          .map((jsonItem) => SearchResult.fromJson(jsonItem as Map<String, dynamic>))
          .toList();

      final searchResultProvider = Provider.of<SearchResultProvider>(context, listen: false);
      searchResultProvider.setSearchResults(searchResults);
    } catch (e) {
      print('搜索出錯: $e');
    } finally {
      setState(() {
        _isSearching = false;
      });
    }
  }

  void _showFilterDialog() {
    showFilterDialog(context); // 調用 filter_dialog 中的函數
  }
}
