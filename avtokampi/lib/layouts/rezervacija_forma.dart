import 'package:best_flutter_ui_templates/controllers/api_controller.dart';
import 'package:best_flutter_ui_templates/globals.dart' as globals;
import 'package:best_flutter_ui_templates/models/Avtokamp.dart';
import 'package:best_flutter_ui_templates/models/KampirnoMesto.dart';
import 'package:best_flutter_ui_templates/models/Rezervacija.dart';
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
            home: new ReservationForm(),
        );
    }
}

class ReservationForm extends StatefulWidget {
    ReservationForm({Key key}) : super(key: key);

    ReservationForm.drug({Key key, this.izbraniKamp, this.izbranoKampirnoMesto, this.preValued}) : super(key: key);

    Avtokamp izbraniKamp;
    KampirnoMesto izbranoKampirnoMesto;
    bool preValued = false;

    @override
    _ReservationFormState createState() => preValued == false ? new _ReservationFormState() : new _ReservationFormState.drugi(izbraniKamp, izbranoKampirnoMesto);
}

class _ReservationFormState extends State<ReservationForm> {
    final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

    _ReservationFormState();

    _ReservationFormState.drugi(this.izbraniKamp, this.izbranoKampirnoMesto);

    Avtokamp izbraniKamp = globals.avtokampi[0];
    KampirnoMesto izbranoKampirnoMesto = getKampirnaMestaZaKampStaticna(globals.avtokampi[0])[0];
    VrstaKampiranja izbranaVrstaKampiranja = globals.vrsteKampiranj[0];
    String izbraniDatumOd = "2019-12-28T17:17:16.058Z";
    String izbraniDatumDo = "2019-12-30T17:17:16.058Z";
    int trenutniUporabnik = globals.currentUser.id;
    TextEditingController txt1 = TextEditingController(text: "2019-12-28T17:17:16.058Z");
    TextEditingController txt2 = TextEditingController(text: "2019-12-30T17:17:16.058Z");

    List<KampirnoMesto> getKampirnaMestaZaKamp(Avtokamp kamp) {
        List<KampirnoMesto> kampirnaMesta = [];
        for (KampirnoMesto kampirnoMesto in globals.kampirnaMesta) {
            if (kampirnoMesto.avtokamp == kamp.id) {
                kampirnaMesta.add(kampirnoMesto);
            }
        }
        return kampirnaMesta;
    }

    static List<KampirnoMesto> getKampirnaMestaZaKampStaticna(Avtokamp kamp) {
        List<KampirnoMesto> kampirnaMesta = [];
        for (KampirnoMesto kampirnoMesto in globals.kampirnaMesta) {
            if (kampirnoMesto.avtokamp == kamp.id) {
                kampirnaMesta.add(kampirnoMesto);
            }
        }
        return kampirnaMesta;
    }

    addRezervacija() {
        ApiController apiController = new ApiController();
        Response response;
        apiController.addCampReservation(trenutniUporabnik, izbraniKamp.id, izbranoKampirnoMesto.id, izbranaVrstaKampiranja.id, izbraniDatumOd, izbraniDatumDo).then((apiResponse) {
            response = apiResponse;
        }).whenComplete(() {
            if (response.statusCode == 201) {
                globals.rezervacije.add(new Rezervacija.nova(izbraniDatumOd, izbraniDatumDo, trenutniUporabnik, izbraniKamp.id, izbranoKampirnoMesto.id, izbranaVrstaKampiranja.id, 1));
                print("Rezervacija je bila uspešno dodana!");
                _ackAlert();
            } else {
                print("Rezervacija ni bila uspešno dodana!");
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
                        'REZERVACIJA',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w600),
                    ),
                    description: Text(
                        'Rezervacija je bila uspešno dodana!',
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
                        'REZERVACIJA',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w600),
                    ),
                    description: Text(
                        'Rezervacija žal ni bila uspešno dodana!',
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
                title: new Text("REZERVACIJA KAMPA"),
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
                                "Vpišite podatke za vašo rezervacijo: ",
                                textAlign: TextAlign.center),
                            new Text(""),
                            new TextFormField(
                                controller: txt1,
                                decoration: const InputDecoration(
                                    icon: const Icon(Icons.date_range),
                                    hintText: 'Datum začetka kampiranja',
                                    labelText: 'Datum začetka kampiranja',
                                ),
                            ),
                            new TextFormField(
                                controller: txt2,
                                decoration: const InputDecoration(
                                    icon: const Icon(Icons.date_range),
                                    hintText: 'Datum konca kampiranja',
                                    labelText: 'Datum začetka kampiranja',
                                ),
                            ),
                            new Text(""),
                            new Container(padding: const EdgeInsets.only(
                                left: 40.0), child:
                            new MaterialButton(
                                color: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                onPressed: () async {
                                    final List<
                                        DateTime> picked = await DateRagePicker.showDatePicker(
                                        context: context,
                                        initialFirstDate: new DateTime.now(),
                                        initialLastDate: (new DateTime.now())
                                            .add(new Duration(days: 7)),
                                        firstDate: new DateTime(2015),
                                        lastDate: new DateTime(2021)
                                    );
                                    if (picked != null) {
                                        setState(() {
                                            txt1.text = picked[0].toIso8601String();
                                            txt2.text = picked[1].toIso8601String();
                                            izbraniDatumOd = picked[0].toIso8601String();
                                            izbraniDatumDo = picked[1].toIso8601String();
                                        });
                                    }
                                },
                                child: new Text("Izberi datume rezervacije"),
                            )),
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
                                                        izbraniKamp = newValue;
                                                        state.didChange(
                                                            newValue);
                                                        izbranoKampirnoMesto = getKampirnaMestaZaKamp(izbraniKamp)[0];
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
                            new FormField(
                                builder: (FormFieldState state) {
                                    return InputDecorator(
                                        decoration: InputDecoration(
                                            icon: const Icon(Icons.my_location),
                                            labelText: 'Izberi kampirno mesto',
                                        ),
                                        child: new DropdownButtonHideUnderline(
                                            child: new DropdownButton(
                                                value: izbranoKampirnoMesto,
                                                isDense: true,
                                                onChanged: (
                                                    KampirnoMesto newValue) {
                                                    setState(() {
                                                        izbranoKampirnoMesto =
                                                            newValue;
                                                        state.didChange(
                                                            newValue);
                                                    });
                                                },
                                                items: getKampirnaMestaZaKamp(izbraniKamp).map((
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
                            ), new FormField(
                                builder: (FormFieldState state) {
                                    return InputDecorator(
                                        decoration: InputDecoration(
                                            icon: const Icon(
                                                Icons.directions_car),
                                            labelText: 'Izberi vrsto kampiranja',
                                        ),
                                        child: new DropdownButtonHideUnderline(
                                            child: new DropdownButton(
                                                value: izbranaVrstaKampiranja,
                                                isDense: true,
                                                onChanged: (
                                                    VrstaKampiranja newValue) {
                                                    setState(() {
                                                        izbranaVrstaKampiranja =
                                                            newValue;
                                                        state.didChange(
                                                            newValue);
                                                    });
                                                },
                                                items: globals.vrsteKampiranj
                                                    .map((
                                                    VrstaKampiranja value) {
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
                                    disabledColor: Colors.red,
                                    color: Colors.red,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0)),
                                    child: const Text('Rezerviraj'),
                                    onPressed: () {
                                        addRezervacija();
                                    },
                                ),),
                        ],
                    ))),
        );
    }
}