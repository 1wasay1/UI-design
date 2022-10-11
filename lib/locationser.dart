import 'package:bumble/privacyscreen.dart';
import 'package:flutter/material.dart';
import 'const.dart';
import 'package:google_fonts/google_fonts.dart';
import 'privacyscreen.dart';

class locationser extends StatefulWidget {
  const locationser({super.key});

  @override
  State<locationser> createState() => _locationserState();
}

class _locationserState extends State<locationser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Stack(children: <Widget>[
      new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage(Images.orange),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          Padding(
            padding: hPadding,
            child: ElevatedButton(
              onPressed: () {
                _navigateToNextScreen(context);
              },
              child: Text(
                'Set location services',
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(40), // NEW

                backgroundColor: Color.fromARGB(255, 42, 38, 38),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  // <-- Radius
                ),
              ),
            ),
          ),
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
}
