import 'package:avtokampi/controllers/api_controller.dart';
import 'package:avtokampi/globals.dart' as globals;
import 'package:avtokampi/models/Avtokamp.dart';
import 'package:avtokampi/models/Drzava.dart';
import 'package:avtokampi/models/KampirnoMesto.dart';
import 'package:avtokampi/models/Kategorija.dart';
import 'package:avtokampi/models/Regija.dart';
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
            home: new DodajKampirnoMestoForm(),
        );
    }
}

class DodajKampirnoMestoForm extends StatefulWidget {
    DodajKampirnoMestoForm({Key key}) : super(key: key);

    @override
    _DodajKampirnoMestoFormState createState() =>
        new _DodajKampirnoMestoFormState();
}

class _DodajKampirnoMestoFormState extends State<DodajKampirnoMestoForm> {
    final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

    int trenutniUporabnik = globals.currentUser.id;
    Avtokamp izbraniKamp = globals.avtokampi[0];
    Kategorija izbranaKategorija = globals.kategorije[0];
    TextEditingController nazivKampirnegaMestaKontroler = TextEditingController();
    TextEditingController velikostKampirnegaMestaKontroler = TextEditingController();

    List<Regija> getRegijeZaDrzavo(Drzava drzava) {
        List<Regija> regije = [];
        for (Regija regija in globals.regije) {
            if (regija.drzava == drzava.id) {
                regije.add(regija);
            }
        }
        return regije;
    }

    static List<Regija> getRegijeZaDrzavoStaticna(Drzava drzava) {
        List<Regija> regije = [];
        for (Regija regija in globals.regije) {
            if (regija.drzava == drzava.id) {
                regije.add(regija);
            }
        }
        return regije;
    }

    addKampirnoMesto() {
        ApiController apiController = new ApiController();
        Response response;
        apiController.addKampirnoMesto(
            nazivKampirnegaMestaKontroler.text,
            velikostKampirnegaMestaKontroler.text,
            izbraniKamp.id, izbranaKategorija.id).then((apiResponse) {
            response = apiResponse;
        }).whenComplete(() {
            if (response.statusCode == 201) {
                globals.kampirnaMesta.add(KampirnoMesto.novo(
                    nazivKampirnegaMestaKontroler.text,
                    velikostKampirnegaMestaKontroler.text,
                    izbraniKamp.id, izbranaKategorija.id));
                print("Kampirno mesto je bilo uspešno dodano!");
                _ackAlert();
            } else {
                print("Kampirno mesto ni bilo uspešno dodano!");
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
                        'AVTOKAMP',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w600),
                    ),
                    description: Text(
                        'Kampirno mesto je bilo uspešno dodano!',
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
                        'AVTOKAMP',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w600),
                    ),
                    description: Text(
                        'Kampirno mesto žal ni bilo uspešno dodano!',
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
                title: new Text("VPIS NOVEGA MESTA"),
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
                                "Podatki za vaše novo mesto v kampu: ",
                                textAlign: TextAlign.center),
                            new Text(""),
                            new TextFormField(
                                controller: nazivKampirnegaMestaKontroler,
                                decoration: const InputDecoration(
                                    icon: const Icon(Icons.text_fields),
                                    hintText: 'Naziv kampirnega mesta',
                                    labelText: 'Naziv kampirnega mesta',
                                ),
                            ),
                            new Text(""),
                            new TextFormField(
                                controller: velikostKampirnegaMestaKontroler,
                                decoration: const InputDecoration(
                                    icon: const Icon(Icons.location_on),
                                    hintText: 'Velikost kampirnega mesta',
                                    labelText: 'Velikost kampirnega mesta',
                                ),
                            ),
                            new Text(""),
                            new FormField(
                                builder: (FormFieldState state) {
                                    return InputDecorator(
                                        decoration: InputDecoration(
                                            icon: const Icon(Icons.place),
                                            labelText: 'Izberi avtokamp',
                                        ),
                                        child: new DropdownButtonHideUnderline(
                                            child: new DropdownButton(
                                                value: izbraniKamp,
                                                isDense: true,
                                                onChanged: (Avtokamp newValue) {
                                                    setState(() {
                                                        izbraniKamp =
                                                            newValue;
                                                        state.didChange(
                                                            newValue);
                                                    });
                                                },
                                                items: globals.avtokampi.map((
                                                    Avtokamp value) {
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
                            new Text(""),
                            new FormField(
                                builder: (FormFieldState state) {
                                    return InputDecorator(
                                        decoration: InputDecoration(
                                            icon: const Icon(Icons.my_location),
                                            labelText: 'Izberi kategorijo',
                                        ),
                                        child: new DropdownButtonHideUnderline(
                                            child: new DropdownButton(
                                                value: izbranaKategorija,
                                                isDense: true,
                                                onChanged: (
                                                    Kategorija newValue) {
                                                    setState(() {
                                                        izbranaKategorija =
                                                            newValue;
                                                        state.didChange(
                                                            newValue);
                                                    });
                                                },
                                                items: globals.kategorije.map((
                                                    Kategorija value) {
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
                                    child: const Text('Dodaj'),
                                    onPressed: () {
                                        addKampirnoMesto();
                                    },
                                ),),
                        ],
                    ))),
        );
    }
}