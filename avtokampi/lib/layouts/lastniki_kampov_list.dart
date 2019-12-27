import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
            home: LatnikiKampovList(),
        );
    }
}

class LatnikiKampovList extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Flutter Slidable Demo'),
            ),
            body: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                    return Slidable(
                        key: ValueKey(index),
                        actionPane: SlidableDrawerActionPane(),
                        actions: <Widget>[
                            IconSlideAction(
                                caption: 'Mesta',
                                color: Colors.green,
                                icon: Icons.archive,
                            ),
                            IconSlideAction(
                                caption: 'Storitve',
                                color: Colors.blue,
                                icon: Icons.share,
                            ),
                        ],
                        secondaryActions: <Widget>[
                            IconSlideAction(
                                caption: 'Popravi',
                                color: Colors.yellow,
                                icon: Icons.more_horiz,
                            ),
                            IconSlideAction(
                                caption: 'Izbriši',
                                color: Colors.red,
                                icon: Icons.delete,
                            ),
                        ],
                        dismissal: SlidableDismissal(
                            child: SlidableDrawerDismissal(),
                        ),
                        child: ListTile(
                            title: Text('$index'),
                        ),
                    );
                },
            ),
        );
    }
}