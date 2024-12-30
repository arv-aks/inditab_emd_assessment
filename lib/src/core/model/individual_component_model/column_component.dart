// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inditab_emd_assessment/src/core/component.dart';
import 'package:inditab_emd_assessment/src/core/component_parser.dart';
import 'package:inditab_emd_assessment/src/core/model/core.dart';

class ColumnComponent implements IComponent {
  @override
  bool? isVisible;

  @override
  IComponentStyle? style;

  @override
  String? type;

  @override
  ComponentDataWrapper? data;

  ColumnComponent({
    this.isVisible,
    this.style,
    this.type,
    this.data,
  });

  factory ColumnComponent.fromMap(Map<String, dynamic> map) {
    // Parse the children components
    ComponentDataWrapper? dataWrapper;
    if (map['data'] != null && map['data']['children'] != null) {
      final children = map['data']['children'] as List;
      final childrenList = children.map<IComponent?>((item) {
        if (item != null) {
          final childType = item['type'] as String?;
          final childData = item['data'] as Map<String, dynamic>?;
          final childStyle = item['style'] as Map<String, dynamic>?;

          // Create the child component based on its type
          return getComponent(
            childType!,
            data: childData,
            style: childStyle,
            // action: childAction,
            // isVisible: item['isVisible'] as bool?,
          );
        }
        return null;
      }).toList();

      dataWrapper = Multiple<IComponent>(dataList: childrenList);
    }

    return ColumnComponent(
        isVisible: map['isVisible'] != null ? map['isVisible'] as bool : null,
        style: map['style'] != null
            ? ColumnComponentStyle.fromMap(map['style'] as Map<String, dynamic>)
            : null,
        type: map['type'] != null ? map['type'] as String : null,
        data: dataWrapper);
  }
}

// TextComponentStyle Class
class ColumnComponentStyle implements IComponentStyle {
  final num? spacing;
  final PaddingBuilder? padding;
  final String? horizontalAlignment;
  ColumnComponentStyle({
    this.spacing,
    this.padding,
    this.horizontalAlignment,
  });

  // final EdgeInsets? padding;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'spacing': spacing,
      'padding': padding?.toMap(),
      'horizontalAlignment': horizontalAlignment,
    };
  }

  factory ColumnComponentStyle.fromMap(Map<String, dynamic> map) {
    return ColumnComponentStyle(
      spacing: map['spacing'],
      padding: map['padding'] != null
          ? PaddingBuilder.fromMap(map['padding'] as Map<String, dynamic>)
          : null,
      horizontalAlignment: map['horizontalAlignment'] != null
          ? map['horizontalAlignment'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ColumnComponentStyle.fromJson(String source) =>
      ColumnComponentStyle.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension ColumnVerticalAlignmentExtension on String? {
  MainAxisAlignment toMainAxisAlignment() {
    switch (this) {
      case "sB":
        return MainAxisAlignment.spaceBetween;
      case "center":
        return MainAxisAlignment.center;
      case "sA":
        return MainAxisAlignment.spaceAround;
      case "sE":
        return MainAxisAlignment.spaceEvenly;
      case "end":
        return MainAxisAlignment.end;
      default:
        return MainAxisAlignment.start;
    }
  }
}
