import 'package:flutter/material.dart';

class ItemOwnerWidget extends StatelessWidget {
  const ItemOwnerWidget({
    super.key,
    required this.avatarUrl,
    required this.owner,
  });

  final String avatarUrl;
  final String owner;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5, top: 10),
          child: SizedBox(
            width: 30,
            height: 30,
            child: Image.network(
              avatarUrl,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Text(
            "owner: $owner",
            style: const TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
