import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final String label;
  Color textColor = Colors.white;
  Color buttonColor = Colors.blueAccent;
  final VoidCallback doSomething;
  Mybutton({Key? key, required this.label,required this.doSomething, required this.buttonColor, required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: const EdgeInsets.only(left: 10.0, top: 30.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
        ),
        onPressed: doSomething,
        child:  Text(
          label,
          style: TextStyle(color: textColor),
        ),

      ),
    );
  }
}
