import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


Widget myAppBar() {
  return AppBar(
    title: Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: SvgPicture.asset(
            'assets/htwlogo.svg',
            height: 17,
            color: const Color(0xffFAA31B),
          ),
        ),
        const Text(
          'Thermal Calculator',
          style: TextStyle(fontSize: 20),
        )
      ],
    ),
  );
}