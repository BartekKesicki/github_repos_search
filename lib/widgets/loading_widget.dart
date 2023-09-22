import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(
            children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 20,
              ),
              Text("Loading...")
            ],
          ),
        ),
      ],
    );
  }
}
