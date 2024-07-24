import 'package:flutter/foundation.dart';
import "package:ffi/ffi.dart";
import 'dart:ffi';

class NativeWrapper {
  late Pointer<T> Function<T extends NativeType>(String symbolName) _lookup;

  NativeWrapper() {
    DynamicLibrary lib = defaultTargetPlatform == TargetPlatform.iOS ? DynamicLibrary.process() : DynamicLibrary.open("mylib.so");
    _lookup = lib.lookup;
  
  }

  late final _nativeAdd = _lookup<NativeFunction<IntPtr Function(IntPtr, IntPtr)>>('nativeAdd').asFunction<int Function(int, int)>();
  int nativeAdd(int a, int b) {
    return _nativeAdd(a, b);
  }

}