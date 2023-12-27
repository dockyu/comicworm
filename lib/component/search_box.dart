import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onSearch;
  final bool isSearching;

  const SearchBox({
    Key? key,
    required this.searchController,
    required this.onSearch,
    this.isSearching = false,
  }) : super(key: key);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10), // 增加水平方向的內邊距
      decoration: BoxDecoration(
        color: Colors.white, // 背景色為白色
        border: Border.all(color: Colors.grey.shade300, width: 1.0), // 邊框顏色和寬度
        borderRadius: BorderRadius.circular(30.0), // 圓角半徑更大，匹配設計
      ),
      child: TextField(
        controller: widget.searchController,
        decoration: InputDecoration(
          hintText: '搜索...',
          prefixIcon: null, // 移除左側圖標
          suffixIcon: widget.searchController.text.isEmpty
              ? Icon(Icons.search) // 當沒有文字輸入時顯示搜索圖標
              : IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    widget.searchController.clear();
                    widget.onSearch(''); // 清除文字後觸發搜索
                  },
                ),
          border: InputBorder.none, // 移除 TextField 默認的邊框
          contentPadding: EdgeInsets.symmetric(vertical: 10).copyWith(left: 20), // 增加左邊距離
        ),
        style: TextStyle(fontSize: 16), // 文字樣式，可根據需要調整
        onChanged: (value) {
          setState(() {}); // 更新UI
        },
        onSubmitted: widget.onSearch,
      ),
    );
  }
}
