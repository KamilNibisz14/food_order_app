import 'package:flutter/material.dart';

class InitiolOrderButton extends StatelessWidget {
  InitiolOrderButton({
    required this.onTap,
    super.key
  });
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double buttoHeight = screenHeight / 9;
    double buttonWidth = buttoHeight *2.5;
    double fontSize = screenHeight / 33;
    Color textColor = Color(0xFFFEFEFE);
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: buttoHeight,
          width:  buttonWidth,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.amber,
                Colors.amberAccent,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(4, 4),
              ),
            ],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              "Order food",
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}