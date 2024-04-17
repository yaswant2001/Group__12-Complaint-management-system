import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:complaint_manager/login.dart';
import 'package:complaint_manager/ui/UserDashboard.dart';
import 'package:complaint_manager/ui/admin.dart';
import 'package:complaint_manager/utils/CommonData.dart';
import 'package:complaint_manager/utils/Constants.dart';
import 'package:complaint_manager/utils/globals.dart' as globals;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    //super.initState();
    // CommonData.clearLoggedInUserData();
    shared();
  }

  String _login, _role;

  shared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _login = (prefs.getString(Constants.isLoggedIn));
      _role = (prefs.getString(Constants.loggedInUserRole));
      globals.name = (prefs.getString(Constants.loggedInUserName));
      globals.mobile = (prefs.getString(Constants.loggedInUserMobile));
      globals.block = (prefs.getString(Constants.loggedInUserBlock));
      globals.room = (prefs.getString(Constants.loggedInUserRoom));
      globals.mail=(prefs.getString(Constants.loggedInUserMail));
      globals.usn=(prefs.getString(Constants.loggedInUserUsn));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Complaint Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _login == "true"
          ? (_role == "student" ? UserDashboard() : AdminDashboard())
          : Login(),
    );
  }
}
