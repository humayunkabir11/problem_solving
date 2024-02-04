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
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
     MyApp({super.key});
final String name = "Practice Problem solving";
  @override
  Widget build(BuildContext context) {
    return    MaterialApp(
      home: HomePage(name: name,),
    );
  }
}

class HomePage extends StatefulWidget {
   const HomePage({super.key,required this.name});
  final String name ;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ///check letter

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

  /// Add N serial  number
String addNumber = "";
  TextEditingController numberController = TextEditingController();
  String calculateSum(int enterNumber){
    // if (enterNumber<1 || enterNumber >10) {
    //   return "please Enter your number 1-10";
    // }
    int sum = 0;
    for(int i= 1; i<=enterNumber;i++){
      sum = sum+i;
    }
    return sum.toString();
  }


  /// which number type this number will be added and print
  String result = "";
  TextEditingController addNumberController =  TextEditingController();
  String calculateDigitSum(String number) {
    if (number.isEmpty) {
      return "only digit"; // Return an empty string if no number is entered
    }
    int sum = 0;
    for (int i = 0; i < number.length; i++) {
      int digit = int.tryParse(number[i]) ?? 0;


     /// Convert each character to digit
      sum += digit;
    }

    return sum.toString();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Programming part: ${widget.name}"),

            /// check letter
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
            Text("THE LETTER IS  => $text"),
            const SizedBox(height: 20,),


           ///  add N number

            TextFormField(
              onChanged: (value) {
                setState(() {
                  addNumber =  calculateSum(int.tryParse(value) ?? 0);
                 debugPrint(addNumber);
                  debugPrint(value);// Update the 'text' variable with the entered text
                });
              },
              controller: numberController,
              decoration: InputDecoration(
                suffixIcon: IconButton(onPressed: (){
                  setState(() {
                    result = "";
                    numberController.clear();
                  });
                }, icon: const Icon(Icons.close)),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 1,
                ),
                hintText: "Enter your NUMBER here",
                border: const OutlineInputBorder(),
              ),
            ),


            Text("Your total SUM => $addNumber"),




            const SizedBox(height: 20,),
            /// add which number type these number are added
            TextFormField(
              onChanged: (value) {
                setState(() {
                  result = calculateDigitSum(value);
                  print(text);
                  debugPrint(value);// Update the 'text' variable with the entered text
                });
              },
              controller: addNumberController,
              decoration: InputDecoration(
                suffixIcon: IconButton(onPressed: (){
                  setState(() {
                    result = "";
                    addNumberController.clear();
                  });
                }, icon: const Icon(Icons.close)),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 1,
                ),
                hintText: "Enter your NUMBER here",
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20,),
            Text("Your total result => $result"), // This Text widget will update instantly as the user types
          ],
        ),

    );
  }
}
