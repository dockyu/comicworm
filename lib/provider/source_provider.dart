import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SourceStatus {
  bool isEnabled;
  bool isSelected;

  SourceStatus({this.isEnabled = false, this.isSelected = false});

  SourceStatus copyWith({bool? isEnabled, bool? isSelected}) {
    return SourceStatus(
      isEnabled: isEnabled ?? this.isEnabled,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toJson() => {
        'isEnabled': isEnabled,
        'isSelected': isSelected,
      };

  factory SourceStatus.fromJson(Map<String, dynamic> json) {
    return SourceStatus(
      isEnabled: json['isEnabled'] ?? false,
      isSelected: json['isSelected'] ?? false,
    );
  }
}

class SourceProvider with ChangeNotifier {
  Map<String, SourceStatus> _sources = {};

  // 定義預設的來源
  static final Map<String, SourceStatus> _defaultSources = {
    'webtoon': SourceStatus(isEnabled: true, isSelected: true),
    '包子漫畫': SourceStatus(isEnabled: true, isSelected: true),
    '嗨皮漫畫': SourceStatus(isEnabled: true, isSelected: false),
    '漫畫人': SourceStatus(isEnabled: false, isSelected: false),
    '咚漫': SourceStatus(isEnabled: false, isSelected: false),
    // 省略其他來源...
  };

  SourceProvider() {
    loadSettings();
  }

  Map<String, SourceStatus> get sources => _sources;

  void toggleSiteSelection(String siteName) {
    if (_sources.containsKey(siteName)) {
      _sources[siteName]!.isSelected = !_sources[siteName]!.isSelected;
      saveSettings();
      notifyListeners();
    }
  }

  void toggleSiteEnable(String siteName) {
    if (_sources.containsKey(siteName)) {
      _sources[siteName]!.isEnabled = !_sources[siteName]!.isEnabled;
      saveSettings();
      notifyListeners();
    }
  }

  void resetSources() {
    // 重設源數據為初始狀態或預設狀態
    _sources = Map.from(_defaultSources)
        .map((key, value) => MapEntry(key, value.copyWith()));
    saveSettings(); // 保存新設定到 SharedPreferences
    notifyListeners(); // 通知監聽器數據已變更
  }

  Future<void> loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? sourcesJson = prefs.getString('selected_sources');

    if (sourcesJson != null) {
      Map<String, dynamic> existingSourcesMap = json.decode(sourcesJson);
      Map<String, SourceStatus> existingSources = existingSourcesMap.map(
        (key, value) => MapEntry(key, SourceStatus.fromJson(value)));

      // 合併並篩選來源，僅保留存在於預設來源中的來源
      _sources = {
        for (var d in _defaultSources.entries)
          if (existingSources.containsKey(d.key))
            d.key: existingSources[d.key]!
          else
            d.key: d.value,
      };
    } else {
      _sources = _defaultSources;
    }
    notifyListeners();
  }

  Future<void> saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String sourcesJson = json.encode(_sources.map((key, value) => MapEntry(key, value.toJson())));
    await prefs.setString('selected_sources', sourcesJson);
  }

  // 其他方法...
}
