import 'dart:io';
import 'package:complaint_manager/ui/UserDashboard.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:complaint_manager/utils/Constants.dart';

//test
final FirebaseDatabase database = FirebaseDatabase.instance;

class feedForm extends StatefulWidget {
  @override
  _feedFormState createState() => _feedFormState();
}

class _feedFormState extends State<feedForm> {




  void _showDialog(BuildContext pageContext) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Feedback submitted"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog


            new FlatButton(
              child: new Text("Ok"),
              onPressed: () async {


                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => UserDashboard()));

              },
            ),
          ],
        );
      },
    );
  }



  File sampleImage;
  String filename;
  String random;
  var url;
  bool validateDetail = false;
  String _name, _mobile, _block, _room;

  @override
  void initState() {
    super.initState();
    shared();
  }

  shared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = (prefs.getString(Constants.loggedInUserName));
      _mobile = (prefs.getString(Constants.loggedInUserMobile));
      _block = (prefs.getString(Constants.loggedInUserBlock));
      _room = (prefs.getString(Constants.loggedInUserRoom));
    });
  }

  bool validateName = true;
  bool validateNumber = true;

  static const typeItems = <String>[
    'General',
    'Electricity',
    'Cleaning',
    'Theft',
    'Mess'
  ];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = typeItems
      .map((String value) => DropdownMenuItem<String>(
    value: value,
    child: Text(value),
  ))
      .toList();
  String dropDownValue = "General";

  Future getImage() async {
    var tempImage = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 40,
    );
    setState(() {
//        if(sampleImage==null)
//           sampleImage= File("assets/image_02.png");
      sampleImage = tempImage;
      filename = sampleImage.toString();
    });
  }

  static const textStyle = TextStyle(fontSize: 15);
  TextEditingController nameController = TextEditingController();
  TextEditingController infoController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool saving = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff028090),
        title: Text('Give feedback'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: saving,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: ListView(
            children: <Widget>[
//            Text('Enter your Name',style:textStyle),
//            TextField(
//              controller: nameController,
//            ),
              Padding(
                padding: const EdgeInsets.only(top: 14.0, bottom: 6),
                child: Text('Enter feedback', style: textStyle),
              ),
              TextField(
                maxLines: 3,
                onChanged: (value) {
                  setState(() {
                    value.isEmpty
                        ? validateDetail = true
                        : validateDetail = false;
                  });
                },
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  errorText: validateDetail ? "Detail can\'t be empty" : null,
                  border: OutlineInputBorder(),
                ),
                controller: infoController,
              ),
//            Padding(
//              padding: const EdgeInsets.only(top: 14.0, bottom: 6),
//              child: Text('Enter phone',style:textStyle),
//            ),
//            TextField(maxLength: 10,
//              controller: phoneController,
//              keyboardType: TextInputType.number,
//              decoration: InputDecoration(prefixText: '+91-',),
//            ),

              RaisedButton(
                color: Color(0xff028090),
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                onPressed: () async {
                  _showDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget uploadPicture() {
    return Container(
      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.file(
            sampleImage,
            height: 200,
            width: 200,
          ),
          RaisedButton(
            elevation: 7.0,
            child: Text('Select another'),
            onPressed: getImage,
          ),
        ],
      ),
    );
  }

  Future<String> uploadImage() async {
    // print('\n\n$filename\n\n');
    final StorageReference firebaseStorageRef =
    FirebaseStorage.instance.ref().child('$random');
    final StorageUploadTask task = firebaseStorageRef.putFile(sampleImage);
    var downUrl = await (await task.onComplete).ref.getDownloadURL();
    url = downUrl.toString();
    //print('Download Url $url');
    return url;
  }
}
