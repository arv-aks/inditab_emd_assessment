import 'package:inditab_emd_assessment/src/core/model/component_model.dart';
import 'package:inditab_emd_assessment/src/core/model/individual_component_model/column_component.dart';
import 'package:inditab_emd_assessment/src/core/model/individual_component_model/container_component.dart';
import 'package:inditab_emd_assessment/src/core/model/individual_component_model/list_view_component.dart';
import 'package:inditab_emd_assessment/src/core/model/individual_component_model/network_image_component.dart';
import 'package:inditab_emd_assessment/src/core/model/individual_component_model/row_component.dart';
import 'package:inditab_emd_assessment/src/core/model/individual_component_model/text_component.dart';

abstract class IComponent {
  String? type;
  ComponentDataWrapper? data;
  IComponentStyle? style;
  bool? isVisible;

  // Factory for dynamic deserialization
  static IComponent? fromMap(Map<String, dynamic> map) {
    switch (map['type']) {
      case ComponentModel.typeTEXT:
        return TextComponent.fromMap(map);
      case ComponentModel.typeROW:
        return RowComponent.fromMap(map);
      case ComponentModel.typeCOLUMN:
        return ColumnComponent.fromMap(map);
      case ComponentModel.typeNetworkImage:
        return NetworkImageComponent.fromMap(map);
      case ComponentModel.typeListview:
        return ListViewComponent.fromMap(map);
      case ComponentModel.typeContainer:
        return ContainerComponent.fromMap(map);
      // // Add more cases as needed
      default:
        return null;
    }
  }
}

abstract class IComponentData {}

abstract class IComponentStyle {}

// Define the sealed class using the `sealed` keyword in Dart 3.0+
sealed class ComponentDataWrapper {
  const ComponentDataWrapper();
}

// Single subclass with data of type IComponentData
class Single extends ComponentDataWrapper {
  final IComponentData? data;

  const Single({this.data});
}

// Multiple subclass with a list of IComponent
class Multiple<T> extends ComponentDataWrapper {
  final List<IComponent?> dataList;

  const Multiple({required this.dataList});
}
