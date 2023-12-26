import 'package:flutter/material.dart';

class LogoBlock extends StatelessWidget {
  final bool isIconOnly; // 根據這個變量決定是否僅顯示圖標

  LogoBlock({this.isIconOnly = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: isIconOnly ? _buildIconOnly() : _buildAppInfo(),
    );
  }

  Widget _buildIconOnly() {
    // 僅顯示圖標
    return Center(
      child: Image.network(
        'https://gitlab.com/HelloWorldOvO/picture-bed/-/raw/main/github_icon.png',
        width: 60,
      ),
    );
  }

  Widget _buildAppInfo() {
    // 顯示應用信息
    return Padding(
      padding: EdgeInsets.only(left: 20.0), // 從左側添加內邊距
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // 確保內容靠左對齊
        children: [
          Image.network(
            'https://gitlab.com/HelloWorldOvO/picture-bed/-/raw/main/github_info.png', // AppInfo 圖片 URL
            width: 150, // 圖片寬度
            // color: Colors.blue, // 可選，如果想改變圖片顏色
          ),
        ],
      ),
    );
  }
}
