import 'package:get/get.dart';

class ShooPassword extends GetxController {
  var pass = false.obs;

  void showPass() {
    pass.value = !pass.value;
  }
}
