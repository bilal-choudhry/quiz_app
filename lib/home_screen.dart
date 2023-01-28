import 'package:flutter/material.dart';

import 'package:quiz_app/questions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List questionBank = [
    Question.newName("Capital of Pakistan is Islamabad", true),
    Question.newName("Capital of Punjab is Sialkot", false),
    Question.newName("Independence Day is August 14", true),
    Question.newName("Iqbal Day is December 25", false),
    Question.newName("Indo-Pak 1st war Was in 1965", true),
  ];
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade800,
        title: Text("Quiz"),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey.shade700,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(40),
                child: Center(
                    child: Image.asset(
                  "assets/images/flag.png",
                  width: 250,
                  height: 180,
                ))),
            Container(
              padding: EdgeInsets.all(20),
              height: 120,
              width: 350,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.blueGrey.shade400,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                questionBank[_index % questionBank.length].questionText,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () => _checkAnswer(true, context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors
                            .blueGrey.shade800, // Text Color (Foreground color)
                      ),
                      child: Text(
                        "TRUE",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: () => _checkAnswer(false, context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors
                            .blueGrey.shade800, // Text Color (Foreground color)
                      ),
                      child: Text(
                        "FALSE",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _index++;
                          if (_index == questionBank.length) {
                            _index = 0;
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey.shade800,
                      ),
                      child: /*Text("$_index")*/ Icon(
                        Icons.arrow_forward_sharp,
                        color: Colors.black,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _checkAnswer(bool value, BuildContext context) {
    if (value == questionBank[_index].isCorrect) {
      final snackbar = SnackBar(
          backgroundColor: Colors.green,
          duration: Duration(milliseconds: 500),
          content: Text("Correct"));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else {
      final snackbar = SnackBar(
          backgroundColor: Colors.red,
          duration: Duration(milliseconds: 500),
          content: Text("Incorrect"));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }
}
