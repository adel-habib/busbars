import 'package:flutter/material.dart';
class NextBackBotton extends StatelessWidget {
  const NextBackBotton(this.icon, this.onPressed);
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.redAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: const BorderSide(color: Colors.red)
      ),
      ),
      onPressed: onPressed,
      child: Row(
        children: <Widget>[
          Icon(icon,size: 32,),
        ],
      ),
    );
  }
}