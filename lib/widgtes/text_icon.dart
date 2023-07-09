import 'package:flutter/material.dart';

class TextIcon extends StatelessWidget {
  Icon icon;
  Text title;

  TextIcon({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          title,
        ],
      ),
    );
  }
}
