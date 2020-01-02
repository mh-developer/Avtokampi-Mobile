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
            home: AvtokampMap(),
        );
    }
}

class AvtokampMap extends StatefulWidget {
    AvtokampMap({Key key, @required this.a}) : super(key: key);

    final String title = "ZEMLJEVID KAMPA";
    final Avtokamp a;

    @override
    _AvtokampMapState createState() => _AvtokampMapState(a);
}

class _AvtokampMapState extends State<AvtokampMap> {
    LatLng latlng = LatLng(
        45.815399, 15.966568
    );
    Iterable markers = [];
    Avtokamp avtokamp;

    _AvtokampMapState(this.avtokamp);

    @override
    void initState() {
        super.initState();

        getData();
    }

    getData() async {
        try {
            BitmapDescriptor myIcon;
            await BitmapDescriptor.fromAssetImage(
                ImageConfiguration(size: Size(12, 12)),
                'assets/images/ikona.png')
                .then((onValue) {
                myIcon = onValue;
            });
            List<Marker> _markers = [];
            LatLng latLngMarker = LatLng(
                45.815399, 15.966568
            );
            try {
                latLngMarker = LatLng(
                    double.parse(avtokamp.koordinataX.toString()),
                    double.parse(avtokamp.koordinataY.toString()));
            } catch (e) {
                print(e.toString());
            }
            _markers.add(Marker(
                markerId: MarkerId("marker${avtokamp.id}"),
                position: latLngMarker,
                icon: myIcon,
                infoWindow: InfoWindow(
                    title: avtokamp.naziv.toString(),
                ),));
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
                mapType: MapType.normal,
                onMapCreated: (GoogleMapController controller) {},
            ),
        );
    }
}