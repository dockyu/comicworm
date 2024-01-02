pub struct SimpleClass {
    pub property: String,
}

impl SimpleClass {
    pub fn new(property: String) -> Self {
        SimpleClass { property }
    }

    // 打印字符串的方法
    pub fn print_property(&self) {
        println!("Property: {}", self.property);
    }

    // 返回字符串的方法
    pub fn get_property(&self) -> String {
        self.property.clone()
    }
}
