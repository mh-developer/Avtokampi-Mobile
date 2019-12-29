import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:best_flutter_ui_templates/globals.dart' as globals;

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

Color getColor(int index) {
    if (index % 4 == 0)
        return Colors.brown;
    if (index % 3 == 0)
        return Colors.green;
    if (index % 2 == 0)
        return Colors.blue;
    return Colors.red;
}

class LastnikiKampovList extends StatelessWidget {
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
                                subtitle: new Text(globals.avtokampi[index].nazivLokacije),
                            ),
                        ), onTap: () {

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
                            ),
                            IconSlideAction(
                                caption: 'Izbriši',
                                color: Colors.red,
                                icon: Icons.delete,
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