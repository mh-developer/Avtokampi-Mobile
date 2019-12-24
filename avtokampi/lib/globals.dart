import 'dart:convert';

import 'package:best_flutter_ui_templates/models/Avtokamp.dart';
import 'package:best_flutter_ui_templates/models/KampirnoMesto.dart';
import 'package:best_flutter_ui_templates/models/Kategorija.dart';
import 'package:best_flutter_ui_templates/models/KategorijaStoritve.dart';
import 'package:best_flutter_ui_templates/models/Mnenje.dart';
import 'package:best_flutter_ui_templates/models/Pravica.dart';
import 'package:best_flutter_ui_templates/models/Regija.dart';
import 'package:best_flutter_ui_templates/models/Rezervacija.dart';
import 'package:best_flutter_ui_templates/models/Slika.dart';
import 'package:best_flutter_ui_templates/models/StatusRezervacije.dart';
import 'package:best_flutter_ui_templates/models/Storitev.dart';
import 'package:best_flutter_ui_templates/models/StoritevKampirnegaMesta.dart';
import 'package:best_flutter_ui_templates/models/Uporabnik.dart';
import 'package:best_flutter_ui_templates/models/VrstaKampiranja.dart';
import 'package:http/http.dart';

import 'controllers/api_controller.dart';
import 'models/Cenik.dart';
import 'models/Drzava.dart';

String jwtToken = "";
Uporabnik currentUser = Uporabnik(
    "Anže", "Luzar", "anze.luzar@gmail.com", "lala");

class Globals {
    ApiController apiController = new ApiController();

    List<Avtokamp> avtokampi;
    List<Cenik> ceniki;
    List<Drzava> drzave;
    List<KampirnoMesto> kampirnaMesta;
    List<Kategorija> kategorije;
    List<KategorijaStoritve> kategorijeStoritev;
    List<Mnenje> mnenja;
    List<Regija> regije;
    List<Rezervacija> rezervacije;
    List<Slika> slike;
    List<StatusRezervacije> statusiRezervacij;
    List<Storitev> storitve;
    List<StoritevKampirnegaMesta> storitveKampirnihMest;
    List<VrstaKampiranja> vrsteKampiranj;

    List<Avtokamp> getAvtokampi() {
        List<Avtokamp> avtokampi = [];
        Response response;
        apiController.getAvtokampi().then((apiResponse) {
            response = apiResponse;
        }).whenComplete(() {
            if (response.statusCode == 200) {
                Iterable l = json.decode(response.body);
                avtokampi = l.map((model) => Avtokamp.fromJson(model)).toList();
            }
        });
        print("Avtokampi: ${avtokampi.toString()}");
        return avtokampi;
    }

    List<Cenik> getCeniki(List<Avtokamp> avtokampi) {
        List<Cenik> ceniki = [];
        for (Avtokamp avtokamp in avtokampi) {
            Response response;
            apiController.getCenikiForKamp(avtokamp.id).then((apiResponse) {
                response = apiResponse;
            }).whenComplete(() {
                if (response.statusCode == 200) {
                    Iterable l = json.decode(response.body);
                    List<Cenik> cenikiZaKamp = l.map((model) => Cenik.fromJson(model)).toList();
                    for (Cenik c in cenikiZaKamp) {
                        if (!ceniki.contains(c)) {
                            ceniki.add(c);
                        }
                    }
                }
            });
        }
        print("Ceniki: ${ceniki.toString()}");
        return ceniki;
    }

    List<Drzava> getDrzave() {
        List<Drzava> drzave = [];
        Response response;
        apiController.getDrzave().then((apiResponse) {
            response = apiResponse;
        }).whenComplete(() {
            if (response.statusCode == 200) {
                Iterable l = json.decode(response.body);
                drzave = l.map((model) => Drzava.fromJson(model)).toList();
            }
        });
        print("Drzave: ${drzave.toString()}");
        return drzave;
    }

    List<KampirnoMesto> getKampirnaMesta(List<Avtokamp> avtokampi) {
        List<KampirnoMesto> kampirnaMesta = [];
        for (Avtokamp avtokamp in avtokampi) {
            Response response;
            apiController.getKampirnaMestaForKamp(avtokamp.id).then((apiResponse) {
                response = apiResponse;
            }).whenComplete(() {
                if (response.statusCode == 200) {
                    Iterable l = json.decode(response.body);
                    List<KampirnoMesto> kampirnaMestaZaKamp = l.map((model) => KampirnoMesto.fromJson(model)).toList();
                    for (KampirnoMesto km in kampirnaMestaZaKamp) {
                        if (!kampirnaMesta.contains(km)) {
                            kampirnaMesta.add(km);
                        }
                    }
                }
            });
        }
        print("Kampirna mesta: ${kampirnaMesta.toString()}");
        return kampirnaMesta;
    }

    List<Kategorija> getKategorije() {
        List<Kategorija> kategorije = [];
        Response response;
        apiController.getKategorije().then((apiResponse) {
            response = apiResponse;
        }).whenComplete(() {
            if (response.statusCode == 200) {
                Iterable l = json.decode(response.body);
                kategorije = l.map((model) => Kategorija.fromJson(model)).toList();
            }
        });
        print("Kategorije: ${kategorije.toString()}");
        return kategorije;
    }

    List<KategorijaStoritve> getKategorijeStoritev() {
        List<KategorijaStoritve> kategorijeStoritev = [];
        Response response;
        apiController.getKategorije().then((apiResponse) {
            response = apiResponse;
        }).whenComplete(() {
            if (response.statusCode == 200) {
                Iterable l = json.decode(response.body);
                kategorijeStoritev = l.map((model) => KategorijaStoritve.fromJson(model)).toList();
            }
        });
        print("Kategorije storitev: ${kategorijeStoritev.toString()}");
        return kategorijeStoritev;
    }

    List<Mnenje> getMnenja(List<Avtokamp> avtokampi) {
        List<Mnenje> mnenja = [];
        for (Avtokamp avtokamp in avtokampi) {
            Response response;
            apiController.getMnenjaForKamp(avtokamp.id).then((apiResponse) {
                response = apiResponse;
            }).whenComplete(() {
                if (response.statusCode == 200) {
                    Iterable l = json.decode(response.body);
                    List<Mnenje> mnenjaZaKamp = l.map((model) => Mnenje.fromJson(model)).toList();
                    for (Mnenje km in mnenjaZaKamp) {
                        if (!mnenja.contains(km)) {
                            mnenja.add(km);
                        }
                    }
                }
            });
        }
        print("Mnenja: ${mnenja.toString()}");
        return mnenja;
    }

    List<Regija> getRegije() {
        List<Regija> regije = [];
        Response response;
        apiController.getRegije().then((apiResponse) {
            response = apiResponse;
        }).whenComplete(() {
            if (response.statusCode == 200) {
                Iterable l = json.decode(response.body);
                regije = l.map((model) => Regija.fromJson(model)).toList();
            }
        });
        print("Regije: ${regije.toString()}");
        return regije;
    }

    List<Rezervacija> getRezervacije() {
        List<Rezervacija> rezervacije = [];
        Response response;
        apiController.getRegije().then((apiResponse) {
            response = apiResponse;
        }).whenComplete(() {
            if (response.statusCode == 200) {
                Iterable l = json.decode(response.body);
                rezervacije = l.map((model) => Rezervacija.fromJson(model)).toList();
            }
        });
        print("Rezervacije: ${rezervacije.toString()}");
        return rezervacije;
    }

    List<Slika> getSlike(List<Avtokamp> avtokampi) {
        List<Slika> slike = [];
        for (Avtokamp avtokamp in avtokampi) {
            Response response;
            apiController.getSlikeForKamp(avtokamp.id).then((apiResponse) {
                response = apiResponse;
            }).whenComplete(() {
                if (response.statusCode == 200) {
                    Iterable l = json.decode(response.body);
                    List<Slika> slikeZaKamp = l.map((model) => Slika.fromJson(model)).toList();
                    for (Slika km in slikeZaKamp) {
                        if (!slike.contains(km)) {
                            slike.add(km);
                        }
                    }
                }
            });
        }
        print("Slike: ${slike.toString()}");
        return slike;
    }

    List<StatusRezervacije> getStatusiRezervacij() {
        List<StatusRezervacije> statusiRezervacij = [];
        Response response;
        apiController.getRegije().then((apiResponse) {
            response = apiResponse;
        }).whenComplete(() {
            if (response.statusCode == 200) {
                Iterable l = json.decode(response.body);
                statusiRezervacij = l.map((model) => StatusRezervacije.fromJson(model)).toList();
            }
        });
        print("Statusi rezervacij: ${statusiRezervacij.toString()}");
        return statusiRezervacij;
    }

    List<Storitev> getStoritve(List<Avtokamp> avtokampi) {
        List<Storitev> storitve = [];
        for (Avtokamp avtokamp in avtokampi) {
            Response response;
            apiController.getStoritveForKamp(avtokamp.id).then((apiResponse) {
                response = apiResponse;
            }).whenComplete(() {
                if (response.statusCode == 200) {
                    Iterable l = json.decode(response.body);
                    List<Storitev> slikeZaKamp = l.map((model) => Storitev.fromJson(model)).toList();
                    for (Storitev km in slikeZaKamp) {
                        if (!storitve.contains(km)) {
                            storitve.add(km);
                        }
                    }
                }
            });
        }
        print("Storitev: ${storitve.toString()}");
        return storitve;
    }

    List<StoritevKampirnegaMesta> getStoritveKampirnihMest(List<KampirnoMesto> kampirnaMesta) {
        List<StoritevKampirnegaMesta> storitveKampirnihMest = [];
        for (KampirnoMesto kampirnoMesto in kampirnaMesta) {
            Response response;
            apiController.getStoritveForKampirnoMesto(kampirnoMesto.id).then((apiResponse) {
                response = apiResponse;
            }).whenComplete(() {
                if (response.statusCode == 200) {
                    Iterable l = json.decode(response.body);
                    List<StoritevKampirnegaMesta> storitveZaKampirnoMesto = l.map((model) => StoritevKampirnegaMesta.fromJson(model)).toList();
                    for (StoritevKampirnegaMesta km in storitveZaKampirnoMesto) {
                        if (!storitveKampirnihMest.contains(km)) {
                            storitveKampirnihMest.add(km);
                        }
                    }
                }
            });
        }
        print("Storitve kampirnih mest: ${storitveKampirnihMest.toString()}");
        return storitveKampirnihMest;
    }

    List<VrstaKampiranja> getVrsteKampiranj() {
        List<VrstaKampiranja> vrsteKampiranj = [];
        Response response;
        apiController.getVrsteKampiranj().then((apiResponse) {
            response = apiResponse;
        }).whenComplete(() {
            if (response.statusCode == 200) {
                Iterable l = json.decode(response.body);
                vrsteKampiranj = l.map((model) => VrstaKampiranja.fromJson(model)).toList();
            }
        });
        print("Vrste kampiranj: ${vrsteKampiranj.toString()}");
        return vrsteKampiranj;
    }
}
