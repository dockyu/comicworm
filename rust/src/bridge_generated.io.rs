use super::*;
// Section: wire functions

#[no_mangle]
pub extern "C" fn wire_perform_search(
    port_: i64,
    query: *mut wire_uint_8_list,
    sites_status: *mut wire_uint_8_list,
) {
    wire_perform_search_impl(port_, query, sites_status)
}

#[no_mangle]
pub extern "C" fn wire_create_simple_class(port_: i64, property: *mut wire_uint_8_list) {
    wire_create_simple_class_impl(port_, property)
}

#[no_mangle]
pub extern "C" fn wire_print_simple_class_property(
    port_: i64,
    class_instance: *mut wire_SimpleClass,
) {
    wire_print_simple_class_property_impl(port_, class_instance)
}

#[no_mangle]
pub extern "C" fn wire_get_simple_class_property(
    port_: i64,
    class_instance: *mut wire_SimpleClass,
) {
    wire_get_simple_class_property_impl(port_, class_instance)
}

// Section: allocate functions

#[no_mangle]
pub extern "C" fn new_box_autoadd_simple_class_0() -> *mut wire_SimpleClass {
    support::new_leak_box_ptr(wire_SimpleClass::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_uint_8_list_0(len: i32) -> *mut wire_uint_8_list {
    let ans = wire_uint_8_list {
        ptr: support::new_leak_vec_ptr(Default::default(), len),
        len,
    };
    support::new_leak_box_ptr(ans)
}

// Section: related functions

// Section: impl Wire2Api

impl Wire2Api<String> for *mut wire_uint_8_list {
    fn wire2api(self) -> String {
        let vec: Vec<u8> = self.wire2api();
        String::from_utf8_lossy(&vec).into_owned()
    }
}
impl Wire2Api<SimpleClass> for *mut wire_SimpleClass {
    fn wire2api(self) -> SimpleClass {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<SimpleClass>::wire2api(*wrap).into()
    }
}
impl Wire2Api<SimpleClass> for wire_SimpleClass {
    fn wire2api(self) -> SimpleClass {
        SimpleClass {
            property: self.property.wire2api(),
        }
    }
}

impl Wire2Api<Vec<u8>> for *mut wire_uint_8_list {
    fn wire2api(self) -> Vec<u8> {
        unsafe {
            let wrap = support::box_from_leak_ptr(self);
            support::vec_from_leak_ptr(wrap.ptr, wrap.len)
        }
    }
}
// Section: wire structs

#[repr(C)]
#[derive(Clone)]
pub struct wire_SimpleClass {
    property: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_uint_8_list {
    ptr: *mut u8,
    len: i32,
}

// Section: impl NewWithNullPtr

pub trait NewWithNullPtr {
    fn new_with_null_ptr() -> Self;
}

impl<T> NewWithNullPtr for *mut T {
    fn new_with_null_ptr() -> Self {
        std::ptr::null_mut()
    }
}

impl NewWithNullPtr for wire_SimpleClass {
    fn new_with_null_ptr() -> Self {
        Self {
            property: core::ptr::null_mut(),
        }
    }
}

impl Default for wire_SimpleClass {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

// Section: sync execution mode utility

#[no_mangle]
pub extern "C" fn free_WireSyncReturn(ptr: support::WireSyncReturn) {
    unsafe {
        let _ = support::box_from_leak_ptr(ptr);
    };
}
