import 'dart:convert'; // 導入 dart:convert 庫

class SearchResult {
  final String name;
  final String url;
  final String source;
  final String sourceName;
  final String imageUrl;

  SearchResult({
    required this.name,
    required this.url,
    required this.source,
    required this.sourceName,
    required this.imageUrl,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
      name: json['name'] ?? '未知名稱',
      url: json['url'] ?? '未知網址',
      source: json['source'] ?? '未知來源',
      sourceName: json['sourceName'] ?? '未知來源名稱',
      imageUrl: json['image_url'] ?? '未知圖片網址',
    );
  }
}

class SearchResultParser {
  static List<SearchResult> fromJsonList(String jsonString) {
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList
        .map((jsonItem) => SearchResult.fromJson(jsonItem as Map<String, dynamic>))
        .toList();
  }
}
