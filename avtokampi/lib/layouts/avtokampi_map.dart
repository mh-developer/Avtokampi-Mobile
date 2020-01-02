import 'package:avtokampi/globals.dart' as globals;
import 'package:avtokampi/models/Avtokamp.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
                primarySwatch: Colors.blue,
            ),
            home: AvtokampiMap(),
        );
    }
}

class AvtokampiMap extends StatefulWidget {
    AvtokampiMap({Key key}) : super(key: key);

    final String title = "ZEMLJEVID AVTOKAMPOV";

    @override
    _AvtokampiMapState createState() => _AvtokampiMapState();
}

class _AvtokampiMapState extends State<AvtokampiMap> {
    LatLng latlng = LatLng(
        45.815399, 15.966568
    );
    Iterable markers = [];

    @override
    void initState() {
        super.initState();

        getData();
    }

    getData() async {
        try {
            List<Marker> _markers = [];
            for (Avtokamp a in globals.avtokampi) {
                LatLng latLngMarker = LatLng(
                    45.815399, 15.966568
                );
                try {
                    latLngMarker = LatLng(
                        double.parse(a.koordinataX.toString()),
                        double.parse(a.koordinataY.toString()));
                } catch (e) {
                    print(e.toString());
                }
                _markers.add(Marker(
                    markerId: MarkerId("marker${a.id}"),
                    position: latLngMarker,
                    infoWindow: InfoWindow(
                        title: a.naziv.toString(),
                    ),));
            }
            print(markers);
            setState(() {
                markers = _markers;
            });
        } catch (e) {
            print(e.toString());
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(widget.title),
            ),
            body: GoogleMap(
                markers: Set.from(
                    markers,
                ),
                initialCameraPosition: CameraPosition(
                    target: latlng, zoom: 5.0),
                mapType: MapType.hybrid,
                onMapCreated: (GoogleMapController controller) {},
            ),
        );
    }
}