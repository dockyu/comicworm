// filter_dialog.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'your_provider_file.dart'; // 導入您的 Provider 定義

void showFilterDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        title: Text('選擇網站'),
        content: Consumer<SelectedSitesProvider>(
          builder: (context, provider, child) {
            var enabledSites = provider.sites.entries
                .where((entry) => entry.value.isEnabled)
                .toList();

            return ListView.builder(
              shrinkWrap: true,
              itemCount: enabledSites.length,
              itemBuilder: (context, index) {
                var siteEntry = enabledSites[index];
                return CheckboxListTile(
                  title: Text(siteEntry.key),
                  value: siteEntry.value.isSelected,
                  onChanged: (bool? value) {
                    provider.toggleSiteSelection(siteEntry.key);
                  },
                );
              },
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
