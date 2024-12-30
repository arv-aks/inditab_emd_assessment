// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

class BorderBuilder {
  final String? borderColor;
  final num? borderRadius;
  final num? borderWidth;
  BorderBuilder({
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
  });

  BorderBuilder copyWith({
    String? borderColor,
    num? borderRadius,
    num? borderWidth,
  }) {
    return BorderBuilder(
      borderColor: borderColor ?? this.borderColor,
      borderRadius: borderRadius ?? this.borderRadius,
      borderWidth: borderWidth ?? this.borderWidth,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'borderColor': borderColor,
      'borderRadius': borderRadius,
      'borderWidth': borderWidth,
    };
  }

  factory BorderBuilder.fromMap(Map<String, dynamic> map) {
    return BorderBuilder(
      borderColor: map['borderColor'] != null ? map['borderColor'] as String : null,
      borderRadius: map['borderRadius'] != null ? map['borderRadius'] as num : null,
      borderWidth: map['borderWidth'] != null ? map['borderWidth'] as num : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BorderBuilder.fromJson(String source) => BorderBuilder.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BorderBuilder(borderColor: $borderColor, borderRadius: $borderRadius, borderWidth: $borderWidth)';

  @override
  bool operator ==(covariant BorderBuilder other) {
    if (identical(this, other)) return true;
  
    return 
      other.borderColor == borderColor &&
      other.borderRadius == borderRadius &&
      other.borderWidth == borderWidth;
  }

  @override
  int get hashCode => borderColor.hashCode ^ borderRadius.hashCode ^ borderWidth.hashCode;
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
