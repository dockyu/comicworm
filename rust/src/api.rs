// api.rs

use flutter_rust_bridge::frb;
use std::sync::Mutex;
use once_cell::sync::OnceCell;
use crate::search_module;
use crate::test_module::SimpleClass;
use crate::crawler_manager::CrawlerManager;

static GLOBAL_CRAWLER_MANAGER: OnceCell<Mutex<CrawlerManager>> = OnceCell::new();

// 暴露給 Flutter 的 FFI 函數
#[frb]
pub fn ffi_search(query: String, sources_status: String) -> String {
    let crawler_manager = GLOBAL_CRAWLER_MANAGER
        .get_or_init(|| Mutex::new(CrawlerManager::new()))
        .lock().unwrap();

    crawler_manager.search(query, sources_status)
}

/*
    測試用
    新增一個 FFI 函數來操作 count
*/

#[frb]
pub fn ffi_increment_and_print_count() {
    let mut crawler_manager = GLOBAL_CRAWLER_MANAGER
        .get_or_init(|| Mutex::new(CrawlerManager::new()))
        .lock().unwrap();

    crawler_manager.increment_count();
    crawler_manager.print_count();
}

// function的search
#[frb]
pub fn perform_search(query: String, sources_status: String) -> String {
    search_module::perform_search(query, sources_status)
}

// SimpleClass 測試
#[frb]
pub fn create_simple_class(property: String) -> SimpleClass {
    SimpleClass::new(property)
}

#[frb]
pub fn print_simple_class_property(class_instance: SimpleClass) {
    class_instance.print_property();
}

#[frb]
pub fn get_simple_class_property(class_instance: SimpleClass) -> String {
    class_instance.get_property()
}
