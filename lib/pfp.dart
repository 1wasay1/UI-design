import 'package:bumble/gender.dart';
import 'package:flutter/material.dart';
import 'const.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'gender.dart';
import 'package:steps_indicator/steps_indicator.dart';

class pfp extends StatefulWidget {
  const pfp({super.key});

  @override
  State<pfp> createState() => _pfp();
}

class _pfp extends State<pfp> {
  int selectedStep = 2;
  int nbSteps = 5;
  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  bool _switchValue = true;

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
                StepsIndicatorCustomLine(nbStep: 4, length: 20)
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
                "Upload your profile photo ",
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
                "Take a new photo or upload from your library to",
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
                "set your profile photo",
                style: GoogleFonts.lato(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 50,
            ),

            SizedBox(
              height: 70,
            ),
            imageProfile(),
            // SizedBox(
            //   height: 80,
            // ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: hPadding,
              child: ElevatedButton(
                onPressed: () {
                  _navigateToNextScreen(context);
                },
                child: Text(
                  'Next',
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40), // NEW

                  backgroundColor: Color(0xFF192126),
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

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80,
          backgroundColor: Colors.white,
          // backgroundImage:
          //       _imageFile == null ? null : FileImage(File(_imageFile!.path)),
          // ),
          backgroundImage: _imageFile == null
              ? AssetImage("assets/darkbg.png")
              : FileImage(File(_imageFile!.path)) as ImageProvider,
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.teal,
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            TextButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile!;
    });
  }

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => gender()));
  }
}
  //          imageFile == null
            //               ? Container(
            //             alignment: Alignment.center,
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: <Widget>[
            //                 RaisedButton(
            //                   color: Colors.greenAccent,
            //                   onPressed: () {
            //                     _getFromGallery();
            //                   },
            //                   child: Text("PICK FROM GALLERY"),
            //                 ),
            //                 Container(
            //                   height: 40.0,
            //                 ),
            //                 RaisedButton(
            //                   color: Colors.lightGreenAccent,
            //                   onPressed: () {
            //                     _getFromCamera();
            //                   },
            //                   child: Text("PICK FROM CAMERA"),
            //                 )
            //               ],
            //             ),
            //           ): Container(
            //             child: Image.file(
            //               imageFile,
            //               fit: BoxFit.cover,
            //             ),

            // /// Get from gallery
            // _getFromGallery() async {
            //   PickedFile? pickedFile = await ImagePicker().getImage(
            //     source: ImageSource.gallery,
            //     maxWidth: 1800,
            //     maxHeight: 1800,
            //   );
            //   if (pickedFile != null) {
            //     setState(() {
            //       imageFile = File(pickedFile.path);
            //     });
            //   }
            // }

            // /// Get from Camera
            // _getFromCamera() async {
            //   PickedFile? pickedFile = await ImagePicker().getImage(
            //     source: ImageSource.camera,
            //     maxWidth: 1800,
            //     maxHeight: 1800,
            //   );
            //   if (pickedFile != null) {
            //     setState(() {
            //       imageFile = File(pickedFile.path);

            //           SizedBox(
            //             height: 20,
            //           ),

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