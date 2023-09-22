
import 'package:flutter/material.dart';

class LoadListErrorWidget extends StatelessWidget {
  const LoadListErrorWidget({super.key, required this.onTap});

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Error occured, tap below to reload list"),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.blue,
              onTap: onTap,
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Ink(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.orange),
                child: const SizedBox(
                  height: 40,
                  child: Center(
                    child: Text(
                      "Tap here",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

}