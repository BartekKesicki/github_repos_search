
import 'package:flutter/material.dart';

class ItemsDivider extends StatelessWidget {
  const ItemsDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
    );
  }

}