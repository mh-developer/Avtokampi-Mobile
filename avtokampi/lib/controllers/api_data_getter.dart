import 'dart:convert';

import 'package:best_flutter_ui_templates/globals.dart' as globals;
import 'package:best_flutter_ui_templates/models/Avtokamp.dart';
import 'package:best_flutter_ui_templates/models/Cenik.dart';
import 'package:best_flutter_ui_templates/models/Drzava.dart';
import 'package:best_flutter_ui_templates/models/KampirnoMesto.dart';
import 'package:best_flutter_ui_templates/models/Kategorija.dart';
import 'package:best_flutter_ui_templates/models/KategorijaStoritve.dart';
import 'package:best_flutter_ui_templates/models/Mnenje.dart';
import 'package:best_flutter_ui_templates/models/Regija.dart';
import 'package:best_flutter_ui_templates/models/Rezervacija.dart';
import 'package:best_flutter_ui_templates/models/Slika.dart';
import 'package:best_flutter_ui_templates/models/StatusRezervacije.dart';
import 'package:best_flutter_ui_templates/models/Storitev.dart';
import 'package:best_flutter_ui_templates/models/StoritevKampirnegaMesta.dart';
import 'package:best_flutter_ui_templates/models/VrstaKampiranja.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'api_controller.dart';

class ApiDataGetter {
    ApiController apiController = new ApiController();

    getAvtokampi() {
        Response response;
        apiController.getAvtokampi().then((apiResponse) {
            response = apiResponse;
        }).whenComplete(() {
            if (response.statusCode == 200) {
                Iterable l = json.decode(response.body);
                globals.avtokampi =
                    l.map((model) => Avtokamp.fromJson(model)).toList();
            }
            print("Avtokampi: ${globals.avtokampi.toString()}");
        });
    }

    getCeniki() {
        for (Avtokamp avtokamp in globals.avtokampi) {
            Response response;
            apiController.getCenikiForKamp(avtokamp.id).then((apiResponse) {
                response = apiResponse;
            }).whenComplete(() {
                if (response.statusCode == 200) {
                    Iterable l = json.decode(response.body);
                    List<Cenik> cenikiZaKamp = l.map((model) =>
                        Cenik.fromJson(model)).toList();
                    for (Cenik c in cenikiZaKamp) {
                        if (!globals.ceniki.contains(c)) {
                            globals.ceniki.add(c);
                        }
                    }
                }
                print("Ceniki: ${globals.ceniki.toString()}");
            });
        }
    }

    List<Drzava> getDrzave() {
        Response response;
        apiController.getDrzave().then((apiResponse) {
            response = apiResponse;
        }).whenComplete(() {
            if (response.statusCode == 200) {
                Iterable l = json.decode(response.body);
                globals.drzave =
                    l.map((model) => Drzava.fromJson(model)).toList();
            }
            print("Drzave: ${globals.drzave.toString()}");
        });
    }

    List<KampirnoMesto> getKampirnaMesta() {
        for (Avtokamp avtokamp in globals.avtokampi) {
            Response response;
            apiController.getKampirnaMestaForKamp(avtokamp.id).then((
                apiResponse) {
                response = apiResponse;
            }).whenComplete(() {
                if (response.statusCode == 200) {
                    Iterable l = json.decode(response.body);
                    List<KampirnoMesto> kampirnaMestaZaKamp = l.map((model) =>
                        KampirnoMesto.fromJson(model)).toList();
                    for (KampirnoMesto km in kampirnaMestaZaKamp) {
                        if (!globals.kampirnaMesta.contains(km)) {
                            globals.kampirnaMesta.add(km);
                        }
                    }
                }
                print("Kampirna mesta: ${globals.kampirnaMesta.toString()}");
            });
        }
    }

    List<Kategorija> getKategorije() {
        Response response;
        apiController.getKategorije().then((apiResponse) {
            response = apiResponse;
        }).whenComplete(() {
            if (response.statusCode == 200) {
                Iterable l = json.decode(response.body);
                globals.kategorije =
                    l.map((model) => Kategorija.fromJson(model)).toList();
            }
            print("Kategorije: ${globals.kategorije.toString()}");
        });
    }

    List<KategorijaStoritve> getKategorijeStoritev() {
        Response response;
        apiController.getKategorije().then((apiResponse) {
            response = apiResponse;
        }).whenComplete(() {
            if (response.statusCode == 200) {
                Iterable l = json.decode(response.body);
                globals.kategorijeStoritev = l
                    .map((model) => KategorijaStoritve.fromJson(model))
                    .toList();
            }
            print("Kategorije storitev: ${globals.kategorijeStoritev
                .toString()}");
        });
    }

    getMnenja() {
        for (Avtokamp avtokamp in globals.avtokampi) {
            Response response;
            apiController.getMnenjaForKamp(avtokamp.id).then((apiResponse) {
                response = apiResponse;
            }).whenComplete(() {
                if (response.statusCode == 200) {
                    Iterable l = json.decode(response.body);
                    List<Mnenje> mnenjaZaKamp = l.map((model) =>
                        Mnenje.fromJson(model)).toList();
                    for (Mnenje km in mnenjaZaKamp) {
                        if (!globals.mnenja.contains(km)) {
                            globals.mnenja.add(km);
                        }
                    }
                }
                print("Mnenja: ${globals.mnenja.toString()}");
            });
        }
    }

    List<Regija> getRegije() {
        Response response;
        apiController.getRegije().then((apiResponse) {
            response = apiResponse;
        }).whenComplete(() {
            if (response.statusCode == 200) {
                Iterable l = json.decode(response.body);
                globals.regije =
                    l.map((model) => Regija.fromJson(model)).toList();
            }
            print("Regije: ${globals.regije.toString()}");
        });
    }

    List<Rezervacija> getRezervacije() {
        Response response;
        apiController.getRegije().then((apiResponse) {
            response = apiResponse;
        }).whenComplete(() {
            if (response.statusCode == 200) {
                Iterable l = json.decode(response.body);
                globals.rezervacije =
                    l.map((model) => Rezervacija.fromJson(model)).toList();
            }
            print("Rezervacije: ${globals.rezervacije.toString()}");
        });
    }

    List<Slika> getSlike() {
        for (Avtokamp avtokamp in globals.avtokampi) {
            Response response;
            apiController.getSlikeForKamp(avtokamp.id).then((apiResponse) {
                response = apiResponse;
            }).whenComplete(() {
                if (response.statusCode == 200) {
                    Iterable l = json.decode(response.body);
                    List<Slika> slikeZaKamp = l.map((model) =>
                        Slika.fromJson(model)).toList();
                    for (Slika km in slikeZaKamp) {
                        if (!globals.slike.contains(km)) {
                            globals.slike.add(km);
                        }
                    }
                }
                print("Slike: ${globals.slike.toString()}");
            });
        }
    }

    List<StatusRezervacije> getStatusiRezervacij() {
        Response response;
        apiController.getRegije().then((apiResponse) {
            response = apiResponse;
        }).whenComplete(() {
            if (response.statusCode == 200) {
                Iterable l = json.decode(response.body);
                globals.statusiRezervacij = l
                    .map((model) => StatusRezervacije.fromJson(model))
                    .toList();
            }
            print(
                "Statusi rezervacij: ${globals.statusiRezervacij.toString()}");
        });
    }

    List<Storitev> getStoritve() {
        for (Avtokamp avtokamp in globals.avtokampi) {
            Response response;
            apiController.getStoritveForKamp(avtokamp.id).then((apiResponse) {
                response = apiResponse;
            }).whenComplete(() {
                if (response.statusCode == 200) {
                    Iterable l = json.decode(response.body);
                    List<Storitev> slikeZaKamp = l.map((model) =>
                        Storitev.fromJson(model)).toList();
                    for (Storitev km in slikeZaKamp) {
                        if (!globals.storitve.contains(km)) {
                            globals.storitve.add(km);
                        }
                    }
                }
                print("Storitev: ${globals.storitve.toString()}");
            });
        }
    }

    List<StoritevKampirnegaMesta> getStoritveKampirnihMest() {
        for (KampirnoMesto kampirnoMesto in globals.kampirnaMesta) {
            Response response;
            apiController.getStoritveForKampirnoMesto(kampirnoMesto.id).then((
                apiResponse) {
                response = apiResponse;
            }).whenComplete(() {
                if (response.statusCode == 200) {
                    Iterable l = json.decode(response.body);
                    List<StoritevKampirnegaMesta> storitveZaKampirnoMesto = l
                        .map((model) => StoritevKampirnegaMesta.fromJson(model))
                        .toList();
                    for (StoritevKampirnegaMesta km in storitveZaKampirnoMesto) {
                        if (!globals.storitveKampirnihMest.contains(km)) {
                            globals.storitveKampirnihMest.add(km);
                        }
                    }
                }
                print("Storitve kampirnih mest: ${globals.storitveKampirnihMest
                    .toString()}");
            });
        }
    }

    List<VrstaKampiranja> getVrsteKampiranj() {
        Response response;
        apiController.getVrsteKampiranj().then((apiResponse) {
            response = apiResponse;
        }).whenComplete(() {
            if (response.statusCode == 200) {
                Iterable l = json.decode(response.body);
                globals.vrsteKampiranj =
                    l.map((model) => VrstaKampiranja.fromJson(model)).toList();
            }
            print("Vrste kampiranj: ${globals.vrsteKampiranj.toString()}");
        });
    }

    setGlobals() {
        getAvtokampi();
        getCeniki();
        getDrzave();
        getKampirnaMesta();
        getKategorije();
        getKategorijeStoritev();
        getMnenja();
        getRegije();
        getRezervacije();
        getSlike();
        getStatusiRezervacij();
        getStoritve();
        getStoritveKampirnihMest();
        getVrsteKampiranj();
    }

    static loadData(context) {
        ProgressDialog pr = new ProgressDialog(
            context, type: ProgressDialogType.Normal,
            isDismissible: false,
            showLogs: true);
        pr.style(
            message: 'Pridobivam podatke iz API-ja.',
            borderRadius: 10.0,
            backgroundColor: Colors.white,
            progressWidget: CircularProgressIndicator(),
            elevation: 10.0,
            insetAnimCurve: Curves.easeInOut,
            progress: 0.0,
            maxProgress: 100.0,
            progressTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 13.0,
                fontWeight: FontWeight.w400),
            messageTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 19.0,
                fontWeight: FontWeight.w600)
        );
        pr.show();
        ApiDataGetter apiDataGetter = new ApiDataGetter();
        apiDataGetter.setGlobals();
        pr.update(
            message: "Potrpite malo! Podatki so skoraj že pridobljeni.",
            progressWidget: Container(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator()),
            maxProgress: 100.0,
            progressTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 13.0,
                fontWeight: FontWeight.w400),
            messageTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 19.0,
                fontWeight: FontWeight.w600),
        );
        pr.hide();
    }
}