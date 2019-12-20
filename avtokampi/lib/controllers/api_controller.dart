import 'package:http/http.dart';

class ApiController {
    String apiUrl = "https://api.kampiraj.ga/api/";

    login(String username, String password) async {
        String url = 'https://api.kampiraj.ga/api/Auth/login';
        Map<String, String> headers = {"Content-type": "application/json"};
        String json = '{"username": $username, "password": $password}';
        Response response = await post(url, headers: headers, body: json);
        return response;
    }

    register(String ime, String priimek, String email, String geslo) async {
        String url = 'https://api.kampiraj.ga/api/Auth/register';
        Map<String, String> headers = {"Content-type": "application/json"};
        String json = '{"ime": $ime, "priimek": $priimek, "email": $email, "geslo": $geslo}';
        Response response = await post(url, headers: headers, body: json);
        return response;
    }
}