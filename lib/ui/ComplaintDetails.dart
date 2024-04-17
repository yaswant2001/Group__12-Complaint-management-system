import 'package:complaint_manager/ui/feedback.dart';
import 'package:complaint_manager/ui/form.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ComplaintDetails extends StatefulWidget {
  String name;
  String detail;
  String phone;
  String url;
  String status;
  String id;
  String category;
  int flag;

  ComplaintDetails(this.name, this.detail, this.phone, this.url, this.status,
      this.id, this.category, this.flag);

  @override
  _ComplaintDetailsState createState() => _ComplaintDetailsState();
}

final FirebaseDatabase database = FirebaseDatabase.instance;

class _ComplaintDetailsState extends State<ComplaintDetails> {
  Map data;
  String message;
  bool val;
  String statusChange;
  String pText = "Pending";
  String dText = "Done";
  bool isfeed = false;

  void initState() {
    //super.initState();
    if (this.widget.status == "Done") {
      val = true;
      statusChange = dText;
    } else {
      val = false;
      statusChange = pText;
    }
  }

  static const textStyle = TextStyle(
    fontSize: 16,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff028090),
        title: Text('ComplaintDetail'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 6),
        child: ListView(
          children: <Widget>[
            Container(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 6.0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 400,
                        width: 400,
                        child: Image.network(
                          widget.url,
                        ),
                      ),
// Image.asset(
//                      'assets/dp.jpg',
//                    )),
                      Text(
                        'Name : ${widget.name}',
                        style: textStyle,
                      ),
                      Text(
                        'Number : ${widget.phone}',
                        style: textStyle,
                      ),
                      Text(
                        'Detail : ${widget.detail}',
                        overflow: TextOverflow.ellipsis,
                        style: textStyle,
                      ),
                      Text(
                        'ID :  ${widget.id}',
                        style: textStyle,
                      ),
                      Text(
                        'Status : $statusChange',
                        style: TextStyle(
                            fontSize: 16,
                            color: statusChange == "Pending"
                                ? Colors.red
                                : Colors.green),
                      ),

                      widget.flag == 0
                          ? Container()
                          : Row(
                              children: <Widget>[
                                Text('Work Done'),
                                Checkbox(
                                  value: this.val,
                                  onChanged: (value) {
                                    setState(() {
                                      this.val = value;
                                      if (this.val == true)
                                        message = "Done";
                                      else
                                        message = "Pending";
                                      statusChange = message;
                                      data = {
                                        "name": "${widget.name}",
                                        "detail": "${widget.detail}",
                                        "phone": "${widget.phone}",
                                        "url": "${widget.url}",
                                        "id": "${widget.id}",
                                        "status": "$message",
                                        "category": "${widget.category}"
                                      };
                                      database
                                          .reference()
                                          .child("university/" +
                                              widget.category +
                                              '/' +
                                              widget.id)
                                          .set(data);

                                      //database.reference().child("university").update(data).then((data){print('data');});
                                    });
                                  },
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ),
            val
                ? InkWell(
                    child: Container(
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => feedForm()));
                            isfeed = true;
                          },
                          child: Center(
                            child: Text("Give Feedback",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins-Bold",
                                    fontSize: 18,
                                    letterSpacing: 1.0)),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),

            //isfeed?
          ],
        ),
      ),
    );
  }
}
