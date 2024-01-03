use serde::{Serialize, Deserialize};

pub trait Crawler: Send + Sync {
    fn search(&self, query: String) -> Vec<SearchResult>;
}

#[derive(Serialize, Deserialize)]
pub struct SearchResult {
    pub name: String,
    pub url: String,
    pub source: String,
    pub sourceName: String,
    pub image_url: String,
}