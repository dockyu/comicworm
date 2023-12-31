import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/source_provider.dart'; // 請確保導入正確的路徑

class ResetButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0, bottom: 4.0, left: 16.0, right: 4.0), // 自定義上下左右方向的padding值
      child: Align(
        alignment: Alignment.centerLeft,
        child: ElevatedButton(
          onPressed: () {
            // 獲取 SourceProvider 實例並調用 resetSources 方法
            Provider.of<SourceProvider>(context, listen: false).resetSources();
          },
          child: Text('重置所有設置'),
          style: ElevatedButton.styleFrom(
            // 設置按鈕的最小尺寸
            minimumSize: Size(120, 48), // 這裏可以根據需要調整尺寸
          ),
        ),
      ),
    );
  }
}
