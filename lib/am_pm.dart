import 'package:flutter/material.dart';

class AmPm extends StatelessWidget {
  final bool isAm;

  const AmPm({required this.isAm, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        child: Center(
          child: Text(
            isAm == true ? 'am' : 'pm',
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
