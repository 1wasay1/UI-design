import 'package:flutter/material.dart';
import 'const.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'addEmail.dart';

class lifestage extends StatefulWidget {
  const lifestage({super.key});

  @override
  State<lifestage> createState() => _lifestage();
}

class _lifestage extends State<lifestage> {
  @override
  void initState() {
    super.initState();
  }

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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: hPadding,
              child: Text(
                "What's your first name?",
                style: GoogleFonts.lato(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: hPadding,
              child: Text(
                'And your Birthday?',
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
                "You won't be able to change this later.",
                style: GoogleFonts.lato(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 280,
            ),
            Padding(
              padding: EdgeInsets.only(left: 32),
              child: Text(
                "👁 This will be shown on your profile",
                style: GoogleFonts.lato(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
          ]),
        )
      ]),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          _navigateToNextScreen(context);
        },
        child: Icon(
            color: Color.fromARGB(255, 210, 139, 52), Icons.arrow_forward_ios),
        backgroundColor: Color.fromARGB(255, 67, 40, 4), //<-- SEE HERE
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => addEmail()));
  }
}
