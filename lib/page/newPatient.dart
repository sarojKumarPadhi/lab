import 'package:audioplayers/audioplayers.dart' as audio;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jonk_lab/global/color.dart';
import 'package:jonk_lab/global/globalData.dart';
import 'package:jonk_lab/model/test_menu_model.dart';
import 'package:jonk_lab/page/patientLocationPage.dart';
import 'package:jonk_lab/page/searchRiderPage.dart';
import 'package:record/record.dart';
import '../controller/test_menu_controller.dart';

class NewPatient extends StatefulWidget {
  const NewPatient({Key? key}) : super(key: key);
  static String? patientName;
  static String? mobileNumber;
  static String? age;
  static List<String>? tests;
  static String? patientLocation;
  static LatLng? latLng;
  @override
  State<NewPatient> createState() => _NewPatientState();
}
class _NewPatientState extends State<NewPatient>
    with SingleTickerProviderStateMixin {
  String audioPath = "";
  late Record audioRecord;
  late AudioPlayer audioPlayer;
  bool isRecording = false;
  late AnimationController _controller;
  final nameTextEditing = TextEditingController();
  final mobileTextEditing = TextEditingController();
  final priceController = TextEditingController();
  final ageTextEditing = TextEditingController();
  TestMenuController testMenuController = Get.find();
  @override
  void initState() {
    print("this is a test menu");
    print(testMenuController.testMenuList.length.toString());
    audioPlayer = AudioPlayer();
    audioRecord = Record();
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    NewPatient.patientName != null
        ? nameTextEditing.text = NewPatient.patientName!
        : "";
    NewPatient.mobileNumber != null
        ? mobileTextEditing.text = NewPatient.mobileNumber!
        : "";
    NewPatient.age != null ? ageTextEditing.text = NewPatient.age! : "";
  }
  @override
  void dispose() {
    audioRecord.dispose();
    audioPlayer.dispose();
    super.dispose();
  }
  Future<void> startRecording() async {
    try {
      if (await audioRecord.hasPermission()) {
        await audioRecord.start();
        setState(() {
          isRecording = true;
        });
      }
    } catch (e) {
      print(e);
    }
  }
  Future<void> stopRecording() async {
    try {
      String? path = await audioRecord.stop();
      setState(() {
        isRecording = false;
        audioPath = path!;
      });
      // await uploadAudioToFirebaseStorage();
    } catch (e) {
      print(e);
    }
  }

  Future<void> playRecording() async {
    try {
      audio.Source urlSource = UrlSource(audioPath);
      await audioPlayer.play(urlSource);
    } catch (e) {
      print("playing $e");
    }
  }
  List<dynamic> selectedDataString = [];
  List<TestMenuModel> selectedTestMenu = [];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height; //834
    var width = MediaQuery.of(context).size.width; //392
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(
          "New Ride",
          style:
              GoogleFonts.acme(fontSize: deviceWidth! * .06, letterSpacing: 1),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: deviceWidth! * .04),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: const Color(0xFF111111),
                    elevation: 10,
                    shadowColor: Colors.black),
                onPressed: () async {
                  if (nameTextEditing.text.isNotEmpty &&
                      mobileTextEditing.text.isNotEmpty &&
                      ageTextEditing.text.isNotEmpty &&
                      NewPatient.tests!.isNotEmpty &&
                      NewPatient.patientLocation!.isNotEmpty) {
                    NewPatient.patientName = nameTextEditing.text;
                    NewPatient.mobileNumber = mobileTextEditing.text;
                    NewPatient.age = ageTextEditing.text;

                    Get.to(() => const SearchRiderPage(),
                        transition: Transition.leftToRight,
                        duration: const Duration(milliseconds: 500));
                  } else {
                    Fluttertoast.showToast(msg: "Enter all fields");
                  }
                },
                child: Text(
                  "Book Rider",
                  style: GoogleFonts.acme(
                      color: Colors.white, fontSize: deviceWidth! * .05),
                )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: ListView(
          children: [
            SizedBox(
              height: height * 13 / 100,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 5),
                        child: Text(
                          "Patient Name",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * 3.9 / 100),
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: height * 7 / 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(deviceWidth! * .01),
                      color: const Color(0xFFE7E3E3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextField(
                        controller: nameTextEditing,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Name",
                            hintStyle: TextStyle(
                                fontSize: width * 3.9 / 100,
                                color: const Color(0xFFC0C0C0))),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 13 / 100,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 5),
                        child: Text(
                          "Mobile Number*",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * 3.9 / 100),
                        ),
                      )
                    ],
                  ),
                  TextFormField(
                    maxLength: 10,
                    controller: mobileTextEditing,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      fillColor: Color(0xFFE7E3E3),
                      filled: true,
                      border: InputBorder.none,
                      hintText: " +91",
                      prefixStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 13 / 100,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 5),
                        child: Text(
                          "Age*",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * 3.9 / 100),
                        ),
                      )
                    ],
                  ),
                  TextField(
                    maxLength: 2,
                    controller: ageTextEditing,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFE7E3E3),
                        border: InputBorder.none,
                        hintText: "Patient age",
                        hintStyle: TextStyle(
                            fontSize: width * 3.9 / 100,
                            color: const Color(0xFFC0C0C0))),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 13 / 100,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 5),
                        child: Text(
                          "patient location*",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * 3.9 / 100),
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: height * 7 / 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(deviceWidth! * .01),
                      color: const Color(0xFFE7E3E3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextField(
                          onTap: () {
                            NewPatient.patientName = nameTextEditing.text;
                            NewPatient.mobileNumber = mobileTextEditing.text;
                            NewPatient.age = ageTextEditing.text;
                            Get.to(() => const PatientLocationPage());
                          },
                          readOnly: true,
                          cursorColor: Colors.black,
                          maxLines: 3,
                          decoration: NewPatient.patientLocation == null
                              ? InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Address",
                                  hintStyle: TextStyle(
                                      fontSize: width * 3.9 / 100,
                                      color: const Color(0xFFC0C0C0)))
                              : InputDecoration(
                                  border: InputBorder.none,
                                  hintText: NewPatient.patientLocation,
                                  hintStyle: TextStyle(
                                      fontSize: width * 3.9 / 100,
                                      color: Colors.black))),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 5),
                  child: Text(
                    "Samples*",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width * 3.9 / 100),
                  ),
                )
              ],
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        // Set column height to minimum
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: testMenuController.testMenuList.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    ListTile(
                                      leading: Image.network(
                                        testMenuController
                                            .testMenuList[index].imageUrl,
                                        width: deviceWidth! * 0.1,
                                        height: deviceWidth! * 0.1,
                                      ),
                                      title: Text(
                                        testMenuController
                                            .testMenuList[index].testSampleName,
                                        style: GoogleFonts.acme(
                                          fontSize: deviceWidth! * 0.05,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                      trailing: Checkbox(
                                        value: false,
                                        onChanged: (value) {
                                          // Handle checkbox change here
                                        },
                                      ),
                                    ),
                                    Divider(), // Add a divider between items
                                  ],
                                );
                              },
                            ),
                          ),
                          // "Done" button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: deviceWidth!*.3,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(deviceWidth!*.01)
                                    )),
                                      backgroundColor:
                                          const MaterialStatePropertyAll(Colors.black)),
                                  onPressed: () {
                                    Navigator.pop(
                                        context); // Close the bottom sheet
                                  },
                                  child: Text("Done",style: GoogleFonts.acme(color:Colors.white),),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(deviceWidth! * .01),
                  // Set border radius
                  color: const Color(0xFFE7E3E3), // Set fill color
                ),
                height: height * .07,
              ),
            ),
            SizedBox(
              height: deviceHeight! * .03,
            ),
            SizedBox(
              height: height * 13 / 100,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 5),
                        child: Text(
                          "Enter Price*",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * 3.9 / 100),
                        ),
                      )
                    ],
                  ),
                  TextFormField(
                    maxLength: 10,
                    controller: priceController,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      fillColor: Color(0xFFE7E3E3),
                      filled: true,
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.currency_rupee_outlined),
                      prefixStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 5),
                      child: Text(
                        "Voice Message",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * 3.9 / 100),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isRecording) const Text("Recording"),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            primaryColor, // Set the background color
                      ),
                      onPressed: isRecording ? stopRecording : startRecording,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ScaleTransition(
                              scale: Tween<double>(begin: 1.0, end: 1.2)
                                  .animate(_controller),
                              child: Icon(
                                isRecording ? Icons.stop : Icons.mic,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              isRecording
                                  ? 'Stop Recording'
                                  : 'Start Recording',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    if (!isRecording && audioPath != null)
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.green, // Set the background color
                          ),
                          onPressed: playRecording,
                          child: const Icon(
                            Icons.speaker_phone,
                            color: Colors.white,
                          ))
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
