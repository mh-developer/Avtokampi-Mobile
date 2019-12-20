import 'dart:io';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:best_flutter_ui_templates/controllers/api_controller.dart';

import 'help_screen.dart';

const users = const {
    'dribbble@gmail.com': '12345',
    'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
    Duration get loginTime => Duration(milliseconds: 2250);

    _login(String username, String password) async {
        String url = 'https://api.kampiraj.ga/api/Auth/login';
        Map<String, String> headers = {"Content-type": "application/json"};
        String json = '{"username": $username, "password": $password}';
        Response response = await post(url, headers: headers, body: json);
        print(response.body);
    }

    _register() async {
        String url = 'https://api.kampiraj.ga/api/Auth/register';
        Map<String, String> headers = {"Content-type": "application/json"};
        String json = '{"ime": "Jane", "priimek": "Doe", "email": "jane.doe@gmail.com", "geslo": "disibila91"}';
        Response response = await post(url, headers: headers, body: json);
        if (response.statusCode == 201) {
            return "Registration successfull!";
        } else {
            return "Something went wrong!";
        }
    }

    Future<String> _authUser(LoginData data) {
        print('Name: ${data.name}, Password: ${data.password}');
        return Future.delayed(loginTime).then((_) {
            if (!users.containsKey(data.name)) {
                return 'Username not exists';
            }
            if (users[data.name] != data.password) {
                return 'Password does not match';
            }
            return null;
        });
    }

    Future<String> _recoverPassword(String name) {
        print('Name: $name');
        return Future.delayed(loginTime).then((_) {
            if (!users.containsKey(name)) {
                return 'Username not exists';
            }
            return null;
        });
    }

    @override
    Widget build(BuildContext context) {
        return FlutterLogin(
            title: 'ECORP',
            logo: 'assets/images/ecorp-lightblue.png',
            onLogin: _authUser,
            onSignup: _authUser,
            onSubmitAnimationCompleted: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => HelpScreen(),
                ));
            },
            onRecoverPassword: _recoverPassword,
        );
    }
}