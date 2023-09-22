import 'package:flutter/material.dart';

class ItemTitleWidget extends StatelessWidget {
  const ItemTitleWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
