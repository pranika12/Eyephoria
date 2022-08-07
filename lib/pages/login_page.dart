import 'package:eyephoria_pranika_fyp/components/my_button.dart';
import 'package:eyephoria_pranika_fyp/components/my_field.dart';
import 'package:eyephoria_pranika_fyp/pages/home_page.dart';
import 'package:eyephoria_pranika_fyp/pages/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 212, 241, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 300,
                    width: 300,
                  ),
                  const Text("Login",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  MyField(
                    controller: emailController,
                    myValidator: (value) {
                      if (!value.toString().contains("@")) {
                        return "Email is not valid";
                      }
                      return null;
                    },
                  ),
                  MyField(
                    text: "Password",
                    obscureText: true,
                    controller: passwordController,
                    myValidator: (value) {
                      return null;
                    },
                  ),
                  MyButton(onTap: () {
                    var isFormValid = formKey.currentState!.validate();
                    if (isFormValid) {
                      if (emailController.text == "admin@gmail.com" &&
                          passwordController.text == "admin") {
                        Get.to(HomePage());
                      } else {}
                    }
                  }),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Forgot Password?",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Don't have an account?",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(SignInPage());
                    },
                    child: const Text("Register",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
