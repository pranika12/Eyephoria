import 'dart:convert';

import 'package:eyephoria_pranika_fyp/model/product.dart';
import 'package:eyephoria_pranika_fyp/utils/constants.dart';
import 'package:eyephoria_pranika_fyp/utils/shared_preds.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/api.dart';

class ProductController extends GetxController {
  var loading = false.obs;
  var products = <Product>[].obs;

  final AuthService authService = AuthService();

  //on init state
  @override
  void onInit() {
    super.onInit();
    get();
  }

  get() async {
    loading.value = true;
    var url = Uri.parse(GET_PRODUCTS_API);
    var response = await http.get(url);
    loading.value = false;
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (jsonResponse["success"]) {
        products.value = (jsonResponse["data"] as List)
            .map((e) => Product.fromJson(e))
            .toList();
      } else {
        showMessage(message: jsonResponse["message"], isSuccess: false);
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
