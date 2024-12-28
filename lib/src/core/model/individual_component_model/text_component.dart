// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inditab_emd_assessment/src/core/component.dart';

class TextComponent implements IComponent {
  @override
  bool? isVisible;

  @override
  IComponentStyle? style;

  @override
  String? type;

  @override
  ComponentDataWrapper? data;

  TextComponent({
    this.isVisible,
    this.style,
    this.type,
    this.data,
  });

  factory TextComponent.fromMap(Map<String, dynamic> map) {
    return TextComponent(
      isVisible: map['isVisible'] != null ? map['isVisible'] as bool : null,
      style: map['style'] != null
          ? TextComponentStyle.fromMap(map['style'] as Map<String, dynamic>)
          : null,
      type: map['type'] != null ? map['type'] as String : null,
      data: map['data'] != null
          ? Single(
              data: TextComponentData.fromMap(
                  map['data'] as Map<String, dynamic>))
          : null,
    );
  }
}

// TextComponentData class
class TextComponentData implements IComponentData {
  final String text;

  TextComponentData({required this.text});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
    };
  }

  factory TextComponentData.fromMap(Map<String, dynamic> map) {
    return TextComponentData(
      text: map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TextComponentData.fromJson(String source) =>
      TextComponentData.fromMap(json.decode(source) as Map<String, dynamic>);
}

// TextComponentStyle Class
class TextComponentStyle implements IComponentStyle {
  final num? fontSize;
  final String? fontColor;
  final String? fontColorDark;
  final String? fontWeight;
  final int? maxLines;
  // final EdgeInsets? padding;

  TextComponentStyle({
    this.fontSize,
    this.fontColor,
    this.fontColorDark,
    this.fontWeight,
    this.maxLines,
    // this.padding,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fontSize': fontSize,
      'fontColor': fontColor,
      'fontColorDark': fontColorDark,
      'fontWeight': fontWeight,
      'maxLines': maxLines,
    };
  }

  factory TextComponentStyle.fromMap(Map<String, dynamic> map) {
    return TextComponentStyle(
      fontSize: map['fontSize'],
      fontColor: map['fontColor'] != null ? map['fontColor'] as String : null,
      fontColorDark:
          map['fontColorDark'] != null ? map['fontColorDark'] as String : null,
      fontWeight:
          map['fontWeight'] != null ? map['fontWeight'] as String : null,
      maxLines: map['maxLines'] != null ? map['maxLines'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TextComponentStyle.fromJson(String source) =>
      TextComponentStyle.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension FontWeightExtension on String? {
  FontWeight? toFlutterFontWeight() {
    switch (this) {
      case "thin":
        return FontWeight.w200;
      case "bold":
        return FontWeight.w700;
      case "medium":
        return FontWeight.w500;
      default:
        return null; // Return null if no match
    }
  }
}
