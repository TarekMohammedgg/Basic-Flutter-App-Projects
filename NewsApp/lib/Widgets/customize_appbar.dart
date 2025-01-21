import 'package:flutter/material.dart';

class CustomizeAppBAr extends StatelessWidget {
  const CustomizeAppBAr({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: const TextSpan(children: [
      TextSpan(
        text: "News",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black87 ,
          fontSize: 24,
        ),
      ),
      TextSpan(
          text: "Club",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.pink,
          ))
    ]));
  }
}
