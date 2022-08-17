import 'package:eyephoria_pranika_fyp/pages/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
      home: GetMaterialApp(
    title: "Eyephoria",
    home: SignInPage(),
  )));
}
