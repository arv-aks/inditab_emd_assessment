// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:inditab_emd_assessment/src/core/component.dart';
import 'package:inditab_emd_assessment/src/core/component_parser.dart';
import 'package:inditab_emd_assessment/src/core/model/core.dart';

class ListViewComponent implements IComponent {
  @override
  bool? isVisible;

  @override
  IComponentStyle? style;

  @override
  String? type;

  @override
  ComponentDataWrapper? data;

  ListViewComponent({
    this.isVisible,
    this.style,
    this.type,
    this.data,
  });

  factory ListViewComponent.fromMap(Map<String, dynamic> map) {
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

    return ListViewComponent(
        isVisible: map['isVisible'] != null ? map['isVisible'] as bool : null,
        style: map['style'] != null
            ? ListViewComponentStyle.fromMap(
                map['style'] as Map<String, dynamic>)
            : null,
        type: map['type'] != null ? map['type'] as String : null,
        data: dataWrapper);
  }
}

// TextComponentStyle Class
class ListViewComponentStyle implements IComponentStyle {
  final bool? shrinkWrap;
  final num? spacing;
  final PaddingBuilder? padding;
  final String? scrollDirection; //vertical or horizontal.
  ListViewComponentStyle({
    this.shrinkWrap,
    this.spacing,
    this.padding,
    this.scrollDirection,
  });

  // final EdgeInsets? padding;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'shrinkWrap': shrinkWrap,
      'spacing': spacing,
      'padding': padding?.toMap(),
      'scrollDirection': scrollDirection,
    };
  }

  factory ListViewComponentStyle.fromMap(Map<String, dynamic> map) {
    return ListViewComponentStyle(
      shrinkWrap: map['shrinkWrap'] != null ? map['shrinkWrap'] as bool : null,
      spacing: map['spacing'] != null ? map['spacing'] as num : null,
      padding: map['padding'] != null
          ? PaddingBuilder.fromMap(map['padding'] as Map<String, dynamic>)
          : null,
      scrollDirection: map['scrollDirection'] != null
          ? map['scrollDirection'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListViewComponentStyle.fromJson(String source) =>
      ListViewComponentStyle.fromMap(
          json.decode(source) as Map<String, dynamic>);

  ListViewComponentStyle copyWith({
    num? spacing,
    PaddingBuilder? padding,
    String? scrollDirection,
  }) {
    return ListViewComponentStyle(
      shrinkWrap: shrinkWrap ?? shrinkWrap,
      spacing: spacing ?? this.spacing,
      padding: padding ?? this.padding,
      scrollDirection: scrollDirection ?? this.scrollDirection,
    );
  }

  @override
  String toString() =>
      'ListViewComponentStyle(spacing: $spacing, padding: $padding, scrollDirection: $scrollDirection)';

  @override
  bool operator ==(covariant ListViewComponentStyle other) {
    if (identical(this, other)) return true;

    return other.spacing == spacing &&
        other.padding == padding &&
        other.scrollDirection == scrollDirection;
  }

  @override
  int get hashCode =>
      spacing.hashCode ^ padding.hashCode ^ scrollDirection.hashCode;
}
