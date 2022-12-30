import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework/controllers/login_controller.dart';
import 'package:homework/controllers/registration_controller.dart';
import 'package:homework/screens/auth/widgets/input_field.dart';
import 'package:homework/screens/auth/widgets/submit_button.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);

  Registration_Controller registration_controller =
      Get.put(Registration_Controller());
  Login_Controller login_controller = Get.put(Login_Controller());

  var isLogin = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Obx(() => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Fox Gallery",
                    style: TextStyle(fontSize: 22, color: Colors.orange),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        color: !isLogin.value ? Colors.blue : Colors.orange,
                        onPressed: () {
                          isLogin.value = false;
                        },
                        child: Text("Registration"),
                      ),
                      MaterialButton(
                          color: isLogin.value ? Colors.blue : Colors.orange,
                          child: Text("Login"),
                          onPressed: () {
                            isLogin.value = true;
                          }),
                    ],
                  ),
                  isLogin.value ? loginWidget() : registerWidget()
                ],
              )),
        ),
      ),
    );
  }

  Widget registerWidget() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        InputFieldWidget(registration_controller.nameController, 'name'),
        SizedBox(
          height: 20,
        ),
        InputFieldWidget(registration_controller.emailController, 'email'),
        SizedBox(
          height: 20,
        ),
        InputFieldWidget(registration_controller.passController, 'password'),
        SizedBox(
          height: 40,
        ),
        SubmitButton(
            title: 'Registration',
            onPress: () => registration_controller.registerByEmail())
      ],
    );
  }

  Widget loginWidget() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        InputFieldWidget(login_controller.emailController, 'email'),
        SizedBox(
          height: 20,
        ),
        InputFieldWidget(login_controller.passController, 'password'),
        SizedBox(
          height: 40,
        ),
        SubmitButton(
            title: 'Login', onPress: () => login_controller.loginByEmail())
      ],
    );
  }
}
