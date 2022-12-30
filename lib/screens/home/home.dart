import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homework/screens/auth/auth_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
            onPressed: () async {
              final SharedPreferences? prefs = await _prefs;
              prefs?.clear();
              Get.offAll(AuthScreen());
            },
            child: Text(
              'logout',
              style: TextStyle(color: Colors.white),
            ))
      ]),
      body: Center(
        child: Column(
          children: [
            Text('Welcome home'),
            TextButton(
                onPressed: () async {
                  final SharedPreferences? prefs = await _prefs;
                  print(prefs?.get('token'));
                },
                child: Text('print token'))
          ],
        ),
      ),
    );
  }
}
