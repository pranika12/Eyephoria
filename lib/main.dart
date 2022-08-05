import 'package:eyephoria_pranika_fyp/pages/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MaterialApp(
      home: GetMaterialApp(
    title: "Eyephoria",
    home: SignInPage(),
  )));
}
