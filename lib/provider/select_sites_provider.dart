import 'package:flutter/material.dart';

class SiteStatus {
  bool isEnabled;
  bool isSelected;

  SiteStatus({this.isEnabled = false, this.isSelected = false});
}

class SelectedSitesProvider with ChangeNotifier {
  Map<String, SiteStatus> _sites = {
    'webtoon': SiteStatus(isEnabled: true, isSelected: true),
    '包子漫畫': SiteStatus(isEnabled: true, isSelected: false),
    '網站3': SiteStatus(isEnabled: false, isSelected: false),
    '網站4': SiteStatus(isEnabled: true, isSelected: false),
    '網站5': SiteStatus(isEnabled: false, isSelected: false),
    '網站6': SiteStatus(isEnabled: true, isSelected: false),
    // 其他網站...
  };

  Map<String, SiteStatus> get sites => _sites;

  void toggleSiteSelection(String siteName) {
    if (_sites.containsKey(siteName)) {
      _sites[siteName]!.isSelected = !_sites[siteName]!.isSelected;
      notifyListeners();
    }
  }

  // 其他方法...
}
