import 'package:bumble/interests.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'const.dart';
import 'interests.dart';
import 'package:steps_indicator/steps_indicator.dart';

void main() {
  runApp(new MaterialApp(
    home: new lifestage(),
  ));
}

class GroupModel {
  String text;

  int index;
  bool selected;

  GroupModel({required this.text, required this.index, required this.selected});
}

class lifestage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<lifestage> {
  int selectedStep = 4;
  int nbSteps = 5;

  int _value2 = 0;
  List<GroupModel> _group = [
    GroupModel(text: "Engineer", index: 1, selected: false),
    GroupModel(text: "Founder", index: 2, selected: false),
    GroupModel(text: "Angel investor/VC", index: 3, selected: false),
  ];

  List<RadioModel> sampleData = <RadioModel>[];

  Widget makeRadioTiles() {
    List<Widget> list = <Widget>[];

    for (int i = 0; i < _group.length; i++) {
      list.add(Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 32),
        decoration: BoxDecoration(
            color: _group[i].selected
                ? Color.fromARGB(255, 133, 86, 49)
                : Color.fromARGB(255, 145, 145, 145),
            borderRadius: BorderRadius.all(
                Radius.circular(10.0) //         <--- border radius here
                )),
        child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start
            // ,
            children: [
              RadioListTile(
                value: _group[i].index,
                groupValue: _value2,
                selected: _group[i].selected,
                onChanged: (val) {
                  setState(() {
                    for (int i = 0; i < _group.length; i++) {
                      _group[i].selected = false;
                    }
                    _value2 = val!;
                    _group[i].selected = true;
                  });
                },
                activeColor: Colors.white,
                controlAffinity: ListTileControlAffinity.trailing,
                title: Text(
                  ' ${_group[i].text}',
                  style: TextStyle(
                      color: _group[i].selected ? Colors.white : Colors.black,
                      fontWeight: _group[i].selected
                          ? FontWeight.bold
                          : FontWeight.normal),
                ),
              )
            ]),
      ));
    }

    Column column = Column(
      children: list,
    );
    return column;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgmyColor,
      //hit Ctrl+space in intellij to know what are the options you can use in flutter widgets
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
              Padding(
                padding: hPadding,
                child: Text(
                  "Your Lifestage",
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
                  'Let us know more about yourself so we can ',
                  style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: hPadding,
                child: Text(
                  "provide you with more matches.",
                  style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: hPadding,
                child: Text(
                  "Select all that apply.",
                  style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              makeRadioTiles(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
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
                        fontSize: 14,
                        color: Color.fromARGB(255, 231, 231, 236)),
                    hintText: 'Other',
                  ),
                  onChanged: (value) {
                    setState(() {
                      if (value.isNotEmpty) {
                        for (var g in _group) {
                          g.selected = false;
                          _value2 = 0;
                          // activeColor:
                          // Colors.transparent;
                        }
                      }
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty && value.length > 5 ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      //allow upper and lower case alphabets and space
                      return "Enter Correct Lifestage";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(
                height: 140,
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
            ],
          ),
        ),
      ]),
      // floatingActionButton: FloatingActionButton.small(
      //   onPressed: () {
      //     // _navigateToNextScreen(context);
      //   },
      // child: Icon(
      //     color: Color.fromARGB(255, 210, 139, 52), Icons.arrow_forward_ios),
      // backgroundColor: Color.fromARGB(255, 67, 40, 4), //<-- SEE HERE
      // ),
    );
  }
}

// ignore: must_be_immutable
class CustomRadio extends StatefulWidget {
  List<RadioModel> sampleData = <RadioModel>[];

  CustomRadio(this.sampleData);

  @override
  createState() {
    return CustomRadioState(sampleData);
  }
}

class CustomRadioState extends State<CustomRadio> {
  List<RadioModel> sampleData = <RadioModel>[];

  CustomRadioState(this.sampleData);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sampleData.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          //highlightColor: Colors.red,
          splashColor: Colors.blueAccent,
          onTap: () {
            setState(() {
              sampleData.forEach((element) => element.isSelected = false);
              sampleData[index].isSelected = true;
            });
          },
          child: RadioItem(sampleData[index]),
        );
      },
    );
  }
}

void _navigateToNextScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => interests()));
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;

  RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return Container();
    // return Container(
    //     margin: EdgeInsets.all(5.0),
    //     child: Row(
    //       mainAxisSize: MainAxisSize.max,
    //       children: <Widget>[
    //         Container(
    //           height: 50.0,
    //           width: 50.0,
    //           child: Icon(
    //             _item.icon,
    //             color:
    //                 _item.isSelected ? _item.selectedColor : _item.defaultColor,
    //           ),
    //         ),
    //         Container(
    //           margin: EdgeInsets.only(left: 10.0),
    //           child: Text(
    //             _item.text,
    //             style: TextStyle(
    //               fontSize: 20.0,
    //               fontWeight:
    //                   _item.isSelected ? FontWeight.bold : FontWeight.normal,
    //               color: _item.isSelected
    //                   ? _item.selectedColor
    //                   : _item.defaultColor,
    //             ),
    //           ),
    //         ),
    //       ],
    //     ));
  }
}

class RadioModel {
  bool isSelected;
  final IconData icon;
  final String text;
  final Color selectedColor;
  final Color defaultColor;

  RadioModel(this.isSelected, this.icon, this.text, this.selectedColor,
      this.defaultColor);
}
