import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'const.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pfp.dart';

class addEmail extends StatefulWidget {
  const addEmail({super.key});

  @override
  State<addEmail> createState() => _addEmail();
}

class _addEmail extends State<addEmail> {
  bool _switchValue = true;

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
                "What's your email? ",
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
                "In case of account issues or changes to Village,",
                style: GoogleFonts.lato(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: hPadding,
              child: Text(
                "we will contact you by email. Your email ",
                style: GoogleFonts.lato(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: hPadding,
              child: Text(
                "will never be shared with anyone else. ",
                style: GoogleFonts.lato(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            // Transform.scale(
            //   scale: 0.8,
            //   child: CupertinoSwitch(
            //     value: _switchValue,
            //     onChanged: (bool value) {
            //       setState(() {
            //         _switchValue = value;
            //       });
            //     },
            //   ),
            // ),
            Padding(
              padding: hPadding,
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  focusColor: Colors.green,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 10,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                  fillColor: Color(0xFF192126),
                  filled: true,
                  hintStyle: GoogleFonts.lato(
                      fontSize: 14, color: Color.fromARGB(255, 231, 231, 236)),
                  hintText: 'example@gmail.com',
                ),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                    return "Enter valid Email address";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: hPadding,
              child: Text(
                "Marketing communications ",
                style: GoogleFonts.lato(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),

            SizedBox(
              height: 4,
            ),

            Row(
              children: [
                Padding(
                  padding: hPadding,
                  child: Text(
                    "Would you like to receive the village Newsletter?",
                    style: GoogleFonts.lato(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                    value: _switchValue,
                    onChanged: (bool value) {
                      setState(() {
                        _switchValue = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 150,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 70),
              child: ElevatedButton(
                onPressed: () {
                  _navigateToNextScreen(context);
                },
                child: Text(
                  'Continue',
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
          ]),
        )
      ]),
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => pfp()));
  }
}
