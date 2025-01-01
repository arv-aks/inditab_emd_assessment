import 'package:inditab_emd_assessment/src/core/component.dart';
import 'package:inditab_emd_assessment/src/core/model/component_model.dart';
import 'package:inditab_emd_assessment/src/core/model/individual_component_model/column_component.dart';
import 'package:inditab_emd_assessment/src/core/model/individual_component_model/container_component.dart';
import 'package:inditab_emd_assessment/src/core/model/individual_component_model/list_view_component.dart';
import 'package:inditab_emd_assessment/src/core/model/individual_component_model/network_image_component.dart';
import 'package:inditab_emd_assessment/src/core/model/individual_component_model/row_component.dart';
import 'package:inditab_emd_assessment/src/core/model/individual_component_model/spacer_component.dart';
import 'package:inditab_emd_assessment/src/core/model/individual_component_model/text_component.dart';

class JsonDeserializer {
  ComponentModel deserialize(Map<String, dynamic>? json) {
    if (json == null) return ComponentModel(myObject: []);

    final dataObject = json['children'] as List<dynamic>?;
    final List<IComponent?> componentList = [];

    final component = parseComponent(
      dataObject?.isEmpty == true
          ? null
          : dataObject?.first as Map<String, dynamic>?,
    );
    if (component != null) componentList.add(component);

    return ComponentModel(myObject: componentList);
  }

  IComponent? parseComponent(Map<String, dynamic>? data) {
    if (data == null) return null;

    final type = data['type'] as String?;
    final componentData = data['data'] as Map<String, dynamic>?;
    final componentStyle = data['style'] as Map<String, dynamic>?;
    // final componentAction = data['action'] as Map<String, dynamic>?;
    final isComponentVisible = data['isVisible'] as bool? ?? true;

    return type != null
        ? getComponent(
            type,
            data: componentData,
            style: componentStyle,
            // action: componentAction,
            isVisible: isComponentVisible,
          )
        : null;
  }
}

IComponent? getComponent(
  String type, {
  Map<String, dynamic>? data,
  Map<String, dynamic>? style,
  // Map<String, dynamic>? action,
  bool isVisible = false,
}) {

  switch (type) {

    case ComponentModel.typeTEXT:
      final textComponentData =
          data != null ? TextComponentData.fromMap(data) : null;
      final textComponentStyle =
          style != null ? TextComponentStyle.fromMap(style) : null;

      return TextComponent(
        isVisible: isVisible,
        type: type,
        data: Single(data: textComponentData),
        style: textComponentStyle,
      );

    case ComponentModel.typeROW:
      final rowComponentStyle =
          style != null ? RowComponentStyle.fromMap(style) : null;

      final children = data?['children'] as List;
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

      return RowComponent(
        isVisible: isVisible,
        type: type,
        data: Multiple(dataList: childrenList),
        style: rowComponentStyle,
      );

    case ComponentModel.typeCOLUMN:
      final columnComponentStyle =
          style != null ? ColumnComponentStyle.fromMap(style) : null;

      final children = data?['children'] as List;
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

      return ColumnComponent(
        isVisible: isVisible,
        type: type,
        data: Multiple(dataList: childrenList),
        style: columnComponentStyle,
      );

    case ComponentModel.typeNetworkImage:
      final networkImageComponentData =
          data != null ? NetworkImageComponentData.fromMap(data) : null;
      final networkImageComponentStyle =
          style != null ? NetworkImageComponentStyle.fromMap(style) : null;

      return TextComponent(
        isVisible: isVisible,
        type: type,
        data: Single(data: networkImageComponentData),
        style: networkImageComponentStyle,
      );

    case ComponentModel.typeListview:
      final listViewComponentStyle =
          style != null ? ListViewComponentStyle.fromMap(style) : null;

      final children = data?['children'] as List;
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

      return ListViewComponent(
        isVisible: isVisible,
        type: type,
        data: Multiple(dataList: childrenList),
        style: listViewComponentStyle,
      );
    case ComponentModel.typeContainer:
      final containerComponentStyle =
          style != null ? ContainerComponentStyle.fromMap(style) : null;

      final children = data?['children'] as List;
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

      return ContainerComponent(
        isVisible: isVisible,
        type: type,
        data: Multiple(dataList: childrenList),
        style: containerComponentStyle,
      );

    case ComponentModel.typeSpacer:
      return SpacerComponent(
        isVisible: isVisible,
        type: type,
        data: null,
        style: null,
      );

    default:
      return null;
  }
}
