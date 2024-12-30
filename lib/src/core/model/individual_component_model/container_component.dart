// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:inditab_emd_assessment/src/core/component.dart';
import 'package:inditab_emd_assessment/src/core/component_parser.dart';
import 'package:inditab_emd_assessment/src/core/model/core.dart';

class ContainerComponent implements IComponent {
  @override
  bool? isVisible;

  @override
  IComponentStyle? style;

  @override
  String? type;

  @override
  ComponentDataWrapper? data;

  ContainerComponent({
    this.isVisible,
    this.style,
    this.type,
    this.data,
  });

  factory ContainerComponent.fromMap(Map<String, dynamic> map) {
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

    return ContainerComponent(
        isVisible: map['isVisible'] != null ? map['isVisible'] as bool : null,
        style: map['style'] != null
            ? ContainerComponentStyle.fromMap(
                map['style'] as Map<String, dynamic>)
            : null,
        type: map['type'] != null ? map['type'] as String : null,
        data: dataWrapper);
  }
}

// ContainerComponentStyle Class
class ContainerComponentStyle implements IComponentStyle {
  final num? height;
  final num? width;
  final PaddingBuilder? padding;
  final PaddingBuilder? innerPadding;
  final int? maxLines;
  final BorderBuilder? border;
  final String? backgroundColor;
  final String? alignment;
  // final EdgeInsets? padding;

  ContainerComponentStyle({
    // this.padding,
    this.height,
    this.width,
    this.padding,
    this.innerPadding,
    this.maxLines,
    this.border,
    this.backgroundColor,
    this.alignment,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'height': height,
      'width': width,
      'padding': padding?.toMap(),
      'innerPadding': innerPadding?.toMap(),
      'maxLines': maxLines,
      'border': border?.toMap(),
      'backgroundColor': backgroundColor,
      'alignment': alignment,
    };
  }

  factory ContainerComponentStyle.fromMap(Map<String, dynamic> map) {
    return ContainerComponentStyle(
      height: map['height'] != null ? map['height'] as num : null,
      width: map['width'] != null ? map['width'] as num : null,
      padding: map['padding'] != null ? PaddingBuilder.fromMap(map['padding'] as Map<String,dynamic>) : null,
      innerPadding: map['innerPadding'] != null ? PaddingBuilder.fromMap(map['innerPadding'] as Map<String,dynamic>) : null,
      maxLines: map['maxLines'] != null ? map['maxLines'] as int : null,
      border: map['border'] != null ? BorderBuilder.fromMap(map['border'] as Map<String,dynamic>) : null,
      backgroundColor: map['backgroundColor'] != null ? map['backgroundColor'] as String : null,
      alignment: map['alignment'] != null ? map['alignment'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContainerComponentStyle.fromJson(String source) =>
      ContainerComponentStyle.fromMap(
          json.decode(source) as Map<String, dynamic>);

  ContainerComponentStyle copyWith({
    num? height,
    num? width,
    PaddingBuilder? padding,
    PaddingBuilder? innerPadding,
    int? maxLines,
    BorderBuilder? border,
    String? backgroundColor,
    String? alignment,
  }) {
    return ContainerComponentStyle(
      height: height ?? this.height,
      width: width ?? this.width,
      padding: padding ?? this.padding,
      innerPadding: innerPadding ?? this.innerPadding,
      maxLines: maxLines ?? this.maxLines,
      border: border ?? this.border,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      alignment: alignment ?? this.alignment,
    );
  }

  @override
  String toString() {
    return 'ContainerComponentStyle(height: $height, width: $width, padding: $padding, innerPadding: $innerPadding, maxLines: $maxLines, border: $border, backgroundColor: $backgroundColor, alignment: $alignment)';
  }

  @override
  bool operator ==(covariant ContainerComponentStyle other) {
    if (identical(this, other)) return true;
  
    return 
      other.height == height &&
      other.width == width &&
      other.padding == padding &&
      other.innerPadding == innerPadding &&
      other.maxLines == maxLines &&
      other.border == border &&
      other.backgroundColor == backgroundColor &&
      other.alignment == alignment;
  }

  @override
  int get hashCode {
    return height.hashCode ^
      width.hashCode ^
      padding.hashCode ^
      innerPadding.hashCode ^
      maxLines.hashCode ^
      border.hashCode ^
      backgroundColor.hashCode ^
      alignment.hashCode;
  }
}
