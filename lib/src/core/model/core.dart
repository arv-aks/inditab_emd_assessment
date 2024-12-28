import 'package:flutter/material.dart';

class PaddingBuilder {
  final num? top;
  final num? right;
  final num? bottom;
  final num? left;
  PaddingBuilder({
    this.top,
    this.right,
    this.bottom,
    this.left,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'top': top,
      'right': right,
      'bottom': bottom,
      'left': left,
    };
  }

  factory PaddingBuilder.fromMap(Map<String, dynamic> map) {
    return PaddingBuilder(
      top: map['top'],
      right: map['right'],
      bottom: map['bottom'],
      left: map['left'],
    );
  }
}

Color parseColor(String hexColor) {
  // Add the alpha channel if not provided
  if (hexColor.length == 6) {
    hexColor = "FF$hexColor";
  }
  // Convert the hex string to an integer and create a Color
  return Color(int.parse(hexColor, radix: 16));
}


extension EdgeInsetsExtension on PaddingBuilder? {
  EdgeInsetsGeometry paddingBuilderToEdgeInsets() {
    if (this == null) {
      return EdgeInsets.zero;
    }

    return EdgeInsets.only(
      top: this?.top?.toDouble() ?? 0.0,
      bottom: this?.bottom?.toDouble() ?? 0.0,
      left: this?.left?.toDouble() ?? 0.0,
      right: this?.right?.toDouble() ?? 0.0,
    );
  }
}
