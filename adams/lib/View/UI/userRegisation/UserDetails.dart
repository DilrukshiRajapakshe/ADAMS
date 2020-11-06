import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nice_button/nice_button.dart';
import 'UserData.dart';

class User_Details extends StatefulWidget {
  final String email;
  final String name;
  User_Details({Key key, @required this.email,  @required this.name}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _User_DetailsState(email:email,name:name);
  }
}

class _User_DetailsState extends State<User_Details> {

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0, height: 2.0,);
//  text box
  var NIC_Number = TextEditingController();
  var phone_number = TextEditingController();

  var _First_Color = Colors.blue[900];
  var _Second_Color = Colors.blue;

  var myType = new Icon(Icons.mic, color: Colors.white);

  // previous screen value
  final String email;
  final String name;
  _User_DetailsState({@required this.email,  @required this.name});


  @override
  Future<void> initState() {
    super.initState();
    printf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView (
        child :Container(
          color: Colors.white,
          child: SafeArea(
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Center(
                              child:Column(
                                  children: [
                                    Column(
                                        children: <Widget>[

                                          Padding(
                                            padding: EdgeInsets.fromLTRB(8, 50, 8, 8),
                                            child: Image.asset(
                                                'assets/images/logo.png',
                                                width: 90.0,
                                                height: 90.0
                                            ),
                                          ),
                                          Text("ADAMS",
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.indigo,
                                              )
                                          )
                                        ]
                                    ),
                                    Column(
                                        children: <Widget>[
                                          Padding (
                                              padding: EdgeInsets.fromLTRB(5, 30, 5, 0),
                                              child : Text("User Information",
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    fontFamily: 'Georgia',
                                                    color: Colors.indigo,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              )
                                          )
                                        ]
                                    )
                                  ]
                              )
                          )
                        ]
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child:Column(
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child:Align(
                                    alignment: Alignment.bottomLeft,
                                    child:TextField(
                                      obscureText: false,
                                      style: style,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.credit_card),
                                        contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
                                        hintText: "NIC Number",
                                      ),
                                      controller: NIC_Number,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 20.0),
                                  child :IntlPhoneField(
                                    decoration: InputDecoration(
                                      labelText: 'Phone Number',
                                    ),
                                    initialCountryCode: 'LK',
                                    controller: phone_number,
                                    onChanged: (phone) {
                                      print(phone.completeNumber);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 40.0, 5.0, 0.0),
                    child:Column(
                        children: <Widget>[
                          NiceButton(
                            radius: 40,
                            padding: const EdgeInsets.all(10),
                            text: "Next",
                            icon: Icons.arrow_forward,
                            gradientColors: [_First_Color, _Second_Color],
                            onPressed: (){
                              Navigator.of(context).pop();
//                            navigation next page and sending data into next page
                              Route route = MaterialPageRoute(builder: (context) => User_Data(email:email,name:name,nic:NIC_Number.text,tel:phone_number.text));
                              Navigator.push(context, route);
                            },
                          )
                        ]
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void printf(){
    print(email);
  }

}

