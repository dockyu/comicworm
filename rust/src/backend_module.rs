// backend_module.rs

use serde_json::json;

pub fn perform_search(query: String) -> String {
    let search_results = json!({
        "results": [
            {
                "name": &query,
                "url": "https://example.com/1",
                "source": "Source 1",
                "image_url": "https://example.com/images/1.jpg"
            },
            {
                "name": "Example Result 2",
                "url": "https://example.com/12",
                "source": "Source 2",
                "image_url": "https://example.com/images/2.jpg"
              },
            // ...其他结果...
        ]
    });

    search_results.to_string()
}
