import 'package:flutter/material.dart';

class NavigationColumn extends StatefulWidget {
  final Function(int) onSelectItem;
  final bool isIconOnly; // 使用新的命名

  NavigationColumn({required this.onSelectItem, this.isIconOnly = false}); // 更新構造函數

  @override
  _NavigationColumnState createState() => _NavigationColumnState();
}

class _NavigationColumnState extends State<NavigationColumn> {
  int _selectedIndex = 0; // 將選中索引作為狀態
  static const Color backgroundColor = Color(0xFF685577); // 導航欄使用的顏色
  static const Color objectColor = Color(0xFFD7D6D6); // 導航欄item使用的顏色

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor, // 為導航欄添加底色
      child: Column(
        children: <Widget>[
          _buildNavItem(Icons.search, '搜尋', 0),
          _buildNavItem(Icons.download, '下載', 1),
          _buildNavItem(Icons.settings, '設定', 2),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String title, int index) {
    bool isSelected = index == _selectedIndex; // 檢查是否選中

    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index; // 更新選中索引並刷新界面
        });
        widget.onSelectItem(index);
      },
      child: Container(
        height: 80, // 確保有足夠的空間垂直居中
        padding: widget.isIconOnly ? EdgeInsets.zero : EdgeInsets.only(left: 32.0), // 根據 isIconOnly 調整內邊距，且僅從左側padding
        decoration: isSelected
            ? BoxDecoration(
                border: Border(left: BorderSide(width: 5.0, color: objectColor)), // 左側的白色橫槓
              )
            : null,
        child: Row(
          mainAxisAlignment: widget.isIconOnly ? MainAxisAlignment.center : MainAxisAlignment.start, // 根據 isIconOnly 調整水平對齊
          crossAxisAlignment: CrossAxisAlignment.center, // 垂直居中
          children: <Widget>[
            Icon(icon, color: objectColor, size: 40), // 圖標設為白色
            if (!widget.isIconOnly) ...[ // 如果顯示標題
              SizedBox(width: 10.0), // 圖標和文字之間的空隙
              Text(
                title,
                style: TextStyle(color: objectColor, fontSize: 14), // 設置文本顏色和字體大小
              ),
            ],
          ],
        ),
      ),
    );
  }
}
