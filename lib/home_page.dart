import 'package:flutter/material.dart';
import 'bridge_generated.dart';
import 'component/navigation_column.dart';
import 'component/logo_block.dart';
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
  static const Color backgroundColor = Color(0xFFFFFFFF); // 背景色

  @override
  void initState() {
    super.initState();
    _pages = [
      // 在 initState 中初始化 _pages
      HomeScreen(rust: widget.rust),
      TaskScreen(rust: widget.rust),
      SettingScreen(rust: widget.rust),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double minNavWidthWithTitle = 180.0; // 導航欄，顯示標題的最小寬度
    double maxNavWidthWithTitle = 280.0; // 導航欄，顯示標題的最大寬度
    bool showIconOnly =
        screenWidth * 0.2 < minNavWidthWithTitle; // 如果導航欄寬度小於最小寬度，只顯示圖標
    double navWidth;

    if (showIconOnly) {
      navWidth = 80; // 固定導航欄寬度為 80 像素，僅顯示圖標
    } else {
      navWidth = screenWidth * 0.20; // 導航欄寬度為屏幕寬度的 20%
      navWidth = navWidth.clamp(
          minNavWidthWithTitle, maxNavWidthWithTitle); // 設置最小寬度&最大寬度
    }

    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: Row(
          children: <Widget>[
            Container(
              width: navWidth,
              child: Column(
                children: [
                  LogoBlock(isIconOnly: showIconOnly), // 添加 LogoBlock
                  Expanded(
                    child: NavigationColumn(
                      onSelectItem: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      isIconOnly: showIconOnly, // 如果導航欄寬度小於最小寬度，則不顯示標題
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _pages[_selectedIndex],
            ),
          ],
        ),
      ),
    );
  }
}
