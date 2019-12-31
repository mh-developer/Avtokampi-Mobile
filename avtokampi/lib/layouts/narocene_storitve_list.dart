import 'package:best_flutter_ui_templates/globals.dart' as globals;
import 'package:best_flutter_ui_templates/layouts/storitve_forma.dart';
import 'package:best_flutter_ui_templates/models/KampirnoMesto.dart';
import 'package:best_flutter_ui_templates/models/Storitev.dart';
import 'package:best_flutter_ui_templates/models/StoritevKampirnegaMesta.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
    runApp(NaroceneStoritveList());
}

// MyApp is a StatefulWidget. This allows updating the state of the
// widget when an item is removed.
class NaroceneStoritveList extends StatefulWidget {
    NaroceneStoritveList({Key key}) : super(key: key);

    @override
    _NaroceneStoritveList createState() {
        return _NaroceneStoritveList();
    }
}

class _NaroceneStoritveList extends State<NaroceneStoritveList> {
    final List<StoritevKampirnegaMesta> items = globals.storitveKampirnihMest;

    Storitev getStoritevById(int storitevId) {
        for (Storitev storitev in globals.storitve) {
            if (storitev.id == storitevId) {
                return storitev;
            }
        }
    }

    KampirnoMesto getKampirnoMestoById(int kampirnoMestoId) {
        for (KampirnoMesto kampirnoMesto in globals.kampirnaMesta) {
            if (kampirnoMesto.id == kampirnoMestoId) {
                return kampirnoMesto;
            }
        }
    }

    @override
    Widget build(BuildContext context) {
        final title = 'Naročene storitve';

        return MaterialApp(
            title: title,
            theme: ThemeData(
                primarySwatch: Colors.yellow,
            ),
            home: Scaffold(
                backgroundColor: Colors.black45,
                appBar: AppBar(
                    title: Text(title),
                ),
                body: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                        final StoritevKampirnegaMesta item = items[index];

                        return Dismissible(
                            // Each Dismissible must contain a Key. Keys allow Flutter to
                            // uniquely identify widgets.
                            key: Key(item.id.toString()),
                            // Provide a function that tells the app
                            // what to do after an item has been swiped away.
                            onDismissed: (direction) {
                                // Remove the item from the data source.
                                setState(() {
                                    items.removeAt(index);
                                });

                                // Then show a snackbar.
                                Scaffold.of(context)
                                    .showSnackBar(
                                    SnackBar(content: Text("$item dismissed")));
                            },
                            // Show a red background as the item is swiped away.
                            background: Container(color: Colors.red),
                            child: ListTile(title: Text(
                                getKampirnoMestoById(item.kampirnoMesto).naziv +
                                    " : " +
                                    getStoritevById(item.storitev).naziv,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),)),
                        );
                    },
                ),
                floatingActionButton: FloatingActionButton(
                    onPressed: () {
                        Navigator.push<dynamic>(
                            context,
                            MaterialPageRoute<
                                dynamic>(
                                builder: (BuildContext context) =>
                                    StoritveForm(),
                            ),
                        );
                    },
                    child: Icon(Icons.add_circle_outline, color: Colors.black,),
                    backgroundColor: Colors.white,
                ),
            ),
        );
    }
}