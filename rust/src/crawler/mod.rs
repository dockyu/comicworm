pub mod webtoon_crawler;
pub mod baozimh_crawler;
pub mod crawler;    // Crawler 是一個 trait
pub mod crawler_factory;

pub use webtoon_crawler::WebtoonCrawler;
pub use baozimh_crawler::BaozimhCrawler;
pub use crawler::Crawler;
pub use crawler::SearchResult;
pub use crawler_factory::create_crawler;
