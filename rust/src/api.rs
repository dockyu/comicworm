use flutter_rust_bridge::frb; // 確保引入了 flutter_rust_bridge 的宏

// 引入 testmodule
use crate::testmodule;

#[frb]
pub fn long_task() -> String {
    testmodule::long_task()
}

#[frb]
pub fn short_task() -> String {
    testmodule::short_task()
}
