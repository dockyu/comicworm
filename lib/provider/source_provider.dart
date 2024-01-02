import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SourceStatus {
  bool isEnabled;
  bool isSelected;
  String sourceName; // 新增sourceName

  SourceStatus({this.isEnabled = false, this.isSelected = false, required this.sourceName}); // sourceName為必填項

  SourceStatus copyWith({bool? isEnabled, bool? isSelected, String? sourceName}) {
    return SourceStatus(
      isEnabled: isEnabled ?? this.isEnabled,
      isSelected: isSelected ?? this.isSelected,
      sourceName: sourceName ?? this.sourceName,
    );
  }

  Map<String, dynamic> toJson() => {
    'isEnabled': isEnabled,
    'isSelected': isSelected,
    // 不需要將sourceName存儲到JSON中，因為它是固定的
  };

  factory SourceStatus.fromJson(Map<String, dynamic> json, String sourceName) {
    return SourceStatus(
      isEnabled: json['isEnabled'] ?? false,
      isSelected: json['isSelected'] ?? false,
      sourceName: sourceName, // 從方法參數獲取sourceName
    );
  }
}

class SourceProvider with ChangeNotifier {
  Map<String, SourceStatus> _sources = {};

  // 定義預設的來源
  static final Map<String, SourceStatus> _defaultSources = {
    'webtoon': SourceStatus(isEnabled: true, isSelected: true, sourceName: 'Webtoon'),
    'baozimh': SourceStatus(isEnabled: true, isSelected: true, sourceName: '包子漫畫'),
    'happymh': SourceStatus(isEnabled: true, isSelected: false, sourceName: '嗨皮漫畫'),
    'manhuaren': SourceStatus(isEnabled: false, isSelected: false, sourceName: '漫畫人'),
    'dongmanmanhua': SourceStatus(isEnabled: false, isSelected: false, sourceName: '咚漫'),
    'kuaikanmanhua': SourceStatus(isEnabled: false, isSelected: false, sourceName: '快看漫畫'),
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
    removeSettings();
    _sources = Map.from(_defaultSources)
        .map((key, value) => MapEntry(key, value.copyWith()));
    saveSettings(); // 保存新設定到 SharedPreferences
    notifyListeners(); // 通知監聽器數據已變更
  }

  Future<void> loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? sourcesJson = prefs.getString('sources');

    if (sourcesJson != null) {
      Map<String, dynamic> existingSourcesMap = json.decode(sourcesJson);
      Map<String, SourceStatus> existingSources = existingSourcesMap.map(
              (key, value) => MapEntry(key, SourceStatus.fromJson(value, _defaultSources[key]?.sourceName ?? key)));

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
    await prefs.setString('sources', sourcesJson);
  }

  Future<void> removeSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('sources'); // 移除 'sources' 鍵及其值
  }

  // 其他方法...
}
