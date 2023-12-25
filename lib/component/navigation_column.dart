import 'package:flutter/material.dart';

class NavigationColumn extends StatelessWidget {
  final Function(int) onSelectItem;

  NavigationColumn({required this.onSelectItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // 導航選項...
        ListTile(
          leading: Icon(Icons.home),
          title: Text('首頁'),
          onTap: () => onSelectItem(0),
        ),
        ListTile(
          leading: Icon(Icons.task),
          title: Text('任務'),
          onTap: () => onSelectItem(1),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('設定'),
          onTap: () => onSelectItem(2),
        ),
      ],
    );
  }
}
