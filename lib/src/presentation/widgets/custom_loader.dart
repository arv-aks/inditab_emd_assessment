import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 30,
      width: 30,
      child: CircularProgressIndicator(
        strokeWidth: 0.6,
        color: Colors.green,
      ),
    );
  }
}