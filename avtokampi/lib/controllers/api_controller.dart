import 'package:avtokampi/controllers/api_routes.dart';
import 'package:avtokampi/globals.dart' as globals;
import 'package:http/http.dart';
import 'package:sprintf/sprintf.dart';

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

    Future<Response> register(String ime, String priimek, String email,
        String geslo) async {
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
            Map<String, String> headers = {"Content-type": "application/json"};
            Response response = await get(url, headers: headers);
            return response;
        } catch (e) {
            throw(e);
        }
    }

    Future<Response> getCenikiForKamp(int avtokampId) async {
        try {
            String url = sprintf(
                ApiRoutes.CENIKI_ZA_KAMP, [avtokampId.toString()]);
            Map<String, String> headers = {"Content-type": "application/json"};
            Response response = await get(url, headers: headers);
            return response;
        } catch (e) {
            throw(e);
        }
    }

    Future<Response> getDrzave() async {
        try {
            String url = ApiRoutes.DRZAVE;
            Map<String, String> headers = {"Content-type": "application/json"};
            Response response = await get(url, headers: headers);
            return response;
        } catch (e) {
            throw(e);
        }
    }

    Future<Response> getRegije() async {
        try {
            String url = ApiRoutes.REGIJE;
            Map<String, String> headers = {"Content-type": "application/json"};
            Response response = await get(url, headers: headers);
            return response;
        } catch (e) {
            throw(e);
        }
    }

    Future<Response> getKampirnaMestaForKamp(int avtokampId) async {
        try {
            String url = sprintf(
                ApiRoutes.KAMPIRNA_MESTA_SEZNAM, [avtokampId.toString()]);
            Map<String, String> headers = {
                "Content-type": "application/json",
                "Authorization": "Bearer ${globals.jwtToken}"
            };
            Response response = await get(url, headers: headers);
            return response;
        } catch (e) {
            throw(e);
        }
    }

    Future<Response> getKategorije() async {
        try {
            String url = ApiRoutes.KAMPIRNA_MESTA_KATEGORIJE;
            Map<String, String> headers = {
                "Content-type": "application/json",
                "Authorization": "Bearer ${globals.jwtToken}"
            };
            Response response = await get(url, headers: headers);
            return response;
        } catch (e) {
            throw(e);
        }
    }

    Future<Response> getKategorijeStoritev() async {
        try {
            String url = ApiRoutes.STORITVE_KAMPA_KATEGORIJE;
            Map<String, String> headers = {
                "Content-type": "application/json",
                "Authorization": "Bearer ${globals.jwtToken}"
            };
            Response response = await get(url, headers: headers);
            return response;
        } catch (e) {
            throw(e);
        }
    }

    Future<Response> getMnenjaForKamp(int avtokampId) async {
        try {
            String url = sprintf(
                ApiRoutes.UPORABNIKI_MNENJA_ZA_KAMP, [avtokampId.toString()]);
            Map<String, String> headers = {
                "Content-type": "application/json",
                "Authorization": "Bearer ${globals.jwtToken}"
            };
            Response response = await get(url, headers: headers);
            return response;
        } catch (e) {
            throw(e);
        }
    }

    Future<Response> getRezervacijeForUser() async {
        try {
            String url = sprintf(
                ApiRoutes.REZERVACIJE, [globals.currentUser.id.toString()]);
            print("URL JE: " + url);
            Map<String, String> headers = {
                "Content-type": "application/json",
                "Authorization": "Bearer ${globals.jwtToken}"
            };
            Response response = await get(url, headers: headers);
            return response;
        } catch (e) {
            throw(e);
        }
    }

    Future<Response> getSlikeForKamp(int avtokampId) async {
        try {
            String url = sprintf(
                ApiRoutes.AVTOKAMP_SLIKE, [avtokampId.toString()]);
            Map<String, String> headers = {
                "Content-type": "application/json",
                "Authorization": "Bearer ${globals.jwtToken}"
            };
            Response response = await get(url, headers: headers);
            return response;
        } catch (e) {
            throw(e);
        }
    }

    Future<Response> getStatusiRezervacij() async {
        try {
            String url = ApiRoutes.REZERVACIJE_STATUSI;
            Map<String, String> headers = {
                "Content-type": "application/json",
                "Authorization": "Bearer ${globals.jwtToken}"
            };
            Response response = await get(url, headers: headers);
            return response;
        } catch (e) {
            throw(e);
        }
    }

    Future<Response> getStoritve() async {
        try {
            String url = ApiRoutes.STORITVE;
            Map<String, String> headers = {"Content-type": "application/json"};
            Response response = await get(url, headers: headers);
            return response;
        } catch (e) {
            throw(e);
        }
    }

    Future<Response> getStoritveForKamp(int avtokampId) async {
        try {
            String url = sprintf(
                ApiRoutes.STORITVE_KAMPA, [avtokampId.toString()]);
            Map<String, String> headers = {
                "Content-type": "application/json",
                "Authorization": "Bearer ${globals.jwtToken}"
            };
            Response response = await get(url, headers: headers);
            return response;
        } catch (e) {
            throw(e);
        }
    }

    Future<Response> getStoritveForKampirnoMesto(int kampirnoMestoId) async {
        try {
            String url = sprintf(ApiRoutes.KAMPIRNA_MESTA_STORITVE,
                [kampirnoMestoId.toString()]);
            Map<String, String> headers = {
                "Content-type": "application/json",
                "Authorization": "Bearer ${globals.jwtToken}"
            };
            Response response = await get(url, headers: headers);
            return response;
        } catch (e) {
            throw(e);
        }
    }

    Future<Response> getVrsteKampiranj() async {
        try {
            String url = ApiRoutes.REZERVACIJE_VRSTA_KAMPIRANJA;
            Map<String, String> headers = {
                "Content-type": "application/json",
                "Authorization": "Bearer ${globals.jwtToken}"
            };
            Response response = await get(url, headers: headers);
            return response;
        } catch (e) {
            throw(e);
        }
    }

    Future<Response> getUserData() async {
        try {
            String url = sprintf(
                ApiRoutes.UPORABNIKI_PO_IMENU, [globals.currentUser.email]);
            Map<String, String> headers = {
                "Content-type": "application/json",
                "Authorization": "Bearer ${globals.jwtToken}"
            };
            Response response = await get(url, headers: headers);
            return response;
        } catch (e) {
            throw(e);
        }
    }

    Future<Response> addOpinion(int uporabnikId, int avtokampId, String mnenje,
        int ocena) async {
        try {
            String url = sprintf(ApiRoutes.UPORABNIKI_MNENJE, [avtokampId]);
            Map<String, String> headers = {
                "Content-type": "application/json",
                "Authorization": "Bearer ${globals.jwtToken}"
            };
            String json = '{"mnenje": "$mnenje", "ocena": $ocena, "avtokamp": $avtokampId, "uporabnik": $uporabnikId}';
            Response response = await post(url, headers: headers, body: json);
            return response;
        } catch (e) {
            throw(e);
        }
    }

    Future<Response> addCampReservation(int uporabnikId, int avtokampId,
        int kampirnoMestoId, int vrstaKampiranjaid, String datumOd,
        String datumDo) async {
        try {
            String url = ApiRoutes.REZERVACIJE_DODAJ;
            Map<String, String> headers = {
                "Content-type": "application/json",
                "Authorization": "Bearer ${globals.jwtToken}"
            };
            String json = '{"trajanjeOd": "$datumOd", "trajanjeDo": "$datumDo", "avtokamp": $avtokampId, "kampirnoMesto": $kampirnoMestoId, "vrstaKampiranja": $vrstaKampiranjaid, "uporabnik": $uporabnikId, "statusRezervacije": 1}';
            Response response = await post(url, headers: headers, body: json);
            return response;
        } catch (e) {
            throw(e);
        }
    }

    Future<Response> addAvtokamp(String naziv, String nazivLokacije,
        String naslovKampa, String telefon, String opis, int regija) async {
        try {
            String url = ApiRoutes.AVTOKAMP;
            Map<String, String> headers = {
                "Content-type": "application/json",
                "Authorization": "Bearer ${globals.jwtToken}"
            };
            String json = '{"naziv": "$naziv", "nazivLokacije": "$nazivLokacije", "naslov": "$naslovKampa", "telefon": "$telefon", "opis": "$opis", "regija": $regija}';
            Response response = await post(url, headers: headers, body: json);
            return response;
        } catch (e) {
            throw(e);
        }
    }

    Future<Response> addPrijavaNaStoritev(int kampirnoMesto,
        int storitev) async {
        try {
            String url = sprintf(
                ApiRoutes.KAMPIRNA_MESTA_STORITVE_DODAJANJE, [kampirnoMesto]);
            Map<String, String> headers = {
                "Content-type": "application/json",
                "Authorization": "Bearer ${globals.jwtToken}"
            };
            String json = '{"kampirnoMesto": $kampirnoMesto, "storitev": "$storitev"}';
            Response response = await post(url, headers: headers, body: json);
            return response;
        } catch (e) {
            throw(e);
        }
    }

    Future<Response> deleteAvtokamp(int kampId) async {
        try {
            String url = sprintf(ApiRoutes.AVTOKAMP, [kampId]);
            Map<String, String> headers = {
                "Content-type": "application/json",
                "Authorization": "Bearer ${globals.jwtToken}"
            };
            Response response = await delete(url, headers: headers);
            return response;
        } catch (e) {
            throw(e);
        }
    }

    Future<Response> modifyAvtokamp(int kampId, String naziv,
        String nazivLokacije, String naslovKampa, String telefon, String opis,
        int regija) async {
        try {
            String url = sprintf(ApiRoutes.AVTOKAMP, [kampId]);
            Map<String, String> headers = {
                "Content-type": "application/json",
                "Authorization": "Bearer ${globals.jwtToken}"
            };
            String json = '{"avtokampId": $kampId, "naziv": "$naziv", "nazivLokacije": "$nazivLokacije", "naslov": "$naslovKampa", "telefon": "$telefon", "opis": "$opis", "regija": $regija}';
            Response response = await put(url, headers: headers, body: json);
            return response;
        } catch (e) {
            throw(e);
        }
    }

    Future<Response> addKampirnoMesto(String naziv, String velikost,
        int avtokamp, int kategorija) async {
        try {
            String url = sprintf(ApiRoutes.KAMPIRNA_MESTA_NOVO, [avtokamp]);
            Map<String, String> headers = {
                "Content-type": "application/json",
                "Authorization": "Bearer ${globals.jwtToken}"
            };
            String json = '{"naziv": "$naziv", "velikost": "$velikost", "avtokamp": $avtokamp, "kategorija": $kategorija}';
            Response response = await post(url, headers: headers, body: json);
            return response;
        } catch (e) {
            throw(e);
        }
    }

    Future<Response> deleteKampirnoMesto(int kampId,
        int kampirnoMestoId) async {
        try {
            String url = sprintf(ApiRoutes.KAMPIRNA_MESTA_UREDI_BRISI,
                [kampId, kampirnoMestoId]);
            Map<String, String> headers = {
                "Content-type": "application/json",
                "Authorization": "Bearer ${globals.jwtToken}"
            };
            Response response = await delete(url, headers: headers);
            return response;
        } catch (e) {
            throw(e);
        }
    }

    Future<Response> modifyKampirnoMesto(int kampirnoMestoId, String naziv,
        String velikost, int avtokamp, int kategorija) async {
        try {
            String url = sprintf(ApiRoutes.KAMPIRNA_MESTA_UREDI_BRISI,
                [avtokamp, kampirnoMestoId]);
            Map<String, String> headers = {
                "Content-type": "application/json",
                "Authorization": "Bearer ${globals.jwtToken}"
            };
            String json = '{"kampirnoMestoId": $kampirnoMestoId, "naziv": "$naziv", "velikost": "$velikost", "avtokamp": $avtokamp, "kategorija": $kategorija}';
            Response response = await put(url, headers: headers, body: json);
            return response;
        } catch (e) {
            throw(e);
        }
    }
}