import 'package:eyephoria_pranika_fyp/controller/authentication_controller.dart';
import 'package:eyephoria_pranika_fyp/pages/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(Authentication());

  runApp(const MaterialApp(
      home: GetMaterialApp(
    title: "Eyephoria",
    home: Loader(),
  )));
}
