// 檔案名稱: component/filter_button.dart
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final VoidCallback onFilterTap;

  const FilterButton({Key? key, required this.onFilterTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.filter_list),
      onPressed: onFilterTap,
    );
  }
}
