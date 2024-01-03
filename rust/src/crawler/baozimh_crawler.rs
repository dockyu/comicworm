use super::{Crawler, SearchResult};
pub struct BaozimhCrawler;

impl BaozimhCrawler {
    pub fn new() -> Self {
        BaozimhCrawler
    }
}

impl Crawler for BaozimhCrawler {
    fn search(&self, query: String) -> Vec<SearchResult> {
        vec![SearchResult {
            name: format!("{} - 包子漫畫", &query),
            url: "https://www.baozimh.com/comic/shiyouzhiguocaiseban-dinianmiaogongzuoshi".to_string(),
            source: "baozimh".to_string(),
            sourceName: "包子漫畫".to_string(),
            image_url: "https://static-tw.baozimh.com/cover/shiyouzhiguocaiseban-dinianmiaogongzuoshi.jpg?w=285&h=375&q=100".to_string(),
        }]
    }
}