// api.rs

use flutter_rust_bridge::frb;
use crate::search_module;

#[frb]
pub fn perform_search(query: String, sites_status: String) -> String {
    search_module::perform_search(query, sites_status)
}
