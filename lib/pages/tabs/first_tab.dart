import 'package:eyephoria_pranika_fyp/controller/authentication_controller.dart';
import 'package:eyephoria_pranika_fyp/pages/loader.dart';
import 'package:eyephoria_pranika_fyp/pages/login_page.dart';
import 'package:eyephoria_pranika_fyp/utils/shared_preds.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstTab extends StatelessWidget {
  final AuthService authService = AuthService();
  final authentication = Get.find<Authentication>();

  FirstTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Text("Welcome to Eyephoria"),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Get.offAll(const LoginPage());
                },
                child: const Text("Logout")),
            //child: ElevatedButton (onPressed: () => logout(), child: const Text("Logout"))
          )
        ],
      ),
    );
  }

  logout() async {
    await authentication.logout();
    Get.offAll(const Loader());
  }
}
