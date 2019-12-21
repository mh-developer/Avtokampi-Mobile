import 'package:http/http.dart';
import 'package:best_flutter_ui_templates/controllers/api_routes.dart';

class ApiController {

    login(String username, String password) async {
        String url = ApiRoutes.LOGIN;
        Map<String, String> headers = {"Content-type": "application/json"};
        String json = '{"username": $username, "password": $password}';
        Response response = await post(url, headers: headers, body: json);
        return response;
    }

    register(String ime, String priimek, String email, String geslo) async {
        String url = ApiRoutes.REGISTER;
        Map<String, String> headers = {"Content-type": "application/json"};
        String json = '{"ime": $ime, "priimek": $priimek, "email": $email, "geslo": $geslo}';
        Response response = await post(url, headers: headers, body: json);
        return response;
    }
}