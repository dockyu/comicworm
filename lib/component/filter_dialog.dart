import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/source_provider.dart';

void showFilterDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        title: Text('選擇來源'),
        content: Consumer<SourceProvider>( // 使用新的 SourceProvider
          builder: (context, provider, child) {
            var enabledSources = provider.sources.entries
                .where((entry) => entry.value.isEnabled)
                .toList();

            return SingleChildScrollView(
              child: Column(
                children: enabledSources.map((sourceEntry) => CheckboxListTile(
                  title: Text(sourceEntry.key),
                  value: sourceEntry.value.isSelected,
                  onChanged: (bool? value) {
                    provider.toggleSiteSelection(sourceEntry.key);
                  },
                )).toList(),
              ),
            );
          },
        ),
        actions: <Widget>[
          TextButton(
            child: Text('確定'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
