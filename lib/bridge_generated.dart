// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.82.6.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, unnecessary_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member, prefer_is_empty, unnecessary_const

import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:uuid/uuid.dart';

import 'dart:ffi' as ffi;

abstract class Rust {
  Future<String> ffiSearch(
      {required String query, required String sourcesStatus, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kFfiSearchConstMeta;

  Future<void> ffiIncrementAndPrintCount({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kFfiIncrementAndPrintCountConstMeta;

  Future<String> performSearch(
      {required String query, required String sourcesStatus, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kPerformSearchConstMeta;

  Future<SimpleClass> createSimpleClass(
      {required String property, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kCreateSimpleClassConstMeta;

  Future<void> printSimpleClassProperty(
      {required SimpleClass classInstance, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kPrintSimpleClassPropertyConstMeta;

  Future<String> getSimpleClassProperty(
      {required SimpleClass classInstance, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kGetSimpleClassPropertyConstMeta;
}

class SimpleClass {
  final String property;

  const SimpleClass({
    required this.property,
  });
}

class RustImpl implements Rust {
  final RustPlatform _platform;
  factory RustImpl(ExternalLibrary dylib) => RustImpl.raw(RustPlatform(dylib));

  /// Only valid on web/WASM platforms.
  factory RustImpl.wasm(FutureOr<WasmModule> module) =>
      RustImpl(module as ExternalLibrary);
  RustImpl.raw(this._platform);
  Future<String> ffiSearch(
      {required String query, required String sourcesStatus, dynamic hint}) {
    var arg0 = _platform.api2wire_String(query);
    var arg1 = _platform.api2wire_String(sourcesStatus);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_ffi_search(port_, arg0, arg1),
      parseSuccessData: _wire2api_String,
      parseErrorData: null,
      constMeta: kFfiSearchConstMeta,
      argValues: [query, sourcesStatus],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kFfiSearchConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "ffi_search",
        argNames: ["query", "sourcesStatus"],
      );

  Future<void> ffiIncrementAndPrintCount({dynamic hint}) {
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_ffi_increment_and_print_count(port_),
      parseSuccessData: _wire2api_unit,
      parseErrorData: null,
      constMeta: kFfiIncrementAndPrintCountConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kFfiIncrementAndPrintCountConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "ffi_increment_and_print_count",
        argNames: [],
      );

  Future<String> performSearch(
      {required String query, required String sourcesStatus, dynamic hint}) {
    var arg0 = _platform.api2wire_String(query);
    var arg1 = _platform.api2wire_String(sourcesStatus);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_perform_search(port_, arg0, arg1),
      parseSuccessData: _wire2api_String,
      parseErrorData: null,
      constMeta: kPerformSearchConstMeta,
      argValues: [query, sourcesStatus],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kPerformSearchConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "perform_search",
        argNames: ["query", "sourcesStatus"],
      );

  Future<SimpleClass> createSimpleClass(
      {required String property, dynamic hint}) {
    var arg0 = _platform.api2wire_String(property);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_create_simple_class(port_, arg0),
      parseSuccessData: _wire2api_simple_class,
      parseErrorData: null,
      constMeta: kCreateSimpleClassConstMeta,
      argValues: [property],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kCreateSimpleClassConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "create_simple_class",
        argNames: ["property"],
      );

  Future<void> printSimpleClassProperty(
      {required SimpleClass classInstance, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_simple_class(classInstance);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_print_simple_class_property(port_, arg0),
      parseSuccessData: _wire2api_unit,
      parseErrorData: null,
      constMeta: kPrintSimpleClassPropertyConstMeta,
      argValues: [classInstance],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kPrintSimpleClassPropertyConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "print_simple_class_property",
        argNames: ["classInstance"],
      );

  Future<String> getSimpleClassProperty(
      {required SimpleClass classInstance, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_simple_class(classInstance);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_get_simple_class_property(port_, arg0),
      parseSuccessData: _wire2api_String,
      parseErrorData: null,
      constMeta: kGetSimpleClassPropertyConstMeta,
      argValues: [classInstance],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kGetSimpleClassPropertyConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "get_simple_class_property",
        argNames: ["classInstance"],
      );

  void dispose() {
    _platform.dispose();
  }
// Section: wire2api

  String _wire2api_String(dynamic raw) {
    return raw as String;
  }

  SimpleClass _wire2api_simple_class(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 1)
      throw Exception('unexpected arr length: expect 1 but see ${arr.length}');
    return SimpleClass(
      property: _wire2api_String(arr[0]),
    );
  }

  int _wire2api_u8(dynamic raw) {
    return raw as int;
  }

  Uint8List _wire2api_uint_8_list(dynamic raw) {
    return raw as Uint8List;
  }

  void _wire2api_unit(dynamic raw) {
    return;
  }
}

// Section: api2wire

@protected
int api2wire_u8(int raw) {
  return raw;
}

// Section: finalizer

class RustPlatform extends FlutterRustBridgeBase<RustWire> {
  RustPlatform(ffi.DynamicLibrary dylib) : super(RustWire(dylib));

// Section: api2wire

  @protected
  ffi.Pointer<wire_uint_8_list> api2wire_String(String raw) {
    return api2wire_uint_8_list(utf8.encoder.convert(raw));
  }

  @protected
  ffi.Pointer<wire_SimpleClass> api2wire_box_autoadd_simple_class(
      SimpleClass raw) {
    final ptr = inner.new_box_autoadd_simple_class_0();
    _api_fill_to_wire_simple_class(raw, ptr.ref);
    return ptr;
  }

  @protected
  ffi.Pointer<wire_uint_8_list> api2wire_uint_8_list(Uint8List raw) {
    final ans = inner.new_uint_8_list_0(raw.length);
    ans.ref.ptr.asTypedList(raw.length).setAll(0, raw);
    return ans;
  }
// Section: finalizer

// Section: api_fill_to_wire

  void _api_fill_to_wire_box_autoadd_simple_class(
      SimpleClass apiObj, ffi.Pointer<wire_SimpleClass> wireObj) {
    _api_fill_to_wire_simple_class(apiObj, wireObj.ref);
  }

  void _api_fill_to_wire_simple_class(
      SimpleClass apiObj, wire_SimpleClass wireObj) {
    wireObj.property = api2wire_String(apiObj.property);
  }
}

// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_positional_boolean_parameters, annotate_overrides, constant_identifier_names

// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
// ignore_for_file: type=lint

/// generated by flutter_rust_bridge
class RustWire implements FlutterRustBridgeWireBase {
  @internal
  late final dartApi = DartApiDl(init_frb_dart_api_dl);

  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  RustWire(ffi.DynamicLibrary dynamicLibrary) : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  RustWire.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  void store_dart_post_cobject(
    DartPostCObjectFnType ptr,
  ) {
    return _store_dart_post_cobject(
      ptr,
    );
  }

  late final _store_dart_post_cobjectPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(DartPostCObjectFnType)>>(
          'store_dart_post_cobject');
  late final _store_dart_post_cobject = _store_dart_post_cobjectPtr
      .asFunction<void Function(DartPostCObjectFnType)>();

  Object get_dart_object(
    int ptr,
  ) {
    return _get_dart_object(
      ptr,
    );
  }

  late final _get_dart_objectPtr =
      _lookup<ffi.NativeFunction<ffi.Handle Function(ffi.UintPtr)>>(
          'get_dart_object');
  late final _get_dart_object =
      _get_dart_objectPtr.asFunction<Object Function(int)>();

  void drop_dart_object(
    int ptr,
  ) {
    return _drop_dart_object(
      ptr,
    );
  }

  late final _drop_dart_objectPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.UintPtr)>>(
          'drop_dart_object');
  late final _drop_dart_object =
      _drop_dart_objectPtr.asFunction<void Function(int)>();

  int new_dart_opaque(
    Object handle,
  ) {
    return _new_dart_opaque(
      handle,
    );
  }

  late final _new_dart_opaquePtr =
      _lookup<ffi.NativeFunction<ffi.UintPtr Function(ffi.Handle)>>(
          'new_dart_opaque');
  late final _new_dart_opaque =
      _new_dart_opaquePtr.asFunction<int Function(Object)>();

  int init_frb_dart_api_dl(
    ffi.Pointer<ffi.Void> obj,
  ) {
    return _init_frb_dart_api_dl(
      obj,
    );
  }

  late final _init_frb_dart_api_dlPtr =
      _lookup<ffi.NativeFunction<ffi.IntPtr Function(ffi.Pointer<ffi.Void>)>>(
          'init_frb_dart_api_dl');
  late final _init_frb_dart_api_dl = _init_frb_dart_api_dlPtr
      .asFunction<int Function(ffi.Pointer<ffi.Void>)>();

  void wire_ffi_search(
    int port_,
    ffi.Pointer<wire_uint_8_list> query,
    ffi.Pointer<wire_uint_8_list> sources_status,
  ) {
    return _wire_ffi_search(
      port_,
      query,
      sources_status,
    );
  }

  late final _wire_ffi_searchPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64, ffi.Pointer<wire_uint_8_list>,
              ffi.Pointer<wire_uint_8_list>)>>('wire_ffi_search');
  late final _wire_ffi_search = _wire_ffi_searchPtr.asFunction<
      void Function(
          int, ffi.Pointer<wire_uint_8_list>, ffi.Pointer<wire_uint_8_list>)>();

  void wire_ffi_increment_and_print_count(
    int port_,
  ) {
    return _wire_ffi_increment_and_print_count(
      port_,
    );
  }

  late final _wire_ffi_increment_and_print_countPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_ffi_increment_and_print_count');
  late final _wire_ffi_increment_and_print_count =
      _wire_ffi_increment_and_print_countPtr.asFunction<void Function(int)>();

  void wire_perform_search(
    int port_,
    ffi.Pointer<wire_uint_8_list> query,
    ffi.Pointer<wire_uint_8_list> sources_status,
  ) {
    return _wire_perform_search(
      port_,
      query,
      sources_status,
    );
  }

  late final _wire_perform_searchPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64, ffi.Pointer<wire_uint_8_list>,
              ffi.Pointer<wire_uint_8_list>)>>('wire_perform_search');
  late final _wire_perform_search = _wire_perform_searchPtr.asFunction<
      void Function(
          int, ffi.Pointer<wire_uint_8_list>, ffi.Pointer<wire_uint_8_list>)>();

  void wire_create_simple_class(
    int port_,
    ffi.Pointer<wire_uint_8_list> property,
  ) {
    return _wire_create_simple_class(
      port_,
      property,
    );
  }

  late final _wire_create_simple_classPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64,
              ffi.Pointer<wire_uint_8_list>)>>('wire_create_simple_class');
  late final _wire_create_simple_class = _wire_create_simple_classPtr
      .asFunction<void Function(int, ffi.Pointer<wire_uint_8_list>)>();

  void wire_print_simple_class_property(
    int port_,
    ffi.Pointer<wire_SimpleClass> class_instance,
  ) {
    return _wire_print_simple_class_property(
      port_,
      class_instance,
    );
  }

  late final _wire_print_simple_class_propertyPtr = _lookup<
          ffi.NativeFunction<
              ffi.Void Function(ffi.Int64, ffi.Pointer<wire_SimpleClass>)>>(
      'wire_print_simple_class_property');
  late final _wire_print_simple_class_property =
      _wire_print_simple_class_propertyPtr
          .asFunction<void Function(int, ffi.Pointer<wire_SimpleClass>)>();

  void wire_get_simple_class_property(
    int port_,
    ffi.Pointer<wire_SimpleClass> class_instance,
  ) {
    return _wire_get_simple_class_property(
      port_,
      class_instance,
    );
  }

  late final _wire_get_simple_class_propertyPtr = _lookup<
          ffi.NativeFunction<
              ffi.Void Function(ffi.Int64, ffi.Pointer<wire_SimpleClass>)>>(
      'wire_get_simple_class_property');
  late final _wire_get_simple_class_property =
      _wire_get_simple_class_propertyPtr
          .asFunction<void Function(int, ffi.Pointer<wire_SimpleClass>)>();

  ffi.Pointer<wire_SimpleClass> new_box_autoadd_simple_class_0() {
    return _new_box_autoadd_simple_class_0();
  }

  late final _new_box_autoadd_simple_class_0Ptr =
      _lookup<ffi.NativeFunction<ffi.Pointer<wire_SimpleClass> Function()>>(
          'new_box_autoadd_simple_class_0');
  late final _new_box_autoadd_simple_class_0 =
      _new_box_autoadd_simple_class_0Ptr
          .asFunction<ffi.Pointer<wire_SimpleClass> Function()>();

  ffi.Pointer<wire_uint_8_list> new_uint_8_list_0(
    int len,
  ) {
    return _new_uint_8_list_0(
      len,
    );
  }

  late final _new_uint_8_list_0Ptr = _lookup<
          ffi
          .NativeFunction<ffi.Pointer<wire_uint_8_list> Function(ffi.Int32)>>(
      'new_uint_8_list_0');
  late final _new_uint_8_list_0 = _new_uint_8_list_0Ptr
      .asFunction<ffi.Pointer<wire_uint_8_list> Function(int)>();

  void free_WireSyncReturn(
    WireSyncReturn ptr,
  ) {
    return _free_WireSyncReturn(
      ptr,
    );
  }

  late final _free_WireSyncReturnPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(WireSyncReturn)>>(
          'free_WireSyncReturn');
  late final _free_WireSyncReturn =
      _free_WireSyncReturnPtr.asFunction<void Function(WireSyncReturn)>();
}

final class _Dart_Handle extends ffi.Opaque {}

final class wire_uint_8_list extends ffi.Struct {
  external ffi.Pointer<ffi.Uint8> ptr;

  @ffi.Int32()
  external int len;
}

final class wire_SimpleClass extends ffi.Struct {
  external ffi.Pointer<wire_uint_8_list> property;
}

typedef DartPostCObjectFnType = ffi.Pointer<
    ffi.NativeFunction<
        ffi.Bool Function(DartPort port_id, ffi.Pointer<ffi.Void> message)>>;
typedef DartPort = ffi.Int64;
