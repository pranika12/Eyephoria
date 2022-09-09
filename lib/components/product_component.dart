import 'package:eyephoria_pranika_fyp/model/product.dart';
import 'package:eyephoria_pranika_fyp/pages/product_page.dart';
import 'package:eyephoria_pranika_fyp/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductComponent extends StatelessWidget {
  final Product product;
  const ProductComponent({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.width / 2,
      width: Get.width / 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () => Get.to(ProductPage(product: product)),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Expanded(child: Image.network("$baseUrl/${product.image}")),
                  Text(product.description),
                  Text(product.price),
                  Text(product.description)
                ],
              )),
        ),
      ),
    );
  }
}
