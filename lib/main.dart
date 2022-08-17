import 'package:eyephoria_pranika_fyp/pages/home_page.dart';
import 'package:eyephoria_pranika_fyp/pages/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MaterialApp(
      home: GetMaterialApp(
    title: "Eyephoria",
    home: HomePage(),
  )));
}
