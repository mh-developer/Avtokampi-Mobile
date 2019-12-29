import 'package:best_flutter_ui_templates/controllers/api_controller.dart';
import 'package:best_flutter_ui_templates/globals.dart' as globals;
import 'package:best_flutter_ui_templates/models/Avtokamp.dart';
import 'package:best_flutter_ui_templates/models/KampirnoMesto.dart';
import 'package:best_flutter_ui_templates/models/Rezervacija.dart';
import 'package:best_flutter_ui_templates/models/Storitev.dart';
import 'package:best_flutter_ui_templates/models/StoritevKampirnegaMesta.dart';
import 'package:best_flutter_ui_templates/models/VrstaKampiranja.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:http/http.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return new MaterialApp(
            title: 'Flutter Form Demo',
            theme: new ThemeData(
                primarySwatch: Colors.blue,
            ),
            home: new StoritveForm(),
        );
    }
}

class StoritveForm extends StatefulWidget {
    StoritveForm({Key key}) : super(key: key);

    @override
    _StoritveFormState createState() => new _StoritveFormState();
}

class _StoritveFormState extends State<StoritveForm> {
    final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

    Avtokamp izbraniKamp = globals.avtokampi[0];
    KampirnoMesto izbranoKampirnoMesto = getRezerviranaKampirnaMestaZaUporabnikaStaticna()[0];
    Storitev izbranaStoritev = globals.storitve[0];

    List<KampirnoMesto> getRezerviranaKampirnaMestaZaUporabnika() {
        List<KampirnoMesto> kampirnaMesta = [];
        for (Rezervacija r in globals.rezervacije) {
            if (r.uporabnik == globals.currentUser.id) {
                kampirnaMesta.add(getKampirnoMestoById(r.kampirnoMesto));
            }
        }
        return kampirnaMesta;
    }

    KampirnoMesto getKampirnoMestoById(int kampirnoMestoId) {
        for (KampirnoMesto kampirnoMesto in globals.kampirnaMesta) {
            if (kampirnoMesto.id == kampirnoMestoId) {
                return kampirnoMesto;
            }
        }
    }

    static KampirnoMesto getKampirnoMestoByIdStaticna(int kampirnoMestoId) {
        for (KampirnoMesto kampirnoMesto in globals.kampirnaMesta) {
            if (kampirnoMesto.id == kampirnoMestoId) {
                return kampirnoMesto;
            }
        }
    }

    static List<KampirnoMesto> getRezerviranaKampirnaMestaZaUporabnikaStaticna() {
        List<KampirnoMesto> kampirnaMesta = [];
        for (Rezervacija r in globals.rezervacije) {
            if (r.uporabnik == globals.currentUser.id) {
                kampirnaMesta.add(getKampirnoMestoByIdStaticna(r.kampirnoMesto));
            }
        }
        return kampirnaMesta;
    }

    addPrijavaNaStoritev() {
        ApiController apiController = new ApiController();
        Response response;
        apiController.addPrijavaNaStoritev(izbranoKampirnoMesto.id, izbranaStoritev.id).then((apiResponse) {
            response = apiResponse;
        }).whenComplete(() {
            if (response.statusCode == 201) {
                globals.storitveKampirnihMest.add(new StoritevKampirnegaMesta.nova(izbranoKampirnoMesto.id, izbranaStoritev.id));
                print("Storitev je bila uspešno dodana!");
                _ackAlert();
            } else {
                print("Storitev ni bila uspešno dodana!");
                _ackAlert2();
            }
        });
    }

    Future<void> _ackAlert() {
        return showDialog(
            context: context,
            builder: (_) =>
                NetworkGiffyDialog(
                    key: Key("Network"),
                    image: Image.network(
                        "https://thumbs.gfycat.com/EasygoingWastefulIridescentshark-small.gif",
                        fit: BoxFit.cover,
                    ),
                    entryAnimation: EntryAnimation.BOTTOM,
                    buttonOkText: Text("Ok"),
                    buttonCancelText: Text("Nazaj"),
                    title: Text(
                        'STORITEV',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w600),
                    ),
                    description: Text(
                        'Storitev je bila uspešno dodana!',
                        textAlign: TextAlign.center,
                    ),
                    onOkButtonPressed: () {
                        Navigator.of(context).pop();
                    },
                    onCancelButtonPressed: () {
                        Navigator.of(context).pop();
                    },
                ));
    }

    Future<void> _ackAlert2() {
        return showDialog(
            context: context,
            builder: (_) =>
                NetworkGiffyDialog(
                    key: Key("Network"),
                    image: Image.network(
                        "https://banner2.cleanpng.com/20190304/hxu/kisspng-emoji-discord-gif-logo-portable-network-graphics-cross-discord-emoji-5c7ce543567e23.6188659115516890273543.jpg",
                        fit: BoxFit.cover,
                    ),
                    entryAnimation: EntryAnimation.BOTTOM,
                    buttonOkText: Text("Ok"),
                    buttonCancelText: Text("Nazaj"),
                    title: Text(
                        'STORITEV',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w600),
                    ),
                    description: Text(
                        'Storitev žal ni bila uspešno dodana!',
                        textAlign: TextAlign.center,
                    ),
                    onOkButtonPressed: () {
                        Navigator.of(context).pop();
                    },
                    onCancelButtonPressed: () {
                        Navigator.of(context).pop();
                    },
                ));
    }

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
                title: new Text("PRIJAVA NA STORITEV"),
            ),
            body: new SafeArea(
                top: false,
                bottom: false,
                child: new Form(
                    key: _formKey,
                    autovalidate: true,
                    child: new ListView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 5),
                        children: <Widget>[
                            new Text(""),
                            new Text(
                                "Izberite storitev in ostale podatke: ",
                                textAlign: TextAlign.center),
                            new Text(""),
                            new FormField(
                                builder: (FormFieldState state) {
                                    return InputDecorator(
                                        decoration: InputDecoration(
                                            icon: const Icon(Icons.place),
                                            labelText: 'Izberi kampirno mesto',
                                        ),
                                        child: new DropdownButtonHideUnderline(
                                            child: new DropdownButton(
                                                value: izbranoKampirnoMesto,
                                                isDense: true,
                                                onChanged: (KampirnoMesto newValue) {
                                                    setState(() {
                                                        izbranoKampirnoMesto = newValue;
                                                        izbranaStoritev = globals.storitve[0];
                                                        state.didChange(
                                                            newValue);
                                                    });
                                                },
                                                items: getRezerviranaKampirnaMestaZaUporabnika().map((
                                                    KampirnoMesto value) {
                                                    return new DropdownMenuItem(
                                                        value: value,
                                                        child: new Text(
                                                            value.naziv),
                                                    );
                                                }).toList(),
                                            ),
                                        ),
                                    );
                                },
                            ),
                            new FormField(
                                builder: (FormFieldState state) {
                                    return InputDecorator(
                                        decoration: InputDecoration(
                                            icon: const Icon(Icons.my_location),
                                            labelText: 'Izberi storitev',
                                        ),
                                        child: new DropdownButtonHideUnderline(
                                            child: new DropdownButton(
                                                value: izbranaStoritev,
                                                isDense: true,
                                                onChanged: (
                                                    Storitev newValue) {
                                                    setState(() {
                                                        izbranaStoritev =
                                                            newValue;
                                                        state.didChange(
                                                            newValue);
                                                    });
                                                },
                                                items: globals.storitve.map((
                                                    Storitev value) {
                                                    return new DropdownMenuItem(
                                                        value: value,
                                                        child: new Text(
                                                            value.naziv),
                                                    );
                                                }).toList(),
                                            ),
                                        ),
                                    );
                                },
                            ),
                            new Container(
                                padding: const EdgeInsets.only(
                                    left: 40.0, top: 20.0),
                                child: new RaisedButton(
                                    disabledColor: Colors.green,
                                    color: Colors.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0)),
                                    child: const Text('Prijavi se'),
                                    onPressed: () {
                                        addPrijavaNaStoritev();
                                    },
                                ),),
                        ],
                    ))),
        );
    }
}