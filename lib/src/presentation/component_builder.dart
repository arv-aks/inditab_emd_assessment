import 'package:flutter/material.dart';
import 'package:inditab_emd_assessment/src/core/component.dart';
import 'package:inditab_emd_assessment/src/core/model/component_model.dart';
import 'package:inditab_emd_assessment/src/presentation/individual_component_builder/column_builder.dart';
import 'package:inditab_emd_assessment/src/presentation/individual_component_builder/network_image_builder.dart';
import 'package:inditab_emd_assessment/src/presentation/individual_component_builder/row_builder.dart';
import 'package:inditab_emd_assessment/src/presentation/individual_component_builder/text_builder.dart';

class ComponentBuilder extends StatelessWidget {
  const ComponentBuilder({super.key, this.iComponent});

  final IComponent? iComponent;

  @override
  Widget build(BuildContext context) {
    final type = iComponent?.type;

    switch (type) {
      case ComponentModel.typeTEXT:
        return TextBuilder(iComponent: iComponent);
      case ComponentModel.typeROW:
        return RowBuilder(iComponent: iComponent);
      case ComponentModel.typeCOLUMN:
        return ColumnBuilder(iComponent: iComponent);
      case ComponentModel.typeNetworkImage:
        return NetworkImageBuilder(iComponent: iComponent);
    }

    return const SizedBox.shrink();
  }
}
