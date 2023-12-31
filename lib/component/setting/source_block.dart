// source_block.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/source_provider.dart';

class SourceBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SourceProvider>(
      builder: (context, provider, child) {
        var sources = provider.sources.entries.toList();

        return Column(
          children: [
            ExpansionTile(
              title: Text('啟用來源'),
              initiallyExpanded: false,  // 初始時設置為未展開
              children: sources.map((sourceEntry) {
                return ListTile(
                  title: Text(sourceEntry.key),
                  trailing: Switch(
                    value: sourceEntry.value.isEnabled,
                    onChanged: (bool value) {
                      provider.toggleSiteEnable(sourceEntry.key);
                    },
                  ),
                );
              }).toList(),
            ),
            Divider(height: 1), // 添加底部邊界
          ],
        );
      },
    );
  }
}
