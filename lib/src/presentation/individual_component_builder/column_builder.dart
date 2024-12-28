import 'package:flutter/material.dart';
import 'package:inditab_emd_assessment/src/core/component.dart';
import 'package:inditab_emd_assessment/src/core/model/core.dart';
import 'package:inditab_emd_assessment/src/presentation/component_builder.dart';
import 'package:inditab_emd_assessment/src/core/model/individual_component_model/column_component.dart';

class ColumnBuilder extends StatelessWidget {
  const ColumnBuilder({super.key, this.iComponent});

  final IComponent? iComponent;

  @override
  Widget build(BuildContext context) {
    final data = iComponent?.data as Multiple;

    final style = iComponent?.style as ColumnComponentStyle;

    return Padding(
      padding: style.padding.paddingBuilderToEdgeInsets(),
      child: Column(
        mainAxisAlignment: style.horizontalAlignment.toMainAxisAlignment(),
        children: List.generate(
          data.dataList.length,
          (index) {
            print("--> column bilder: ${data.dataList[index]?.type}");
            return ComponentBuilder(
              iComponent: data.dataList[index],
            );
          },
        ),
      ),
    );
  }
}
