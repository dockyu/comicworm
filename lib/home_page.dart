import 'package:flutter/material.dart';
import 'bridge_generated.dart';
import 'component/navigation_column.dart';
import 'screen/home_screen.dart';
import 'screen/task_screen.dart';
import 'screen/setting_screen.dart';

class HomePage extends StatefulWidget {
  final RustImpl rust;

  HomePage({Key? key, required this.rust}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [ // 在 initState 中初始化 _pages
      HomeScreen(rust: widget.rust),
      TaskScreen(rust: widget.rust),
      SettingScreen(rust: widget.rust),
    ];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Row(
        children: <Widget>[
          Container(
            width: 200, // 可以調整導航欄的寬度
            child: NavigationColumn(onSelectItem: (index) {
              setState(() {
                _selectedIndex = index;
              });
            }),
          ),
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
