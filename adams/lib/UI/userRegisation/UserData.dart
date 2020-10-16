import 'package:flutter/material.dart';
import 'package:nice_button/nice_button.dart';
import 'SecretKey.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class User_Data extends StatefulWidget {
  final String email;
  final String name;
  final String nic;
  final String tel;
  User_Data({Key key, @required this.email, @required this.name, @required this.nic, @required this.tel}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _User_DataState(email:email,name:name,nic:nic,tel:tel);
  }
}

class _User_DataState extends State<User_Data> {

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0, height: 2.0,);

  var patient_Title = "";
  var Birthday = TextEditingController();
  String dropdownValue = "select the gender of your";

  var _First_Color = Colors.blue[900];
  var _Second_Color = Colors.blue;

  var myType = new Icon(Icons.mic, color: Colors.white);

  final String email;
  final String name;
  final String nic;
  final String tel;
  _User_DataState({@required this.email,  @required this.name, @required this.nic, @required this.tel});

  String _selectedDate = 'Tap to select bod';

  @override
  Future<void> initState() {
    super.initState();
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
                                  child :Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                          children: <Widget>[
                                            new InkWell(
                                              onTap: () {
                                                _selectDate(context);
                                              },
                                              child: TextField(
                                                obscureText: false,
                                                style: style,
                                                decoration: InputDecoration(
                                                  prefixIcon: Icon(Icons.date_range),
                                                  contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
                                                  hintText: "Birth Of Date",
                                                  enabled: false,
                                                ),
                                                controller: Birthday,
                                              ),
                                            ),
                                          ],
                                        ),
                                    ],
                                  )
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child :Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(8, 0, 15, 0),
                                          child:new Icon(Icons.wc,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        DropdownButton<String>(
                                          value: dropdownValue,
                                          icon: Icon(Icons.arrow_drop_down),
                                          iconSize: 24,
                                          elevation: 16,
                                          style: TextStyle(color: Colors.grey),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              dropdownValue = newValue;
                                              patient_Title = dropdownValue;
                                              print(dropdownValue);
                                            });
                                          },
                                          items: <String>["select the gender of your",'Female', 'Male']
                                              .map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                      ]
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
                              Route route = MaterialPageRoute(builder: (context) => Secret_Key(email:email,name:name,nic:nic,tel:tel,bod:Birthday.text,gender:patient_Title));
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime d = await showDatePicker( //we wait for the dialog to return
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1930),
      lastDate: DateTime(3030),
    );
    if (d != null) { //if the user has selected a date
      setState(() {
        // we format the selected date and assign it to the state variable
        _selectedDate = new DateFormat.yMMMMd("en_US").format(d);
        Birthday.text = _selectedDate;
      });
    }
  }

}

