import 'package:flutter/material.dart';
import 'const.dart';
import 'package:google_fonts/google_fonts.dart';

class tobekind extends StatefulWidget {
  const tobekind({super.key});

  @override
  State<tobekind> createState() => _tobekind();
}

class _tobekind extends State<tobekind> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgmyColor,
        body: new Stack(children: <Widget>[
          new Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 80,
              ),
              Center(
                child: Text(
                  "It's cool",
                  style: GoogleFonts.lato(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ),
              Center(
                child: Text(
                  "to be kind",
                  style: GoogleFonts.lato(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: hPadding,
                child: Text(
                  "Welcome! We're are excited to be a part",
                  style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: myColor),
                ),
              ),
              Padding(
                padding: hPadding,
                child: Text(
                  'of your dating journey.',
                  style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: myColor),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: hPadding,
                child: Text(
                  'Here we treat everyone with kindness',
                  style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: myColor),
                ),
              ),
              Padding(
                padding: hPadding,
                child: Text(
                  'and respect no matter their race,',
                  style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: myColor),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: hPadding,
                child: Text(
                  'religion, ethinicity, nationality, skin colour,',
                  style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: myColor),
                ),
              ),
              Padding(
                padding: hPadding,
                child: Text(
                  'ability, size, sex, gender, identity, or',
                  style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: myColor),
                ),
              ),
              Padding(
                padding: hPadding,
                child: Text(
                  'sexual orientation',
                  style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: myColor),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: hPadding,
                child: Text(
                  'In our mission to actively keep bumble',
                  style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: myColor),
                ),
              ),
              Padding(
                padding: hPadding,
                child: Text(
                  'safe and inclusive, we ask you to join us',
                  style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: myColor),
                ),
              ),
              Padding(
                padding: hPadding,
                child: Text(
                  'by adhering to our guidelines',
                  style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: myColor),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: hPadding,
                child: Text(
                  "And remember. We've always got",
                  style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: myColor),
                ),
              ),
              Padding(
                padding: hPadding,
                child: Text(
                  'your back!',
                  style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: myColor),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: hPadding,
                child: Text(
                  'With love, the Bumble team',
                  style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: myColor),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: hPadding,
                child: ElevatedButton(
                  onPressed: () {
                    // _navigateToNextScreen(context);
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
            ]),
          )
        ]));
  }

  // void _navigateToNextScreen(BuildContext context) {
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => fnBirth()));
  // }
}
