import 'dart:convert';

import 'package:best_flutter_ui_templates/controllers/api_controller.dart';
import 'package:best_flutter_ui_templates/controllers/api_data_getter.dart';
import 'package:best_flutter_ui_templates/globals.dart' as globals;
import 'package:best_flutter_ui_templates/layouts/navigation_home_screen.dart';
import 'package:best_flutter_ui_templates/models/Uporabnik.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:http/http.dart';

class LoginScreen extends StatelessWidget {

    LoginScreen() {
        apiController = ApiController();
        globals.currentUser = null;
        globals.jwtToken = "";
        globals.dataLoaded = false;
    }

    Duration get loginTime => Duration(milliseconds: 2250);
    ApiController apiController;

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
            globals.jwtToken = json.decode(response.body)['token'];
            globals.currentUser = Uporabnik(data.name, data.name, data.name, data.password);
            globals.currentUser.pravica = 2;
            return null;
        });
    }

    Future<String> _onRegister(LoginData data) {
        print('Name: ${data.name}, Password: ${data.password}');
        Response response;
        apiController.register(data.name, data.name, data.name, data.password)
            .then((apiResponse) {
            response = apiResponse;
            print(response.statusCode);
        });
        return Future.delayed(loginTime).then((_) {
            if (response.statusCode != 201) {
                return 'Something went wrong!';
            }
            _onLogin(data);
            return null;
        });
    }

    Future<String> _recoverPassword(String name) async {
        print('Name: $name');
        final Email email = Email(
            body: 'Vaše geslo je: lalala',
            subject: 'Pozabljeno geslo',
            recipients: ['$name'],
            isHTML: false,
        );
        await FlutterEmailSender.send(email);
        return Future.delayed(loginTime).then((_) {
            return null;
        });
    }

    @override
    Widget build(BuildContext context) {
        return FlutterLogin(
            title: 'KAMPIRAJ!',
            onLogin: _onLogin,
            onSignup: _onRegister,
            onSubmitAnimationCompleted: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => NavigationHomeScreen(),
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
                recoverPasswordDescription: "Vpišite svoje uporabniško ime (email) in poslali vam bomo vaše geslo.",
                recoverPasswordIntro: "Pozabljeno geslo?",
                recoverPasswordSuccess: "Email je bil uspešno poslan!",
                confirmPasswordError: 'Gesli se ne ujemata!'),
        );
    }
}
