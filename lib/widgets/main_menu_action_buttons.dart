import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

class MainMenuActionButtons extends StatelessWidget {
  String title;
  String imageUrl;

  MainMenuActionButtons(this.title, this.imageUrl);

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
        SizedBox(
          height: 4,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 16, color: Colors.white54, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
