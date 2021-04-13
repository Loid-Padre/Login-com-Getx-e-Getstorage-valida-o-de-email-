import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:index/App/controllers/PassWordController.dart';

import 'Home_page.dart';

class CreateCountPage extends StatelessWidget {
  var storage = GetStorage();
  ShooPassword passController = Get.put(ShooPassword());

  var emailCreate = TextEditingController();
  var pass1 = TextEditingController();
  var pass2 = TextEditingController();

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
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        left: 50,
                        right: 50,
                      ),
                      child: Image.asset(
                        "image/logo2.png",
                        fit: BoxFit.cover,
                        height: 150,
                        width: 150,
                      ),
                    ),
                    Text(
                      "Create your Account",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        hintText: "Username",
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: TextField(
                        controller: emailCreate,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Obx(() {
                        return TextField(
                          controller: pass1,
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
                      child: Obx(() {
                        return TextField(
                          controller: pass2,
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
                                color: Colors.white,
                              ),
                              onTap: () {
                                passController.showPass();
                              },
                            ),
                          ),
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Container(
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade300,
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (GetUtils.isEmail(emailCreate.text) &&
                                (pass1.text == pass2.text)) {
                              storage.write("Email", emailCreate.text);
                              Get.snackbar(
                                "successful 👏",
                                "Your count was created",
                                colorText: Colors.white,
                                backgroundColor: Colors.green,
                                snackPosition: SnackPosition.BOTTOM,
                              );
                              Get.to(
                                HomePage(),
                              );
                            } else {
                              Get.snackbar(
                                " Email or Password Incorrect",
                                "pleas verific your email or your password",
                                colorText: Colors.white,
                                backgroundColor: Colors.red,
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            }
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
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
