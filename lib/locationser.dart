import 'dart:async';

import 'package:bumble/privacyscreen.dart';
import 'package:flutter/material.dart';
import 'const.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class locationser extends StatefulWidget {
  const locationser({super.key});

  @override
  State<locationser> createState() => _locationserState();
}

class _locationserState extends State<locationser> {
  double? lat;

  double? long;

  String address = "";

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  getLatLong() {
    Future<Position> data = _determinePosition();
    data.then((value) {
      print("value $value");
      setState(() {
        lat = value.latitude;
        long = value.longitude;
      });

      // getAddress(value.latitude, value.longitude);
    }).catchError((error) {
      print("Error $error");
    });
  }

  getAddress(lat, long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    setState(() {
      address = placemarks[0].street! + " " + placemarks[0].country!;
    });

    for (int i = 0; i < placemarks.length; i++) {
      print("INDEX $i ${placemarks[i]}");
    }
  }

  // StreamSubscription<Position>? positionStream;

  // @override
  // void dispose() {
  //   super.dispose();

  //   /// don't forget to cancel stream once no longer needed
  //   positionStream?.cancel();
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   listenToLocationChanges();
  // }

  // @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 36, 34, 34),
        body: new Stack(children: <Widget>[
          new Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: hPadding,
                child: CircleAvatar(
                  backgroundImage: AssetImage('signused.png'),
                  radius: 24,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: hPadding,
                child: Text(
                  'Set your Location',
                  style: GoogleFonts.lato(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: hPadding,
                child: Text(
                  'services',
                  style: GoogleFonts.lato(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Padding(
                padding: hPadding,
                child: Text(
                  'We use your location to show you',
                  style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: hPadding,
                child: Text(
                  'Potenatial matches in your area.',
                  style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Text("Lat : $lat"),
              Text("Long : $long"),
              Text("Address : $address "),
              ElevatedButton(
                onPressed: getLatLong,
                child: const Text("Get Location"),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF0D39F2),
                ),
              ),
              // Padding(
              //   padding: hPadding,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       _determinePosition;
              //       getUserLocation();
              //       _navigateToNextScreen(context);
              //     },
              //     child: Text(
              //       'Set location services',
              //     ),
              //     style: ElevatedButton.styleFrom(
              //       minimumSize: const Size.fromHeight(40), // NEW

              //       backgroundColor: Color.fromARGB(255, 42, 38, 38),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(50),
              //         // <-- Radius
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 20.0,
              // ),
              // Padding(
              //   padding: hPadding,
              //   child: Text(
              //     currentPosition != null ? '$currentPosition' : '----',
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: TextButton(
                    onPressed: () {
                      _navigateToNextScreen(context);
                    },
                    child: Text(
                      "Not now",
                      style: GoogleFonts.lato(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
              )
            ]),
          )
        ]));
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => privacyScreen()));
  }

  // void _determinePosition() async {
  //   // Test if location services are enabled.
  //   bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     // Location services are not enabled don't continue
  //     // accessing the position and request users of the
  //     // App to enable the location services.
  //     print('Location services are disabled.');
  //     return;
  //   }

  //   LocationPermission permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       // Permissions are denied, next time you could try
  //       // requesting permissions again (this is also where
  //       // Android's shouldShowRequestPermissionRationale
  //       // returned true. According to Android guidelines
  //       // your App should show an explanatory UI now.
  //       print('Location permissions are denied');
  //       return;
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     // Permissions are denied forever, handle appropriately.
  //     print(
  //         'Location permissions are permanently denied, we cannot request permissions.');

  //     /// open app settings so that user changes permissions
  //     // await Geolocator.openAppSettings();
  //     // await Geolocator.openLocationSettings();

  //     return;
  //   }

  //   // When we reach here, permissions are granted and we can
  //   // continue accessing the position of the device.
  //   Position position = await Geolocator.getCurrentPosition();
  //   print("Current Position $position");
  //   setState(() {
  //     currentPosition = position;
  //   });
  // }

  // void getLastKnownPosition() async {
  //   Position? position = await Geolocator.getLastKnownPosition();
  // }

  // void listenToLocationChanges() {
  //   final LocationSettings locationSettings = LocationSettings(
  //     accuracy: LocationAccuracy.high,
  //     distanceFilter: 100,
  //   );
  //   positionStream =
  //       Geolocator.getPositionStream(locationSettings: locationSettings).listen(
  //     (Position? position) {
  //       print(position == null ? 'Unknown' : '$position');
  //       setState(() {
  //         currentPosition = position;
  //       });
  //     },
  //   );
  // }

  // getUserLocation() async {
  //   var currentPostion;
  //   List<Placemark> placemarks = await placemarkFromCoordinates(
  //       currentPostion.latitude, currentPostion.longitude);
  //   Placemark place = placemarks[0];
  //   print(place);
  // }

  // void calculateDistance() {
  //   /// startLatitude, startLongitude, endLatitude, endLongitude
  //   double distanceInMeters = Geolocator.distanceBetween(
  //       52.2165157, 6.9437819, 52.3546274, 4.8285838);
  // }
}
