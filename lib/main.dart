import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework/screens/auth/auth_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: AuthScreen(),
  ));
}
