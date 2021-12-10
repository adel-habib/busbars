import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color col;
  final Widget cardChild;
  final VoidCallback onPress;
  ReusableCard({required this.col,required this.cardChild, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: col,
        ),
      ),
    );
  }
}