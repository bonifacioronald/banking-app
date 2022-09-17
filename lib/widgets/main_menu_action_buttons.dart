import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

// ignore: must_be_immutable
class MainMenuActionButtons extends StatelessWidget {
  String title;
  String imageUrl;

  MainMenuActionButtons(this.title, this.imageUrl, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
              color: custom_colors.lightGrayBackground,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 5,
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white54,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
