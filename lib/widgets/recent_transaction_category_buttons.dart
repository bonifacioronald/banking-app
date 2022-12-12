import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;

// ignore: must_be_immutable
class RecentTransactionCategoryButtons extends StatelessWidget {
  String text;
  IconData icon;
  Color iconColor;
  bool isSelected;

  RecentTransactionCategoryButtons(
      this.text, this.icon, this.iconColor, this.isSelected, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 32,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Row(
              children: [
                text == 'All'
                    ? Text(
                        text,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: isSelected
                                ? custom_colors.primary
                                : custom_colors.primary.withOpacity(0.3)),
                      )
                    : Row(
                        children: [
                          Icon(
                            icon,
                            color: isSelected
                                ? iconColor
                                : iconColor.withOpacity(0.3),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            text,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: isSelected
                                    ? custom_colors.primary
                                    : custom_colors.primary.withOpacity(0.3)),
                          ),
                        ],
                      ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
              )
            ],
          ),
        ),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
