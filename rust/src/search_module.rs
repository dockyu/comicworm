use serde_json::{json, Value};

pub fn perform_search(query: String, sites_status: String) -> String {
    // 解析 sites_status JSON 字符串
    let sites_status: Value = serde_json::from_str(&sites_status).unwrap();

    let mut results = vec![];

    // 對每個網站單獨進行判斷
    if let Some(site) = sites_status.get("webtoon") {
        if site["isEnabled"].as_bool().unwrap_or(false) && site["isSelected"].as_bool().unwrap_or(false) {
            results.push(json!({
                "name": format!("{} - webtoon", &query),
                "url": "https://www.webtoons.com/zh-hant/city-office/newface/list?title_no=1759",
                "source": "webtoon",
                "sourceName": "Webtoon",
                "image_url": "https://webtoon-phinf.pstatic.net/20230606_170/16860594695688yp2P_PNG/4thumb_ipad_510x510.png?type=q90"
            }));
        }
    }
    // 重複上述邏輯以檢查其他網站
    if let Some(site) = sites_status.get("包子漫畫") {
        if site["isEnabled"].as_bool().unwrap_or(false) && site["isSelected"].as_bool().unwrap_or(false) {
            results.push(json!({
                "name": format!("{} - 包子漫畫", &query),
                "url": "https://www.baozimh.com/comic/shiyouzhiguocaiseban-dinianmiaogongzuoshi",
                "source": "baozimh",
                "sourceName": "包子漫畫",
                "image_url": "https://static-tw.baozimh.com/cover/shiyouzhiguocaiseban-dinianmiaogongzuoshi.jpg?w=285&h=375&q=100"
            }));
        }
    }
    // ... 檢查其他網站 ...

    let search_results = json!({ "results": results });
    search_results.to_string()
}
