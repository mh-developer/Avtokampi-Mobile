import 'package:avtokampi/controllers/api_controller.dart';
import 'package:avtokampi/globals.dart' as globals;
import 'package:avtokampi/models/Avtokamp.dart';
import 'package:avtokampi/models/Drzava.dart';
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
            home: new SpremeniKampForm(),
        );
    }
}

class SpremeniKampForm extends StatefulWidget {
    SpremeniKampForm({Key key, this.avtokamp}) : super(key: key);

    final Avtokamp avtokamp;

    @override
    _SpremeniKampFormState createState() =>
        new _SpremeniKampFormState(avtokamp);
}

class _SpremeniKampFormState extends State<SpremeniKampForm> {
    final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

    Avtokamp avtokamp;

    _SpremeniKampFormState(this.avtokamp);

    int trenutniUporabnik = globals.currentUser.id;
    Drzava izbranaDrzava = globals.drzave[0];
    Regija izbranaRegija = getRegijeZaDrzavoStaticna(globals.drzave[0])[0];
    TextEditingController nazivKampaKontroler = TextEditingController();
    TextEditingController opisKampaKontroler = TextEditingController();
    TextEditingController naslovKampaKontroler = TextEditingController();
    TextEditingController telefonKampaKontroler = TextEditingController();
    TextEditingController nazivLokacijaKampaKontroler = TextEditingController();

    @override
    void initState() {
        super.initState();
        izbranaRegija = getRegijaById(avtokamp.regija);
        izbranaDrzava = getDrzavaById(izbranaRegija.drzava);
        nazivKampaKontroler = TextEditingController(text: avtokamp.naziv);
        opisKampaKontroler = TextEditingController(text: avtokamp.opis);
        naslovKampaKontroler = TextEditingController(text: avtokamp.naslov);
        nazivLokacijaKampaKontroler =
            TextEditingController(text: avtokamp.nazivLokacije);
        nazivLokacijaKampaKontroler =
            TextEditingController(text: avtokamp.nazivLokacije);
        telefonKampaKontroler = TextEditingController(text: avtokamp.telefon);
    }

    Regija getRegijaById(int idRegije) {
        for (Regija regija in globals.regije) {
            if (regija.id == idRegije) {
                return regija;
            }
        }
    }

    Drzava getDrzavaById(int idDrzava) {
        for (Drzava drzava in globals.drzave) {
            if (drzava.id == idDrzava) {
                return drzava;
            }
        }
    }

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

    modifyAvtokamp() {
        ApiController apiController = new ApiController();
        Response response;
        apiController.modifyAvtokamp(
            avtokamp.id,
            nazivKampaKontroler.text,
            nazivLokacijaKampaKontroler.text,
            naslovKampaKontroler.text,
            telefonKampaKontroler.text,
            opisKampaKontroler.text,
            izbranaRegija.id).then((apiResponse) {
            response = apiResponse;
        }).whenComplete(() {
            if (response.statusCode == 204) {
                globals.avtokampi.remove(avtokamp);
                globals.avtokampi.add(new Avtokamp.novi(
                    nazivKampaKontroler.text, nazivLokacijaKampaKontroler.text,
                    naslovKampaKontroler.text, telefonKampaKontroler.text,
                    opisKampaKontroler.text, izbranaRegija.id));
                print("Avtokamp je bil uspešno spremenjen!");
                _ackAlert();
            } else {
                print("Avtokamp ni bil uspešno spremenjen!");
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
                        'SPREMEMBE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w600),
                    ),
                    description: Text(
                        'Avtokamp je bil uspešno spremenjen!',
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
                        'SPREMEMBE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w600),
                    ),
                    description: Text(
                        'Avtokamp žal ni bil uspešno spremenjen!',
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
                title: new Text("SPREMEMBA KAMPA"),
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
                                "Vpišite podatke za spremenjeni kamp: ",
                                textAlign: TextAlign.center),
                            new Text(""),
                            new TextFormField(
                                controller: nazivKampaKontroler,
                                decoration: const InputDecoration(
                                    icon: const Icon(Icons.text_fields),
                                    hintText: 'Naziv avtokampa',
                                    labelText: 'Naziv avtokampa',
                                ),
                            ),
                            new Text(""),
                            new TextFormField(
                                controller: nazivLokacijaKampaKontroler,
                                decoration: const InputDecoration(
                                    icon: const Icon(Icons.location_on),
                                    hintText: 'Naziv lokacije (kraj)',
                                    labelText: 'Naziv lokacije (kraj)',
                                ),
                            ),
                            new Text(""),
                            new TextFormField(
                                controller: naslovKampaKontroler,
                                decoration: const InputDecoration(
                                    icon: const Icon(Icons.my_location),
                                    hintText: 'Naslov avtokampa',
                                    labelText: 'Naslov avtokampa',
                                ),
                            ),
                            new Text(""),
                            new TextFormField(
                                controller: telefonKampaKontroler,
                                decoration: const InputDecoration(
                                    icon: const Icon(Icons.phone),
                                    hintText: 'Telefon avtokampa',
                                    labelText: 'Telefon avtokampa',
                                ),
                            ),
                            new Text(""),
                            new TextFormField(
                                controller: opisKampaKontroler,
                                decoration: const InputDecoration(
                                    icon: const Icon(Icons.message),
                                    hintText: 'Opis avtokampa',
                                    labelText: 'Opis avtokampa',
                                ),
                            ),
                            new FormField(
                                builder: (FormFieldState state) {
                                    return InputDecorator(
                                        decoration: InputDecoration(
                                            icon: const Icon(Icons.place),
                                            labelText: 'Izberi državo',
                                        ),
                                        child: new DropdownButtonHideUnderline(
                                            child: new DropdownButton(
                                                value: izbranaDrzava,
                                                isDense: true,
                                                onChanged: (Drzava newValue) {
                                                    setState(() {
                                                        izbranaDrzava =
                                                            newValue;
                                                        state.didChange(
                                                            newValue);
                                                        izbranaRegija =
                                                        getRegijeZaDrzavo(
                                                            izbranaDrzava)[0];
                                                    });
                                                },
                                                items: globals.drzave.map((
                                                    Drzava value) {
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
                                            labelText: 'Izberi regijo',
                                        ),
                                        child: new DropdownButtonHideUnderline(
                                            child: new DropdownButton(
                                                value: izbranaRegija,
                                                isDense: true,
                                                onChanged: (Regija newValue) {
                                                    setState(() {
                                                        izbranaRegija =
                                                            newValue;
                                                        state.didChange(
                                                            newValue);
                                                    });
                                                },
                                                items: getRegijeZaDrzavo(
                                                    izbranaDrzava).map((
                                                    Regija value) {
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
                                    disabledColor: Colors.yellowAccent,
                                    color: Colors.yellowAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0)),
                                    child: const Text('Popravi'),
                                    onPressed: () {
                                        modifyAvtokamp();
                                    },
                                ),),
                        ],
                    ))),
        );
    }
}