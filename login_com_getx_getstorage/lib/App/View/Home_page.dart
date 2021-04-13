import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:index/App/controllers/PassWordController.dart';

import 'CreateCountPage.dart';

class HomePage extends StatelessWidget {
  ShooPassword passController = Get.put(ShooPassword());
  /*var emailCreate = Get.arguments[0];
  var passCreate = Get.arguments[1];*/
  var emailLogin = TextEditingController();
  var passLogin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "image/fundo2.jpg",
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.black.withOpacity(0.6),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 38,
                  left: 45.0,
                  right: 45,
                  bottom: 10,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 40.0,
                        left: 50,
                        right: 50,
                      ),
                      child: Image.asset(
                        "image/logo2.png",
                        fit: BoxFit.cover,
                        height: 180,
                        width: 180,
                      ),
                    ),
                    TextField(
                      controller: emailLogin,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        hintText: "E-mail",
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Obx(() {
                        return TextField(
                          controller: passLogin,
                          obscureText:
                              passController.pass.value == false ? true : false,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            suffixIcon: GestureDetector(
                              child: Icon(
                                  passController.pass.value == false
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white),
                              onTap: () {
                                passController.showPass();
                              },
                            ),
                          ),
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade300,
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (GetUtils.isEmail(emailLogin.text)) {
                              Get.snackbar(
                                "Login was successful",
                                "WelCome to HEALTHY EATING",
                                colorText: Colors.white,
                                duration: Duration(seconds: 3),
                                backgroundColor: Colors.green,
                              );
                            } else {
                              Get.snackbar(
                                "Login Error",
                                "pleas verific you email ou your password",
                                colorText: Colors.white,
                                duration: Duration(seconds: 3),
                                backgroundColor: Colors.red,
                              );
                            }
                            /*if (GetUtils.isEmail(emailLogin.text) &&
                                (emailLogin.text == Get.arguments[0]) &&
                                (passLogin == Get.arguments[1])) {
                              Get.snackbar(
                                "Login was successful",
                                "Wel Come to HEALTHY EATING",
                                colorText: Colors.white,
                                duration: Duration(seconds: 3),
                                backgroundColor: Colors.green,
                              );
                            } else {
                              Get.snackbar(
                                "Login Error",
                                "pleas verific you email ou your password",
                                colorText: Colors.white,
                                duration: Duration(seconds: 3),
                                backgroundColor: Colors.red,
                              );
                            }*/
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        "forgot you password?",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: TextButton(
                        onPressed: () {
                          Get.to(CreateCountPage());
                        },
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
