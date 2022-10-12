import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'lifestage.dart';
import 'const.dart';

void main() {
  runApp(new MaterialApp(
    home: new gender(),
  ));
}

class GroupModel {
  String text;

  int index;
  bool selected;

  GroupModel({required this.text, required this.index, required this.selected});
}

class gender extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<gender> {
  int _value2 = 0;
  List<GroupModel> _group = [
    GroupModel(text: "Woman", index: 1, selected: false),
    GroupModel(text: "Man", index: 2, selected: false),
    GroupModel(text: "Nonbinary", index: 3, selected: false),
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  fontWeight:
                      _group[i].selected ? FontWeight.bold : FontWeight.normal),
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
      //hit Ctrl+space in intellij to know what are the options you can use in flutter widgets
      body: new Stack(children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage(Images.orange),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: hPadding,
                child: Text(
                  "What's your gender?",
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
                  "add more about your gender if you'd",
                  style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: hPadding,
                child: Text(
                  "like. Learn what this means.",
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
                height: 200,
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
            ],
          ),
        ),
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
      .push(MaterialPageRoute(builder: (context) => lifestage()));
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
