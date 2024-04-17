import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class faq extends StatefulWidget {

  @override
  _faqState createState() => _faqState();
}

class _faqState extends State<faq> {
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardC = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardD = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('FAQ'),
        backgroundColor: Color(0xff028090),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
            child: ExpansionTileCard(
              baseColor: Colors.cyan[50],
              expandedColor: Colors.red[50],
              key: cardA,
              leading: CircleAvatar(
                  child: Image.asset("assets/images/devs.jpg")),
              title: Text("How this app help full?"),
              //subtitle: Text("FLUTTER DEVELOPMENT COMPANY"),
              children: <Widget>[
                Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      "You can place a complaint in this app where it can be viewed by the admin and verify the complaints. The status also can be viewed by student through the application."
                          ,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(fontSize: 16),
                    ),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  buttonHeight: 52.0,
                  buttonMinWidth: 90.0,
                  children: <Widget>[

                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      onPressed: () {
                        cardA.currentState?.collapse();
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.arrow_upward),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Close'),
                        ],
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
            child: ExpansionTileCard(
              baseColor: Colors.cyan[50],
              expandedColor: Colors.red[50],
              key: cardB,
              leading: CircleAvatar(
                  child: Image.asset("assets/images/devs.jpg")),
              title: Text("How to make a complaint?"),
              //subtitle: Text("FLUTTER DEVELOPMENT COMPANY"),
              children: <Widget>[
                Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      "There will be an option for making a complaint. Clicking on it shows a new form of complaint. Select the type of issue and then give the description of it. Add the proof of complaint and submit it."
                          ,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(fontSize: 16),
                    ),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  buttonHeight: 52.0,
                  buttonMinWidth: 90.0,
                  children: <Widget>[

                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      onPressed: () {
                        cardA.currentState?.collapse();
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.arrow_upward),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Close'),
                        ],
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
            child: ExpansionTileCard(
              baseColor: Colors.cyan[50],
              expandedColor: Colors.red[50],
              key: cardC,
              leading: CircleAvatar(
                  child: Image.asset("assets/images/devs.jpg")),
              title: Text("How to view the complaint status?"),
              //subtitle: Text("FLUTTER DEVELOPMENT COMPANY"),
              children: <Widget>[
                Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      "After placing the complaint, the list of complaints under particular category is seen. To view the status of particular complaint click on it and along with status the details of complaints can also be seen."
                        "Status: pending /done.( this way you can see the complaint status)."
                          ,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(fontSize: 16),
                    ),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  buttonHeight: 52.0,
                  buttonMinWidth: 90.0,
                  children: <Widget>[

                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      onPressed: () {
                        cardA.currentState?.collapse();
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.arrow_upward),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Close'),
                        ],
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),



          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
            child: ExpansionTileCard(
              baseColor: Colors.cyan[50],
              expandedColor: Colors.red[50],
              key: cardD,
              leading: CircleAvatar(
                  child: Image.asset("assets/images/devs.jpg")),
              title: Text("How complaints are solved ?"),
              //subtitle: Text("FLUTTER DEVELOPMENT COMPANY"),
              children: <Widget>[
                Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      "USER/STUDENT:"
                      "A student firstly needs to sign up into app to access the application. Once he/ she registered then they can use their credentials which are their mail id and password give at the time of registration /signup. After signing into application the student can make a complaint based on the category of the complaint. The categories such as general, theft, cleaning are given and student’s complaints will be divided into them. The status is viewed as pending or done."
                          "ADMIN:"
                        "The admin first need to create a single profile with mail id and password. After creation have to login and can view all the complaints that are received from users and the different categories. When a problem is solved the status will be updated as done that will be synced to student.",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(fontSize: 16),
                    ),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  buttonHeight: 52.0,
                  buttonMinWidth: 90.0,
                  children: <Widget>[

                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      onPressed: () {
                        cardA.currentState?.collapse();
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.arrow_upward),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Close'),
                        ],
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}