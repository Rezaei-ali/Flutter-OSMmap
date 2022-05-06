import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(Mapsha());
}

class Mapsha extends StatelessWidget {
  const Mapsha({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('OSM map'),
        centerTitle: true,
      ),
      body: new FlutterMap(
        options: new MapOptions(
          center: new LatLng(32.652305093456484, 51.666758294359795),
          //minZoom: 6.0
        ),
        layers: [
          new TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
          new MarkerLayerOptions(markers: [
            new Marker(
                point: LatLng(32.652305093456484, 51.666758294359795),
                builder: (context) => new Container(
                      child: IconButton(
                        icon: Icon(
                          Icons.place_rounded,
                          color: Colors.red,
                          size: 45.0,
                        ),
                        onPressed: () {
                          print('Marker tapped');
                        },
                      ),
                    ))
          ])
        ],
      ),
    );
  }
}
