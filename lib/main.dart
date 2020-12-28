import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ui/home.dart';
main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home:Home());
  }
}