import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main(){
  String letter =  stdin.readByteSync().toString();
    if(letter == "a" || letter == "A" || letter == "e" || letter == "E"  || letter == "i" || letter == "I" || letter == "o" || letter == "O" || letter == "u"|| letter == "U")
   {
     if (kDebugMode) {
       print("$letter is a vowel ");
     }
   }
   else {
     print("$letter is a consonant");
 }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      home: HomePage(name: "Practice Problem solving",),
    );
  }
}

class HomePage extends StatefulWidget {
   HomePage({super.key,required this.name});
  final String name ;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController =  TextEditingController();
  late String text ="";


  String checkLetter(String letter){
    if (letter.isEmpty) {
      return ""; // Return an empty string if no letter is entered
    }

    if ("aeiouAEIOU".contains(letter)) {
      return "$letter is vowel";
    } else {
      return "$letter is consonant";
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Programming part: ${widget.name}"),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  text = checkLetter(value);
                  print(text);
                  debugPrint(value);// Update the 'text' variable with the entered text
                });
              },
              controller: textEditingController,
              decoration: InputDecoration(
                suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      text = "";
                      textEditingController.clear();
                    });
                }, icon: const Icon(Icons.close)),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 1,
                ),
                hintText: "Enter your letter here",
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20,),
            Text("The Letter Is => $text "), // This Text widget will update instantly as the user types
          ],
        ),

    );
  }
}
