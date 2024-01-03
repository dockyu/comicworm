use super::{Crawler, SearchResult};

pub struct WebtoonCrawler;

impl WebtoonCrawler {
    pub fn new() -> Self {
        WebtoonCrawler
    }
}

impl Crawler for WebtoonCrawler {
    fn search(&self, query: String) -> Vec<SearchResult> {
        vec![SearchResult {
            name: format!("{} - webtoon", query),
            url: "https://www.webtoons.com/zh-hant/city-office/newface/list?title_no=1759".to_string(),
            source: "webtoon".to_string(),
            sourceName: "Webtoon".to_string(),
            image_url: "https://webtoon-phinf.pstatic.net/20230606_170/16860594695688yp2P_PNG/4thumb_ipad_510x510.png?type=q90".to_string(),
        }]
    }
}