import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tokenizer/tokenizer.dart';
import 'package:translator/translator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
  }
  
  class _HomeState extends State<Home>{

    GoogleTranslator translator = GoogleTranslator();

 
    String text = "මට දොස්තර කමල් මුනගැසීමට අවශ්‍යයි";

    void translate(){
      translator.translate(text, to:"en").then((output){
        setState(() async {
          
          output = text;

          final string = 'abc, abc, abc,';
          final tokenizer = Tokenizer({','});
          final c = StreamController<String>();

          c.add(string);
          c.close();

          final tokens = await c.stream.transform(tokenizer.streamTransformer).toList();
          print(tokens);

          
        });
      });
      {


      }
    }

    void translate2(){
      translator.translate(text, to:"si").then((output){
        setState(()  {
          
          output = text;

         });
      });
      {


      }
    }


   
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Language Translation"),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: (){
                  translate(); 
                  translate2();             
              },
              child: Text("Translate the Text"),)
            ],
          ),
        ),
      );
    
  }

}