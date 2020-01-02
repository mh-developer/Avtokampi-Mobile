import 'package:avtokampi/controllers/api_controller.dart';
import 'package:avtokampi/globals.dart' as globals;
import 'package:avtokampi/models/Avtokamp.dart';
import 'package:avtokampi/models/KampirnoMesto.dart';
import 'package:avtokampi/models/Kategorija.dart';
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
            home: new SpremeniKampirnoMestoForm(),
        );
    }
}

class SpremeniKampirnoMestoForm extends StatefulWidget {
    SpremeniKampirnoMestoForm({Key key, this.kampirnoMesto, this.kamp})
        : super(key: key);

    final KampirnoMesto kampirnoMesto;
    final Avtokamp kamp;

    @override
    _SpremeniKampirnoMestoFormState createState() =>
        new _SpremeniKampirnoMestoFormState(kampirnoMesto, kamp);
}

class _SpremeniKampirnoMestoFormState extends State<SpremeniKampirnoMestoForm> {
    final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

    KampirnoMesto kampirnoMesto;
    Avtokamp izbraniKamp;

    _SpremeniKampirnoMestoFormState(this.kampirnoMesto, this.izbraniKamp);

    int trenutniUporabnik = globals.currentUser.id;
    Kategorija izbranaKategorija = globals.kategorije[0];
    TextEditingController nazivKampirnegaMestaKontroler = TextEditingController();
    TextEditingController velikostKampirnegaMestaKontroler =
    TextEditingController();

    @override
    void initState() {
        super.initState();
        izbranaKategorija = getKategorijaById(kampirnoMesto.kategorija);
        nazivKampirnegaMestaKontroler =
            TextEditingController(text: kampirnoMesto.naziv);
        velikostKampirnegaMestaKontroler =
            TextEditingController(text: kampirnoMesto.velikost);
    }

    Kategorija getKategorijaById(int idKategorije) {
        for (Kategorija kategorija in globals.kategorije) {
            if (kategorija.id == idKategorije) {
                return kategorija;
            }
        }
    }

    modifyKampirnoMesto() {
        ApiController apiController = new ApiController();
        Response response;
        apiController.modifyKampirnoMesto(
            kampirnoMesto.id,
            nazivKampirnegaMestaKontroler.text,
            velikostKampirnegaMestaKontroler.text,
            izbraniKamp.id,
            izbranaKategorija.id).then((apiResponse) {
            response = apiResponse;
        }).whenComplete(() {
            if (response.statusCode == 201) {
                globals.kampirnaMesta.remove(kampirnoMesto);
                globals.kampirnaMesta.add(new KampirnoMesto.novo(
                    nazivKampirnegaMestaKontroler.text,
                    velikostKampirnegaMestaKontroler.text,
                    izbraniKamp.id,
                    izbranaKategorija.id));
                print("Kampirno mesto je bilo uspešno spremenjeno!");
                _ackAlert();
            } else {
                print("Kampirno mesto ni bilo uspešno spremenjeno!");
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
                        'Kampirno mesto je bilo uspešno spremenjeno!',
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
                        'Kampirno mesto žal ni bilo uspešno spremenjeno!',
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
                title: new Text("SPREMEMBA KAMPIRNEGA MESTA"),
            ),
            body: new SafeArea(
                top: false,
                bottom: false,
                child: new Form(
                    key: _formKey,
                    autovalidate: true,
                    child: new ListView(
                        padding:
                        const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 5),
                        children: <Widget>[
                            new Text(""),
                            new Text(
                                "Vpišite podatke za spremenjeno kampirno mesto: ",
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
                                    icon: const Icon(Icons.message),
                                    hintText: 'Velikost kampirnega mesta',
                                    labelText: 'Velikost kampirnega mesta',
                                ),
                            ),
                            new FormField(
                                builder: (FormFieldState state) {
                                    return InputDecorator(
                                        decoration: InputDecoration(
                                            icon: const Icon(Icons.place),
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
                                    disabledColor: Colors.yellowAccent,
                                    color: Colors.yellowAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0)),
                                    child: const Text('Popravi'),
                                    onPressed: () {
                                        modifyKampirnoMesto();
                                    },
                                ),
                            ),
                        ],
                    ))),
        );
    }
}
