import 'package:best_flutter_ui_templates/controllers/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:http/http.dart';

import '../home_screen.dart';

class LoginScreen extends StatelessWidget {
    Duration get loginTime => Duration(milliseconds: 2250);
    ApiController apiController = ApiController();

    Future<String> _onLogin(LoginData data) {
        print('Name: ${data.name}, Password: ${data.password}');
        Response response;
        apiController.login(data.name, data.password).then((apiResponse) {
            response = apiResponse;
            print(response.body);
        });
        return Future.delayed(loginTime).then((_) {
            if (response.statusCode != 200) {
                return 'Wrong username or password!';
            }
            return null;
        });
    }

    Future<String> _onRegister(LoginData data) {
        print('Name: ${data.name}, Password: ${data.password}');
        Response response;
        apiController.register(data.name, data.name, data.name, data.password).then((apiResponse) {
            response = apiResponse;
            print(response.statusCode);
        });
        return Future.delayed(loginTime).then((_) {
            if (response.statusCode != 201) {
                return 'Something went wrong!';
            }
            return null;
        });
    }

    Future<String> _recoverPassword(String name) {
        print('Name: $name');
        return Future.delayed(loginTime).then((_) {
            return null;
        });
    }

    @override
    Widget build(BuildContext context) {
        return FlutterLogin(
            title: 'PRIJAVI SE',
            onLogin: _onLogin,
            onSignup: _onRegister,
            onSubmitAnimationCompleted: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                ));
            },
            onRecoverPassword: _recoverPassword,
            messages: LoginMessages(
                usernameHint: 'Uporabniško ime',
                passwordHint: 'Geslo',
                confirmPasswordHint: 'Potrdi geslo',
                loginButton: 'PRIJAVA',
                signupButton: 'REGISTRACIJA',
                forgotPasswordButton: 'Pozabljeno geslo',
                recoverPasswordButton: 'POMOČ',
                goBackButton: 'NAZAJ',
                confirmPasswordError: 'Gesli se ne ujemata!'),
        );
    }
}
