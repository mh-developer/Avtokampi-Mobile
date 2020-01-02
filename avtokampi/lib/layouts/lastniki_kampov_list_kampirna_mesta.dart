import 'package:avtokampi/controllers/api_controller.dart';
import 'package:avtokampi/globals.dart' as globals;
import 'package:avtokampi/layouts/spremeni_kampirno_mesto_forma.dart';
import 'package:avtokampi/models/Avtokamp.dart';
import 'package:avtokampi/models/KampirnoMesto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:http/http.dart';

import 'dodaj_kampirno_mesto_forma.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Flutter Slidable Demo',
            theme: ThemeData(
                primarySwatch: Colors.blue,
            ),
            home: LastnikiKampovListKampirnaMesta(),
        );
    }
}

class LastnikiKampovListKampirnaMesta extends StatefulWidget {
    LastnikiKampovListKampirnaMesta({Key key, this.kampId}) : super(key: key);

    final int kampId;

    @override
    _LastnikiKampovListKampirnaMesta createState() =>
        new _LastnikiKampovListKampirnaMesta(kampId);
}

class _LastnikiKampovListKampirnaMesta
    extends State<LastnikiKampovListKampirnaMesta> {
    int kampId;
    List<KampirnoMesto> kampirnaMestaList = [];

    _LastnikiKampovListKampirnaMesta(this.kampId);

    @override
    void initState() {
        super.initState();
        kampirnaMestaList = getKampirnaMestaZaKamp();
    }

    Avtokamp getKampById(int kampId) {
        for (Avtokamp avtokamp in globals.avtokampi) {
            if (avtokamp.id == kampId) {
                return avtokamp;
            }
        }
    }

    getKampirnaMestaZaKamp() {
        List<KampirnoMesto> kampirnaMesta = [];
        for (KampirnoMesto km in globals.kampirnaMesta) {
            if (km.avtokamp == kampId) {
                kampirnaMesta.add(km);
            }
        }
        return kampirnaMesta;
    }

    Color getColor(int index) {
        if (index % 4 == 0) return Colors.brown;
        if (index % 3 == 0) return Colors.green;
        if (index % 2 == 0) return Colors.blue;
        return Colors.red;
    }

    deleteKampirnoMesto(BuildContext context, int kampirnoMestoId) {
        ApiController apiController = new ApiController();
        Response response;
        apiController
            .deleteKampirnoMesto(kampId, kampirnoMestoId)
            .then((apiResponse) {
            response = apiResponse;
        }).whenComplete(() {
            if (response.statusCode == 204) {
                print("Kampirno mesto uspešno izbrisano!");
                _ackAlert(context);
            } else {
                print("Kampirno mesto ni bilo uspešno izbrisan!");
                _ackAlert2(context);
            }
        });
    }

    Future<void> _ackAlert(BuildContext context) {
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
                        'AKCIJA',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w600),
                    ),
                    description: Text(
                        'Akcija je bila uspešna!',
                        textAlign: TextAlign.center,
                    ),
                    onOkButtonPressed: () {
                        Navigator.of(context).pop();
                    },
                    onCancelButtonPressed: () {
                        Navigator.of(context).pop();
                    }));
    }

    Future<void> _ackAlert2(BuildContext context) {
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
                        'AKCIJA',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w600),
                    ),
                    description: Text(
                        'Akcija žal ni bila uspešno izvedena!',
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
        return Scaffold(
            appBar: AppBar(
                title: Text('KAMPIRNA MESTA'),
            ),
            body: ListView.builder(
                itemCount: kampirnaMestaList.length,
                itemBuilder: (context, index) {
                    return Slidable(
                        child: new InkWell(
                            child: Container(
                                color: Colors.white,
                                child: new ListTile(
                                    leading: new CircleAvatar(
                                        backgroundColor: getColor(index + 1),
                                        child: new Text(index.toString()),
                                        foregroundColor: Colors.white,
                                    ),
                                    title: new Text(
                                        kampirnaMestaList[index].naziv),
                                    subtitle: new Text(
                                        kampirnaMestaList[index].velikost),
                                ),
                            ),
                            onTap: () {
                                print(kampirnaMestaList[index].id);
                            }),
                        key: ValueKey(index),
                        actionPane: SlidableDrawerActionPane(),
                        secondaryActions: <Widget>[
                            IconSlideAction(
                                caption: 'Popravi',
                                color: Colors.yellow,
                                icon: Icons.build,
                                onTap: () {
                                    Navigator.push<dynamic>(
                                        context,
                                        MaterialPageRoute<dynamic>(
                                            builder: (BuildContext context) =>
                                                SpremeniKampirnoMestoForm(
                                                    kampirnoMesto: kampirnaMestaList[index],
                                                    kamp: getKampById(kampId))),
                                    );
                                }),
                            IconSlideAction(
                                caption: 'Izbriši',
                                color: Colors.red,
                                icon: Icons.delete,
                                onTap: () {
                                    setState(() {
                                        globals.kampirnaMesta.remove(
                                            kampirnaMestaList[index]);
                                        deleteKampirnoMesto(context,
                                            kampirnaMestaList[index].id);
                                    });
                                }),
                        ],
                        dismissal: SlidableDismissal(
                            child: SlidableDrawerDismissal(),
                        ),
                    );
                },
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                    Navigator.push<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) =>
                                DodajKampirnoMestoForm(),
                        ),
                    );
                },
                child: Icon(Icons.add),
                backgroundColor: Colors.green,
            ),
        );
    }
}
