import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework/screens/home/home.dart';
import 'package:homework/utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Login_Controller extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  Future<void> loginByEmail() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      var url = Uri.parse(API.baseURL + API.endpoints.login);
      Map body = {
        'email': emailController.text.trim(),
        'password': passController.text
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['code'] == 0) {
          var token = json['data']['Token'];
          final SharedPreferences? prefs = await _pref;
          await prefs?.setString('token', token);

          emailController.clear();
          passController.clear();
          Get.off(Home());
        } else if (json['code'] == 1) {
          throw jsonDecode(response.body)['message'];
        }
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
    }
  }
}
