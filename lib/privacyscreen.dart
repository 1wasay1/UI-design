import 'package:bumble/fnBirth.dart';
import 'package:flutter/material.dart';
import 'const.dart';
import 'package:google_fonts/google_fonts.dart';

class privacyScreen extends StatefulWidget {
  const privacyScreen({super.key});

  @override
  State<privacyScreen> createState() => _privacyScreen();
}

class _privacyScreen extends State<privacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Stack(children: <Widget>[
      new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage(Images.darkb),
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
              backgroundImage: AssetImage('lockk.png'),
              radius: 35,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: hPadding,
            child: Text(
              'We care about your',
              style: GoogleFonts.lato(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: hPadding,
            child: Text(
              'privacy',
              style: GoogleFonts.lato(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Padding(
            padding: hPadding,
            child: Text(
              'Along with our partners we store and',
              style: GoogleFonts.lato(
                  fontSize: 12, fontWeight: FontWeight.w600, color: myColor),
            ),
          ),
          Padding(
            padding: hPadding,
            child: Text(
              'process info from your device to provide',
              style: GoogleFonts.lato(
                  fontSize: 12, fontWeight: FontWeight.w600, color: myColor),
            ),
          ),
          Padding(
            padding: hPadding,
            child: Text(
              'features in the app and improve',
              style: GoogleFonts.lato(
                  fontSize: 12, fontWeight: FontWeight.w600, color: myColor),
            ),
          ),
          Padding(
            padding: hPadding,
            child: Text(
              'marketing campaigns.',
              style: GoogleFonts.lato(
                  fontSize: 12, fontWeight: FontWeight.w600, color: myColor),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: hPadding,
            child: Text(
              'You can always make changes or opt out',
              style: GoogleFonts.lato(
                  fontSize: 12, fontWeight: FontWeight.w600, color: myColor),
            ),
          ),
          Padding(
            padding: hPadding,
            child: Text(
              'in your privacy settins. Finf out more in',
              style: GoogleFonts.lato(
                  fontSize: 12, fontWeight: FontWeight.w600, color: myColor),
            ),
          ),
          Padding(
            padding: hPadding,
            child: Text(
              'our privacy policy',
              style: GoogleFonts.lato(
                  fontSize: 12, fontWeight: FontWeight.w600, color: myColor),
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
                'Accept',
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(40), // NEW

                backgroundColor: Color.fromARGB(255, 132, 78, 12),
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
                  "Change or reject",
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
        .push(MaterialPageRoute(builder: (context) => fnBirth()));
  }
}
