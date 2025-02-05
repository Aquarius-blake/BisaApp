
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {

late GoogleMapController mapController;

LatLng pos = LatLng(0.2, 5.2);
late StreamSubscription<Position> positionStream;
List<Marker> _markers=[];
  bool _showmaps=false;
  final LocationSettings locationSettings = LocationSettings(
  accuracy: LocationAccuracy.bestForNavigation,
  distanceFilter: 0,
);



   void _onMapCreated(GoogleMapController controller) {
  mapController = controller;
  
}

initialize()async{
  LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
    }else{
      print("Here 2");
     positionStream = Geolocator.getPositionStream(locationSettings: locationSettings).listen(
    (Position? position) {
      print("Here");
       _markers.add(
      Marker(
        markerId: const MarkerId('mylocaton'),
        position: LatLng(position!.latitude, position.longitude),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan)
        )
        );
        print(position == null ? 'Unknown' : '${position.latitude.toString()}, ${position.longitude.toString()}');
    },
    onError: (error){
      print("err "+error.toString());
    },
    onDone: (){
      print("Done ");
    }
    );

    }
}


@override
  void initState() {
    //initialize();
    
     _markers.add(
      Marker(
        markerId: const MarkerId('mylocaton'),
        // position: LatLng(, currentpos!.longitude),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan)
        )
        );
    if(_markers.isNotEmpty){
      setState(() {
        _showmaps=true;
      });
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    initialize();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("${pos.latitude.toStringAsFixed(5)},${pos.longitude.toStringAsFixed(5)}"),
      ),
      body: Container(
        child: GoogleMap(
                mapType: MapType.normal,
                markers: Set<Marker>.of(_markers),
                onTap: (argument) {
                  setState(() {
                    pos = argument;
                    _markers.add(
                      Marker(
                        markerId: const MarkerId('newlocaton'),
                        position: argument,
                        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen)
                        )
                        );
                  });
                  // widget.callback!(argument);
                },
                onMapCreated: (controller) {
                  setState(() {
                    mapController=controller;
                  });
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(0.2,5.3),
                  zoom: 15,
                  )
                  ),
      ),
    );
  }
}