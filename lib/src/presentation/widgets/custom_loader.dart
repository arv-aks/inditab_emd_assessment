import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key, this.value});

  final double? value;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 30,
      width: 30,
      child: CircularProgressIndicator(
        strokeWidth: 2,
         value: value,
        color: Colors.greenAccent,
      ),
    );
  }
}