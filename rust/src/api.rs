// api.rs

use flutter_rust_bridge::frb;
use crate::search_module;
use crate::test_module::SimpleClass;

#[frb]
pub fn perform_search(query: String, sources_status: String) -> String {
    search_module::perform_search(query, sources_status)
}

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
