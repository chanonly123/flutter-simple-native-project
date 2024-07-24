import 'package:flutter/material.dart';
import 'package:flutter_app/native_wrapper.dart';

void main() {
  runApp(const MainApp());

  NativeWrapper wrapper = NativeWrapper();
  print("Native sum ${wrapper.nativeAdd(5, 4)}");
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
