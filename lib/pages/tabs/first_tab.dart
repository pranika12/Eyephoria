import 'package:badges/badges.dart';
import 'package:eyephoria_pranika_fyp/components/product_component.dart';
import 'package:eyephoria_pranika_fyp/controller/cart_controller.dart';
import 'package:eyephoria_pranika_fyp/controller/product_controller.dart';
import 'package:eyephoria_pranika_fyp/model/product.dart';
import 'package:eyephoria_pranika_fyp/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstTab extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  final CartController cartController = Get.find<CartController>();

  FirstTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome To Eyephoria"),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 60),
            child: InkWell(
              onTap: () => Get.to(() => CartPage()),
              child: Badge(
                badgeContent:
                    Obx(() => Text(cartController.cart.length.toString())),
                child: const Icon(Icons.shopping_cart),
              ),
            ),
          )
        ],
      ),
      body: Obx(() => Wrap(
            children: productController.products.value
                .map((Product product) => ProductComponent(product: product))
                .toList(),
          )),
    );
  }
}
