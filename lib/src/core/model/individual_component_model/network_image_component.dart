// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:inditab_emd_assessment/src/core/component.dart';
import 'package:inditab_emd_assessment/src/core/model/core.dart';

class NetworkImageComponent implements IComponent {
  @override
  bool? isVisible;

  @override
  IComponentStyle? style;

  @override
  String? type;

  @override
  ComponentDataWrapper? data;

  NetworkImageComponent({
    this.isVisible,
    this.style,
    this.type,
    this.data,
  });

  factory NetworkImageComponent.fromMap(Map<String, dynamic> map) {
    return NetworkImageComponent(
      isVisible: map['isVisible'] != null ? map['isVisible'] as bool : null,
      style: map['style'] != null
          ? NetworkImageComponentStyle.fromMap(
              map['style'] as Map<String, dynamic>)
          : null,
      type: map['type'] != null ? map['type'] as String : null,
      data: map['data'] != null
          ? Single(
              data: NetworkImageComponentData.fromMap(
                  map['data'] as Map<String, dynamic>))
          : null,
    );
  }
}

// TextComponentData class
class NetworkImageComponentData implements IComponentData {
  final String text;

  NetworkImageComponentData({required this.text});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
    };
  }

  factory NetworkImageComponentData.fromMap(Map<String, dynamic> map) {
    return NetworkImageComponentData(
      text: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NetworkImageComponentData.fromJson(String source) =>
      NetworkImageComponentData.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

// TextComponentStyle Class
class NetworkImageComponentStyle implements IComponentStyle {
  final num? height;
  final num? width;
  final String? scale;
  final num? cornerRadius;
  final PaddingBuilder? padding;
  // final EdgeInsets? padding;

  NetworkImageComponentStyle({
    this.height,
    this.width,
    this.scale,
    this.cornerRadius,
    this.padding,
    // this.padding,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'height': height,
      'width': width,
      'scale': scale,
      'cornerRadius': cornerRadius,
      'padding': padding?.toMap(),
    };
  }

  factory NetworkImageComponentStyle.fromMap(Map<String, dynamic> map) {
    return NetworkImageComponentStyle(
      height: map['height'] != null ? map['height'] as num : null,
      width: map['width'] != null ? map['width'] as num : null,
      scale: map['scale'] != null ? map['scale'] as String : null,
      cornerRadius:
          map['cornerRadius'] != null ? map['cornerRadius'] as num : null,
      padding: map['padding'] != null
          ? PaddingBuilder.fromMap(map['padding'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NetworkImageComponentStyle.fromJson(String source) =>
      NetworkImageComponentStyle.fromMap(
          json.decode(source) as Map<String, dynamic>);
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
