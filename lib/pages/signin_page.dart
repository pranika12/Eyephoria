import 'package:eyephoria_pranika_fyp/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/my_button.dart';
import '../components/my_field.dart';
import '../controller/authentication_controller.dart';

class SignInPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final authentication = Get.find<Authentication>();
  SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
            child: Form(
                child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: 300,
                  width: 300,
                ),
                const Text("Welcome To Eyephoria",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue)),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: MyField(
                    controller: emailController,
                    myValidator: (value) {
                      if (!value.toString().contains("@")) {
                        return "Email is not valid";
                      }
                      return null;
                    },
                  ),
                ),
                MyField(
                  text: "Username",
                  controller: usernameController,
                  myValidator: (value) {
                    return null;
                  },
                ),
                MyField(
                  text: "Phone",
                  controller: phoneController,
                  myValidator: (value) {
                    return null;
                  },
                ),
                MyField(
                  text: "Name",
                  controller: nameController,
                  myValidator: (value) {
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
                MyField(
                  text: "Confirm Password",
                  obscureText: true,
                  controller: confirmPasswordController,
                ),
                MyButton(onTap: () {
                  var isFormValid = formKey.currentState!.validate();
                  if (isFormValid) {
                    var data = {
                      "email": emailController.text,
                      "password": passwordController.text,
                      "username": usernameController.text,
                      "name": nameController.text,
                      "phone": phoneController.text
                    };
                    authentication.SignUp(data);
                  }
                }),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Already have an account?"),
                ),
                InkWell(
                  onTap: () {
                    Get.to(LoginPage());
                  },
                  child: const Text("Login",
                      style: TextStyle(
                        color: Color.fromARGB(255, 158, 198, 230),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
          ),
        ))));
  }
}
