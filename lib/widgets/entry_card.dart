import 'package:flutter/material.dart';
class EntryCard extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final Widget cardChild;
  EntryCard({required this.color,required this.onPressed,required this.cardChild});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration:BoxDecoration(borderRadius: BorderRadius.circular(10),
        color: color),
        child: cardChild,
      ),
    );
  }
}
