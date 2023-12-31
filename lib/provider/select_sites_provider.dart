import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SiteStatus {
  bool isEnabled;
  bool isSelected;

  SiteStatus({this.isEnabled = false, this.isSelected = false});

  Map<String, dynamic> toJson() => {
        'isEnabled': isEnabled,
        'isSelected': isSelected,
      };

  factory SiteStatus.fromJson(Map<String, dynamic> json) {
    return SiteStatus(
      isEnabled: json['isEnabled'] ?? false,
      isSelected: json['isSelected'] ?? false,
    );
  }
}

class SelectedSitesProvider with ChangeNotifier {
  Map<String, SiteStatus> _sites = {};

  SelectedSitesProvider() {
    loadSettings();
  }

  Map<String, SiteStatus> get sites => _sites;

  void toggleSiteSelection(String siteName) {
    if (_sites.containsKey(siteName)) {
      _sites[siteName]!.isSelected = !_sites[siteName]!.isSelected;
      saveSettings();
      notifyListeners();
    }
  }

  Future<void> loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? sitesJson = prefs.getString('selected_sites');

    if (sitesJson != null) {
      Map<String, dynamic> sitesMap = json.decode(sitesJson);
      _sites = sitesMap.map((key, value) => MapEntry(key, SiteStatus.fromJson(value)));
    } else {
      // 初始化預設站點列表
      _sites = {
        'webtoon': SiteStatus(isEnabled: true, isSelected: true),
        '包子漫畫': SiteStatus(isEnabled: true, isSelected: true),
        '網站3': SiteStatus(isEnabled: false, isSelected: false),
        '網站4': SiteStatus(isEnabled: true, isSelected: false),
        // 更多預設站點...
      };
    }
    notifyListeners();
  }

  Future<void> saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String sitesJson = json.encode(_sites.map((key, value) => MapEntry(key, value.toJson())));
    await prefs.setString('selected_sites', sitesJson);
  }

  // 其他方法...
}
