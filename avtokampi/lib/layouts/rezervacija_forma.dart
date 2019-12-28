import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

    @override
    _ReservationFormState createState() => new _ReservationFormState();
}

class _ReservationFormState extends State<ReservationForm> {
    final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
    List<String> _colors = <String>['', 'red', 'green', 'blue', 'orange'];
    String _color = '';

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
                title: new Text("REZERVACIJA KAMPIRANJA"),
            ),
            body: new SafeArea(
                top: false,
                bottom: false,
                child: new Form(
                    key: _formKey,
                    autovalidate: true,
                    child: new ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        children: <Widget>[
                            new TextFormField(
                                decoration: const InputDecoration(
                                    icon: const Icon(Icons.person),
                                    hintText: 'Enter your first and last name',
                                    labelText: 'Name',
                                ),
                            ),
                            new TextFormField(
                                decoration: const InputDecoration(
                                    icon: const Icon(Icons.calendar_today),
                                    hintText: 'Enter your date of birth',
                                    labelText: 'Dob',
                                ),
                                keyboardType: TextInputType.datetime,
                            ),
                            new TextFormField(
                                decoration: const InputDecoration(
                                    icon: const Icon(Icons.phone),
                                    hintText: 'Enter a phone number',
                                    labelText: 'Phone',
                                ),
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                    WhitelistingTextInputFormatter.digitsOnly,
                                ],
                            ),
                            new TextFormField(
                                decoration: const InputDecoration(
                                    icon: const Icon(Icons.email),
                                    hintText: 'Enter a email address',
                                    labelText: 'Email',
                                ),
                                keyboardType: TextInputType.emailAddress,
                            ),
                            new FormField(
                                builder: (FormFieldState state) {
                                    return InputDecorator(
                                        decoration: InputDecoration(
                                            icon: const Icon(Icons.color_lens),
                                            labelText: 'Color',
                                        ),
                                        isEmpty: _color == '',
                                        child: new DropdownButtonHideUnderline(
                                            child: new DropdownButton(
                                                value: _color,
                                                isDense: true,
                                                onChanged: (String newValue) {
                                                    setState(() {
                                                        _color = newValue;
                                                        state.didChange(newValue);
                                                    });
                                                },
                                                items: _colors.map((String value) {
                                                    return new DropdownMenuItem(
                                                        value: value,
                                                        child: new Text(value),
                                                    );
                                                }).toList(),
                                            ),
                                        ),
                                    );
                                },
                            ),
                            new Container(
                                padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                                child: new RaisedButton(
                                    child: const Text('Submit'),
                                    onPressed: null,
                                )),
                        ],
                    ))),
        );
    }
}