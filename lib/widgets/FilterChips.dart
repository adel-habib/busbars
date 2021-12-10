import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class MyChipsFilter extends StatefulWidget {
  final String chipName;
  final Function onSelected;

  MyChipsFilter({required this.chipName,required this.onSelected});

  @override
  _MyChipsFilterState createState() => _MyChipsFilterState();
}

class _MyChipsFilterState extends State<MyChipsFilter> {
  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.chipName),
      selected: _isSelected,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        labelStyle: TextStyle(fontSize: 13),
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
        });
      },
      selectedColor: kActiveSwitchColor,);
  }
}
final isPaintedInside = MyChipsFilter(chipName: 'Painted from inside',onSelected: (){},);
final isPaintedOutside = MyChipsFilter(chipName: 'Painted from outside',onSelected:  (){},);