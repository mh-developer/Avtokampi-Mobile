import 'package:best_flutter_ui_templates/controllers/api_routes.dart';
import 'package:http/http.dart';
import 'package:best_flutter_ui_templates/globals.dart' as globals;

class ApiController {

    Future<Response> login(String username, String password) async {
        try {
            String url = ApiRoutes.LOGIN;
            Map<String, String> headers = {"Content-type": "application/json"};
            String json = '{"username": "$username", "password": "$password"}';
            Response response = await post(url, headers: headers, body: json);
            return response;
        } catch (e) {
            throw(e);
        }
    }

    Future<Response> register(String ime, String priimek, String email, String geslo) async {
        try {
            String url = ApiRoutes.REGISTER;
            Map<String, String> headers = {"Content-type": "application/json"};
            String json = '{"ime": "$ime", "priimek": "$priimek", "email": "$email", "geslo": "$geslo"}';
            Response response = await post(url, headers: headers, body: json);
            return response;
        } catch (e) {
            throw(e);
        }
    }

    Future<Response> getAvtokampi() async {
        try {
            String url = ApiRoutes.AVTOKAMPI;
            Map<String, String> headers = {"Content-type": "application/json", "Authorization": "Bearer ${globals.jwtToken}"};
            Response response = await get(url, headers: headers);
            return response;
        } catch (e) {
            throw(e);
        }
    }
}