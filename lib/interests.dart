import 'package:bumble/const.dart';
import 'package:bumble/tobekind.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tobekind.dart';
import 'package:steps_indicator/steps_indicator.dart';

void main() => runApp(interests());

class interests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      home: Ichipex(),
    );
  }
}

class Ichipex extends StatefulWidget {
  @override
  IchipexState createState() => new IchipexState();
}

class IchipexState extends State<Ichipex> with TickerProviderStateMixin {
  int selectedStep = 5;
  int nbSteps = 5;

  List<String> _options = [
    'Art',
    'Design',
    'Makeup',
    'Writing',
    'running',
    'music',
    ' sports'
  ];
  List<bool> _selected = [false, false, false, false, false, false, false];

  Widget _buildChips() {
    List<Widget> chips = [];

    for (int i = 0; i < _options.length; i++) {
      FilterChip filterChip = FilterChip(
        selected: _selected[i],
        label: Text(_options[i], style: TextStyle(color: Colors.white)),
        elevation: 10,
        pressElevation: 5,
        shadowColor: Colors.teal,
        backgroundColor: Colors.black54,
        selectedColor: Color.fromARGB(255, 208, 145, 18),
        onSelected: (bool selected) {
          setState(() {
            _selected[i] = selected;
          });
        },
      );

      chips.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: 10), child: filterChip));
    }

    return Container(
        // Thivhs next line does the trick.
        child: Wrap(
      spacing: 10,
      runSpacing: 10,
      runAlignment: WrapAlignment.spaceEvenly,
      children: chips,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgmyColor,
        body: new Stack(children: <Widget>[
          new Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                StepsIndicator(
                  selectedStep: selectedStep,
                  nbSteps: nbSteps,
                  doneLineColor: Color.fromARGB(255, 23, 23, 23),
                  doneStepColor: Color.fromARGB(255, 0, 0, 0),
                  undoneLineColor: Color.fromARGB(255, 78, 76, 76),
                  unselectedStepColorIn: Color.fromARGB(255, 78, 76, 76),
                  unselectedStepColorOut: Color.fromARGB(255, 78, 76, 76),
                  selectedStepColorIn: Color.fromARGB(255, 23, 23, 23),
                  selectedStepColorOut: Color.fromARGB(255, 23, 23, 23),
                  lineLength: 20,
                  doneLineThickness: 3,
                  undoneLineThickness: 1,
                  lineLengthCustomStep: [
                    StepsIndicatorCustomLine(nbStep: 4, length: 105)
                  ],
                  enableLineAnimation: true,
                  enableStepAnimation: true,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[],
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: hPadding,
                  child: Text(
                    "Your interests?",
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
                    'Pick what describes you. Then',
                    style: GoogleFonts.lato(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: hPadding,
                  child: Text(
                    "Pick upto five things you like,It'll help  ",
                    style: GoogleFonts.lato(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: hPadding,
                  child: Text(
                    "It'll help you match with people who love them ",
                    style: GoogleFonts.lato(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: hPadding,
                  child: Text(
                    "too.",
                    style: GoogleFonts.lato(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    "Creativity.",
                    style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Container(
                    height: 30,
                    child: _buildChips(),
                  ),
                ),
                SizedBox(
                  height: 250,
                ),
                TextButton(
                    onPressed: () {
                      // _navigateToNextScreen(context);
                    },
                    child: Text(
                      "Skip",
                      style: GoogleFonts.lato(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
              ],
            ),
          )
        ]),
        floatingActionButton: FloatingActionButton.small(
          onPressed: () {
            _navigateToNextScreen(context);
          },
          child: Icon(
              color: Color.fromARGB(255, 210, 139, 52),
              Icons.arrow_forward_ios),
          backgroundColor: Color.fromARGB(255, 67, 40, 4), //<-- SEE HERE
        ));
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => tobekind()));
  }
}
