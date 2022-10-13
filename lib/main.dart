import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'locationser.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/makefirstmove.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("assets/bumble.png"),
                      ),
                      Text(
                        'bumble',
                        style: GoogleFonts.lato(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Make the',
                style: GoogleFonts.lato(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
              // SizedBox(
              //   height: 1,
              // ),
              Text(
                'First Move',
                style: GoogleFonts.lato(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
              SizedBox(
                height: 90,
              ),
              SignInButton(
                Buttons.FacebookNew,
                onPressed: () {
                  _navigateToNextScreen(context);
                  Text('FacebookNew');
                },
              ),
              SizedBox(
                height: 10,
              ),
              SignInButtonBuilder(
                text: 'Use mobile number',
                onPressed: () {
                  _navigateToNextScreen(context);
                  Text('Mobile number');
                },
                backgroundColor: Colors.blueGrey[700]!,
                width: 220.0,
              ),
              SizedBox(
                height: 10,
              ),
              SignInButtonBuilder(
                text: 'Get going with Email',
                icon: Icons.email,
                onPressed: () {
                  _navigateToNextScreen(
                    context,
                  );
                },
                backgroundColor: Colors.blueGrey[700]!,
                width: 220.0,
              ),

              Text('By signing up you agree to our Terms, See how',
                  style: GoogleFonts.lato(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),

              Text('use your data in our Privacy Policy,',
                  style: GoogleFonts.lato(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),

              Text('We never post to Facebook.',
                  style: GoogleFonts.lato(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)),
            ],
          ),
        ),
      ]),
    );
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => locationser()));
  }
}
