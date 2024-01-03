use super::*;

pub fn create_crawler(key: &str) -> Option<Box<dyn Crawler + Send + Sync>> {
    match key {
        "webtoon" => Some(Box::new(WebtoonCrawler::new())),
        "baozimh" => Some(Box::new(BaozimhCrawler::new())),
        // 其他爬蟲...
        _ => None,
    }
}
