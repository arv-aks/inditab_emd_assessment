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
  final String? color;
  final RadiusBuilder? radius;
  final num? width;
  BorderBuilder({
    this.color,
    this.radius,
    this.width,
  });

  BorderBuilder copyWith({
    String? color,
    RadiusBuilder? radius,
    num? width,
  }) {
    return BorderBuilder(
      color: color ?? this.color,
      radius: radius ?? this.radius,
      width: width ?? this.width,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'color': color,
      'radius': radius?.toMap(),
      'width': width,
    };
  }

  factory BorderBuilder.fromMap(Map<String, dynamic> map) {
    return BorderBuilder(
      color: map['color'] != null ? map['color'] as String : null,
      radius: map['radius'] != null
          ? RadiusBuilder.fromMap(map['radius'] as Map<String, dynamic>)
          : null,
      width: map['width'] != null ? map['width'] as num : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BorderBuilder.fromJson(String source) =>
      BorderBuilder.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'BorderBuilder(color: $color, radius: $radius, width: $width)';

  @override
  bool operator ==(covariant BorderBuilder other) {
    if (identical(this, other)) return true;

    return other.color == color &&
        other.radius == radius &&
        other.width == width;
  }

  @override
  int get hashCode => color.hashCode ^ radius.hashCode ^ width.hashCode;
}

class RadiusBuilder {
  final num? topLeft;
  final num? bottomLeft;
  final num? bottomRight;
  final num? topRight;
  RadiusBuilder({
    this.topLeft,
    this.bottomLeft,
    this.bottomRight,
    this.topRight,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'topLeft': topLeft,
      'bottomLeft': bottomLeft,
      'bottomRight': bottomRight,
      'topRight': topRight,
    };
  }

  factory RadiusBuilder.fromMap(Map<String, dynamic> map) {
    return RadiusBuilder(
      topLeft: map['topLeft'] != null ? map['topLeft'] as num : null,
      bottomLeft: map['bottomLeft'] != null ? map['bottomLeft'] as num : null,
      bottomRight:
          map['bottomRight'] != null ? map['bottomRight'] as num : null,
      topRight: map['topRight'] != null ? map['topRight'] as num : null,
    );
  }

  RadiusBuilder copyWith({
    num? topLeft,
    num? bottomLeft,
    num? bottomRight,
    num? topRight,
  }) {
    return RadiusBuilder(
      topLeft: topLeft ?? this.topLeft,
      bottomLeft: bottomLeft ?? this.bottomLeft,
      bottomRight: bottomRight ?? this.bottomRight,
      topRight: topRight ?? this.topRight,
    );
  }

  String toJson() => json.encode(toMap());

  factory RadiusBuilder.fromJson(String source) =>
      RadiusBuilder.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RadiusBuilder(topLeft: $topLeft, bottomLeft: $bottomLeft, bottomRight: $bottomRight, topRight: $topRight)';
  }

  @override
  bool operator ==(covariant RadiusBuilder other) {
    if (identical(this, other)) return true;

    return other.topLeft == topLeft &&
        other.bottomLeft == bottomLeft &&
        other.bottomRight == bottomRight &&
        other.topRight == topRight;
  }

  @override
  int get hashCode {
    return topLeft.hashCode ^
        bottomLeft.hashCode ^
        bottomRight.hashCode ^
        topRight.hashCode;
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

extension BorderRadiusExtension on RadiusBuilder? {
  BorderRadiusGeometry borderBuilderToBorderRadius() {
    if (this == null) {
      return const BorderRadius.only();
    }
    return BorderRadius.only(
      topLeft: Radius.circular(this?.topLeft?.toDouble() ?? 0.0),
      topRight: Radius.circular(this?.topRight?.toDouble() ?? 0.0),
      bottomLeft: Radius.circular(this?.bottomLeft?.toDouble() ?? 0.0),
      bottomRight: Radius.circular(this?.bottomRight?.toDouble() ?? 0.0),
    );
  }
}
