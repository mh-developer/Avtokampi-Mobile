import 'package:best_flutter_ui_templates/controllers/api_controller.dart';
import 'package:best_flutter_ui_templates/globals.dart' as globals;
import 'package:best_flutter_ui_templates/models/Avtokamp.dart';
import 'package:best_flutter_ui_templates/models/Mnenje.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:http/http.dart';

void main() => runApp(KampiList());

List _elements = [
    {'name': 'John', 'group': 'Team A'},
    {'name': 'Will', 'group': 'Team B'},
    {'name': 'Beth', 'group': 'Team A'},
    {'name': 'Miranda', 'group': 'Team B'},
    {'name': 'Mike', 'group': 'Team C'},
    {'name': 'Danny', 'group': 'Team C'},
];

class KampiList extends StatefulWidget {
    @override
    _KampiListState createState() => _KampiListState();
}

class _KampiListState extends State<KampiList> {

    String izbraniKamp = globals.avtokampi[0].naziv;
    double izbranaOcena = 3.0;
    int uporabnikId = globals.currentUser.id;
    String mnenje = "";

    List _getMnenjaZaKampe() {
        List elementiMnenj = [];
        for (Avtokamp avtokamp in globals.avtokampi) {
            for (Mnenje mnenje in globals.mnenja) {
                if (avtokamp.id == mnenje.avtokamp) {
                    elementiMnenj.add(
                        {"avtokamp": avtokamp.naziv, "mnenje": mnenje.mnenje});
                }
            }
        }
        return elementiMnenj;
    }

    int getKampIdByIme(String ime) {
        for (Avtokamp a in globals.avtokampi) {
            if (a.naziv == ime) {
                return a.id;
            }
        }
    }

    addMnenje() {
        ApiController apiController = new ApiController();
        Response response;
        int avtokampId = getKampIdByIme(this.izbraniKamp);
        apiController.addOpinion(this.uporabnikId, avtokampId, this.mnenje,
            this.izbranaOcena.toInt()).then((apiResponse) {
            response = apiResponse;
        }).whenComplete(() {
            if (response.statusCode == 200) {
                globals.mnenja.add(new Mnenje.novo(
                    mnenje, izbranaOcena.toInt(), uporabnikId, avtokampId));
                this.mnenje = "";
                print("Mnenje je bilo uspešno dodano!");
                _ackAlert();
            } else {
                this.mnenje = "";
                print("Mnenje ni bilo uspešno dodano!");
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
                        'MNENJE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w600),
                    ),
                    description: Text(
                        'Mnenje je bilo uspešno dodano!',
                        textAlign: TextAlign.center,
                    ),
                    onOkButtonPressed: () {
                        Navigator.of(context).pop();
                        setState(() {});
                    },
                    onCancelButtonPressed: () {
                        Navigator.of(context).pop();
                        setState(() {});
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
                        'MNENJE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w600),
                    ),
                    description: Text(
                        'Mnenje žal ni bilo uspešno dodano!',
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

    _showAddMnenjeDialog(BuildContext context) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
                return AlertDialog(
                    content: Form(
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: new FormField(
                                        builder: (FormFieldState state) {
                                            return InputDecorator(
                                                decoration: InputDecoration(
                                                    icon: const Icon(Icons
                                                        .not_listed_location,
                                                        color: Colors.red,),
                                                    labelText: 'Izberi avtokamp',
                                                ),
                                                child: new DropdownButtonHideUnderline(
                                                    child: new DropdownButton(
                                                        isDense: false,
                                                        onChanged: (
                                                            String newValue) {
                                                            setState(() {
                                                                izbraniKamp =
                                                                    newValue;
                                                                Navigator.pop(
                                                                    context);
                                                                _showAddMnenjeDialog(
                                                                    context);
                                                            });
                                                        },
                                                        value: izbraniKamp,
                                                        items: globals.avtokampi
                                                            .map((
                                                            Avtokamp value) {
                                                            return new DropdownMenuItem(
                                                                value: value
                                                                    .naziv,
                                                                child: new Text(
                                                                    value
                                                                        .naziv),
                                                            );
                                                        }).toList(),
                                                    ),
                                                )
                                            );
                                        })),
                                Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        initialValue: this.mnenje,
                                        decoration: const InputDecoration(
                                            icon: const Icon(Icons.textsms,
                                                color: Colors.red,),
                                            hintText: 'Vpiši svoje mnenje.',
                                            labelText: 'Mnenje',
                                        ),
                                        keyboardType: TextInputType.text,
                                        onChanged: (String novoMnenje) {
                                            this.mnenje = novoMnenje;
                                        },),
                                ),
                                Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text("Ocenite kamp:")
                                ),
                                Padding(
                                    padding: new EdgeInsets.all(8.0),
                                    child: StarRating(
                                        size: 25.0,
                                        rating: izbranaOcena,
                                        color: Colors.orange,
                                        borderColor: Colors.grey,
                                        starCount: 5,
                                        onRatingChanged: (rating) =>
                                            setState(
                                                    () {
                                                    this.izbranaOcena = rating;
                                                    Navigator.pop(
                                                        context);
                                                    _showAddMnenjeDialog(
                                                        context);
                                                },
                                            ),
                                    ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RaisedButton(
                                        child: Text("DODAJ MNENJE"),
                                        onPressed: () {
                                            addMnenje();
                                            Navigator.pop(context);
                                        },
                                    ),
                                )
                            ],
                        ),
                    ),
                );
            });
    }

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'MNENJA ZA KAMPE',
            theme: ThemeData(
                primarySwatch: Colors.blue,
            ),
            home: Scaffold(
                appBar: AppBar(
                    title: Text(
                        'Mnenja o avtokampih', textAlign: TextAlign.center,),
                    leading: new IconButton(
                        icon: new Icon(Icons.keyboard_backspace),
                        onPressed: () => Navigator.of(context).pop(),
                    ),
                ),
                body: GroupedListView<dynamic, String>(
                    groupBy: (element) => element['avtokamp'],
                    elements: _getMnenjaZaKampe(),
                    sort: true,
                    groupSeparatorBuilder: (String value) =>
                        Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(
                                child: Text(
                                    value,
                                    style: TextStyle(fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                )),
                        ),
                    itemBuilder: (c, element) {
                        return Card(
                            elevation: 8.0,
                            margin: new EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 6.0),
                            child: Container(
                                child: ListTile(
                                    contentPadding:
                                    EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 10.0),
                                    leading: Icon(Icons.account_box,
                                        color: Colors.blueAccent,),
                                    title: Text(element['mnenje']),
                                    trailing: Icon(
                                        Icons.check, color: Colors.green,),
                                ),
                            ),
                        );
                    },
                ),
                floatingActionButton: FloatingActionButton(
                    onPressed: () {
                        _showAddMnenjeDialog(context);
                    },
                    child: Icon(Icons.add),
                    backgroundColor: Colors.red,

                ),
            ),
        );
    }

    _KampiListState();
}