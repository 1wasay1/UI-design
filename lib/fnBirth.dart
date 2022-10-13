import 'package:flutter/material.dart';
import 'const.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'addEmail.dart';
import 'package:steps_indicator/steps_indicator.dart';

class fnBirth extends StatefulWidget {
  const fnBirth({super.key});

  @override
  State<fnBirth> createState() => _fnBirth();
}

class _fnBirth extends State<fnBirth> {
  int selectedStep = 0;
  int nbSteps = 5;
  TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgmyColor,
      body: new Stack(children: <Widget>[
        new Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  hintText: 'Add your first name',
                ),
                validator: (value) {
                  if (value!.isEmpty && value.length > 5 ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    //allow upper and lower case alphabets and space
                    return "Enter Correct Name";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.only(left: 24, right: 64),
              child: TextField(
                controller: dateinput, //editing controller of this TextField
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0)), //<-- SEE HERE
                    ),
                    focusColor: Colors.green,
                    icon: Icon(Icons.calendar_today), //icon of text field
                    labelText: "Enter your Birthday" //label text of field
                    ),
                readOnly:
                    true, //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      builder: ((context, child) => Theme(
                            child: child!,
                            data: ThemeData().copyWith(
                                colorScheme: ColorScheme.dark(
                                    primary: Color.fromARGB(255, 34, 33, 33),
                                    onPrimary:
                                        Color.fromARGB(255, 185, 184, 183),
                                    surface: Color.fromARGB(255, 58, 62, 63),
                                    onSurface:
                                        Color.fromARGB(255, 255, 255, 255)),
                                dialogBackgroundColor:
                                    Color.fromARGB(255, 129, 126, 119)),
                          )),
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(
                          2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    //you can implement different kind of Date Format here according to your requirement

                    setState(() {
                      dateinput.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
              ),
            ),
            SizedBox(
              height: 250,
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
