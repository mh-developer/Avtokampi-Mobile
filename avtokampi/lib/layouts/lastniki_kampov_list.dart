import 'package:best_flutter_ui_templates/controllers/api_controller.dart';
import 'package:best_flutter_ui_templates/globals.dart' as globals;
import 'package:best_flutter_ui_templates/layouts/spremeni_kamp_forma.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:http/http.dart';

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
            home: LastnikiKampovList(),
        );
    }
}

class LastnikiKampovList extends StatefulWidget {
    LastnikiKampovList({Key key}) : super(key: key);

    @override
    _LastnikiKampovList createState() => new _LastnikiKampovList();
}

class _LastnikiKampovList extends State<LastnikiKampovList> {

    Color getColor(int index) {
        if (index % 4 == 0)
            return Colors.brown;
        if (index % 3 == 0)
            return Colors.green;
        if (index % 2 == 0)
            return Colors.blue;
        return Colors.red;
    }

    deleteKamp(BuildContext context, int kampId) {
        ApiController apiController = new ApiController();
        Response response;
        apiController.deleteAvtokamp(kampId).then((apiResponse) {
            response = apiResponse;
        }).whenComplete(() {
            if (response.statusCode == 204) {
                print("Kamp uspešno izbrisan!");
                _ackAlert(context);
            } else {
                print("Kamp ni bil uspešno izbrisan!");
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
                    }

                ));
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
                title: Text('SPREMINJANJE VNOSOV'),
            ),
            body: ListView.builder(
                itemCount: globals.avtokampi.length,
                itemBuilder: (context, index) {
                    return Slidable(
                        child: new InkWell(child:
                        Container(
                            color: Colors.white,
                            child: new ListTile(
                                leading: new CircleAvatar(
                                    backgroundColor: getColor(index + 1),
                                    child: new Text(index.toString()),
                                    foregroundColor: Colors.white,
                                ),
                                title: new Text(globals.avtokampi[index].naziv),
                                subtitle: new Text(
                                    globals.avtokampi[index].nazivLokacije),
                            ),
                        ), onTap: () {
                            print(globals.avtokampi[index].id);
                        }),
                        key: ValueKey(index),
                        actionPane: SlidableDrawerActionPane(),
                        actions: <Widget>[
                            IconSlideAction(
                                caption: 'Mesta',
                                color: Colors.green,
                                icon: Icons.filter_tilt_shift,
                            ),
                            IconSlideAction(
                                caption: 'Storitve',
                                color: Colors.blue,
                                icon: Icons.wifi,
                            ),
                        ],
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
                                                SpremeniKampForm(
                                                    avtokamp: globals
                                                        .avtokampi[index]),
                                        ),
                                    );
                                }
                            ),
                            IconSlideAction(
                                caption: 'Izbriši',
                                color: Colors.red,
                                icon: Icons.delete,
                                onTap: () {
                                    setState(() {
                                        globals.avtokampi.removeAt(index);
                                        deleteKamp(context,
                                            globals.avtokampi[index].id);
                                    });
                                }
                            ),
                        ],
                        dismissal: SlidableDismissal(
                            child: SlidableDrawerDismissal(),
                        )
                        ,
                    );
                },
            ),
        );
    }
}