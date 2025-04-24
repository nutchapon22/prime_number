import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.title,
    this.onClicked,
    required this.customColor,
    required this.textColor,
  });

  final String title;
  final Function()? onClicked;
  final Color customColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width * 0.8,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: customColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        ),

        onPressed: () {
          onClicked!();
        },
        child: Text(title, style: TextStyle(color: textColor, fontSize: 20)),
      ),
    );
  }
}
