import 'package:flutter/material.dart';
import 'filter_dialog.dart'; // 確保導入了 filter_dialog

class FilterButton extends StatelessWidget {
  const FilterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.filter_list),
      onPressed: () => showFilterDialog(context), // 直接調用 showFilterDialog
    );
  }
}
