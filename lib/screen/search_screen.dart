import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/search_result_provider.dart';
import '../provider/source_provider.dart';
import '../component/search/search_box.dart';
import '../component/search/filter_button.dart';
import '../component/search/filter_dialog.dart';
import '../component/search/search_result_block.dart';
import '../bridge_generated.dart'; // 確保導入了 RustImpl

class SearchScreen extends StatefulWidget {
  final RustImpl rust;

  SearchScreen({Key? key, required this.rust}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ...AppBar配置
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight - 10),
          child: Padding(
            padding: EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 10.0),
            child: Row(
              children: [
                Expanded(
                  child: SearchBox(
                    searchController: _searchController,
                    rust: widget.rust,
                  ),
                ),
                SizedBox(width: 8.0),
                FilterButton(), // 直接使用 FilterButton，無需額外參數
              ],
            ),
          ),
        ),
      ),
      body: SearchResultBlock(),
    );
  }
}
