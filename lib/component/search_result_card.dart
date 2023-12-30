import 'package:flutter/material.dart';
import '../model/search_result.dart';

class SearchResultCard extends StatelessWidget {
  final SearchResult searchResult;

  SearchResultCard({required this.searchResult});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180, // 設置固定高度
      child: Card(
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0), // 圖片區塊的填充
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    searchResult.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return Container(
                        color: Colors.white,
                        child: Icon(Icons.error, color: Colors.red),
                      );
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0), // 文字區塊的填充
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      searchResult.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(searchResult.source),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0), // 按鈕的填充
              // 開始下載的按鈕
              child: IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () {
                  // 開始下載的邏輯
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
