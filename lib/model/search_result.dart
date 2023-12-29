import 'dart:convert'; // 導入 dart:convert 庫

class SearchResult {
  final String name;
  final String url;
  final String source;
  final String imageUrl;

  SearchResult({
    required this.name,
    required this.url,
    required this.source,
    required this.imageUrl,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
      name: json['name'],
      url: json['url'],
      source: json['source'],
      imageUrl: json['image_url'],
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
