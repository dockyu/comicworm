use crate::crawler::*;
use serde_json::to_string;
use std::{sync::Arc, thread};

pub struct CrawlerManager;

impl CrawlerManager {
    pub fn new() -> Self {
        CrawlerManager
    }

    pub fn search(&self, query: String, sources_status: String) -> String {
        // println!("CrawlerManager 收到 {}", sources_status);
        let sources: serde_json::Value = serde_json::from_str(&sources_status).unwrap();
        let mut handles = Vec::new();

        for (key, value) in sources.as_object().unwrap() {
            if value["isEnabled"].as_bool().unwrap_or(false) && value["isSelected"].as_bool().unwrap_or(false) {
                // println!("Crawler enabled and selected: {}", key); // 打印符合條件的爬蟲名稱
                if let Some(crawler) = create_crawler(key.as_str()) {
                    let crawler = Arc::new(crawler);
                    let crawler_clone = Arc::clone(&crawler);
                    let query_clone = query.clone();
                    let handle = thread::spawn(move || {
                        crawler_clone.search(query_clone)
                    });
                    handles.push(handle);
                }
            }
        }

        let mut all_results = Vec::new();
        for handle in handles {
            if let Ok(results) = handle.join() {
                all_results.extend(results);
            }
        }

        to_string(&all_results).unwrap()
    }
}
