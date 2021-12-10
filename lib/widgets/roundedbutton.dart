import 'package:flutter/material.dart';
class RoundedButton extends StatelessWidget {
  const RoundedButton({required this.icon, required this.onPress,required this.onLongPress});
  final IconData icon;
  final VoidCallback onPress;
  final VoidCallback onLongPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0,
      child: Icon(icon, color: Colors.black, ),
      onPressed: onPress,
      onLongPress: onLongPress,
      constraints: const BoxConstraints.tightFor(
          height: 44,
          width: 44
      ),
      shape: const CircleBorder(),
        fillColor: const Color(0xFF4C4F5E),
    );
  }
}