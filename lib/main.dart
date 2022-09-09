import 'package:eyephoria_pranika_fyp/controller/authentication_controller.dart';
import 'package:eyephoria_pranika_fyp/controller/cart_controller.dart';
import 'package:eyephoria_pranika_fyp/controller/category_controller.dart';
import 'package:eyephoria_pranika_fyp/pages/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(Authentication());
  Get.put(CategoryController());
  Get.put(CartController());
  runApp(const MaterialApp(
      home: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "My First Flutter Project",
          home: Loader())));
}
