pub fn long_task() -> String {
    std::thread::sleep(std::time::Duration::from_secs(7));
    "長按鈕任務結束".to_string()
}

pub fn short_task() -> String {
    std::thread::sleep(std::time::Duration::from_secs(1));
    "短按鈕任務結束".to_string()
}