import 'package:complaint_manager/utils/Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:complaint_manager/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toast/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:complaint_manager/utils/globals.dart' as globals;

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void initState() {
    //super.initState();
    // CommonData.clearLoggedInUserData();
    shared();
  }

  bool _saving = false;
  Map data;
  bool validateName = false;
  bool validateEmail = false;
  bool validatePassword = false;
  bool validateUSN = false;
  bool validateBlock = false;
  bool validateRoom = false;
  bool validateMobile = false;
  String _name, _mobile, _block, _room;

  TextEditingController emailController =
      TextEditingController(text: '${globals.mail}');

  TextEditingController passwordController = TextEditingController();

  TextEditingController nameController =
      TextEditingController(text: '${globals.name}');

  TextEditingController usnController =
      TextEditingController(text: '${globals.usn}');

  TextEditingController blockController =
      TextEditingController(text: '${globals.block}');

  TextEditingController roomController =
      TextEditingController(text: '${globals.room}');

  TextEditingController mobileController =
      TextEditingController(text: '${globals.mobile}');

  @override
  Widget build(BuildContext context) {
    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("updated"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("ok"),
                onPressed: () async {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    Future<void> update() async {
      _saving = true;

      DocumentReference reference =
          Firestore.instance.collection('users').document('${globals.mail}');
      Map<String, dynamic> data = {
        "name": '${nameController.text}',
        "block": '${blockController.text}',
        "room": '${roomController.text}',
        "mobile": '${mobileController.text}',
      };
      await reference.updateData(data);
      _saving = false;
    }

    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        child: new Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 15.0),
                    blurRadius: 15.0),
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, -10.0),
                    blurRadius: 10.0),
              ]),
          child: Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            child: ListView(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Profile",
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(45),
                        fontFamily: "Poppins-Bold",
                        letterSpacing: .6)),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(30),
                ),
                Text("Name",
                    style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontSize: ScreenUtil.getInstance().setSp(26))),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      value.isEmpty
                          ? validateName = true
                          : validateName = false;
                    });
                  },
                  controller: nameController,
                  decoration: InputDecoration(
                      errorText: validateName ? "Name can\'t be empty" : null,
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(30),
                ),
                Text("USN No.",
                    style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontSize: ScreenUtil.getInstance().setSp(26))),
                TextField(
                  enabled: false,
                  onChanged: (value) {
                    setState(() {
                      value.isEmpty ? validateUSN = true : validateUSN = false;
                    });
                  },
                  controller: usnController,
                  decoration: InputDecoration(
                      errorText: validateUSN ? "USN can\'t be empty" : null,
                      hintText: "USN",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(30),
                ),
                Text("university Block",
                    style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontSize: ScreenUtil.getInstance().setSp(26))),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      value.isEmpty
                          ? validateBlock = true
                          : validateBlock = false;
                    });
                  },
                  controller: blockController,
                  decoration: InputDecoration(
                      errorText: validateBlock ? "Block can\'t be empty" : null,
                      hintText: "Block",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(30),
                ),
                Text("Room No.",
                    style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontSize: ScreenUtil.getInstance().setSp(26))),
                TextField(
                  keyboardType: TextInputType.numberWithOptions(),
                  onChanged: (value) {
                    setState(() {
                      value.isEmpty
                          ? validateRoom = true
                          : validateRoom = false;
                    });
                  },
                  controller: roomController,
                  decoration: InputDecoration(
                      errorText: validateRoom ? "Room can\'t be empty" : null,
                      hintText: "Room No.",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(35),
                ),
                Text("Mobile",
                    style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontSize: ScreenUtil.getInstance().setSp(26))),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      value.isEmpty
                          ? validateMobile = true
                          : validateMobile = false;
                    });
                  },
                  maxLength: 10,
                  controller: mobileController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      errorText:
                          validateMobile ? "Mobile can\'t be empty" : null,
                      hintText: "Mobile",
                      prefixText: '+91-',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(35),
                ),
                Text("Email",
                    style: TextStyle(
                        fontFamily: "Poppins-Medium",
                        fontSize: ScreenUtil.getInstance().setSp(26))),
                TextField(
                  enabled: false,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  onChanged: (value) {
                    setState(() {
                      value.isEmpty
                          ? validateEmail = true
                          : validateEmail = false;
                    });
                  },
                  decoration: InputDecoration(
                      errorText: validateEmail ? "Email can\'t be empty" : null,
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(35),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(35),
                ),
                InkWell(
                  child: Center(
                    child: Container(
                      width: ScreenUtil.getInstance().setWidth(250),
                      height: ScreenUtil.getInstance().setHeight(60),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xFF17ead9), Color(0xFF6078ea)]),
                          borderRadius: BorderRadius.circular(6.0),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFF6078ea).withOpacity(.3),
                                offset: Offset(0.0, 8.0),
                                blurRadius: 8.0)
                          ]),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              emailController.text.isEmpty
                                  ? validateEmail = true
                                  : validateEmail = false;
                              passwordController.text.isEmpty
                                  ? validatePassword = true
                                  : validatePassword = false;
                              usnController.text.isEmpty
                                  ? validateUSN = true
                                  : validateUSN = false;
                              blockController.text.isEmpty
                                  ? validateBlock = true
                                  : validateBlock = false;
                              roomController.text.isEmpty
                                  ? validateRoom = true
                                  : validateRoom = false;
                              mobileController.text.isEmpty
                                  ? validateMobile = true
                                  : validateMobile = false;
                              nameController.text.isEmpty
                                  ? validateName = true
                                  : validateName = false;
                            });

                            data = {
                              "name": "${nameController.text}",
                              "usn": "${usnController.text}",
                              "block": "${blockController.text}",
                              "room": "${roomController.text}",
                              "mobile": "${mobileController.text}",
                              "role": "student"
                            };
                            if (!(validateMobile &&
                                validateRoom &&
                                validateBlock &&
                                validateName &&
                                validatePassword &&
                                validateEmail &&
                                validateUSN)) {
                              update();
                            }
                          },
                          child: Center(
                            child: Text("EDIT",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins-bold",
                                    fontSize: 18,
                                    letterSpacing: 1.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  shared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      globals.name = (prefs.getString(Constants.loggedInUserName));
      globals.mobile = (prefs.getString(Constants.loggedInUserMobile));
      globals.block = (prefs.getString(Constants.loggedInUserBlock));
      globals.room = (prefs.getString(Constants.loggedInUserRoom));
      globals.mail = (prefs.getString(Constants.loggedInUserMail));
      globals.usn = (prefs.getString(Constants.loggedInUserUsn));
    });
  }
}
