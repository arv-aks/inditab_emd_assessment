import 'package:flutter/material.dart';
import 'package:inditab_emd_assessment/src/core/component.dart';
import 'package:inditab_emd_assessment/src/core/model/core.dart';
import 'package:inditab_emd_assessment/src/presentation/component_builder.dart';
import 'package:inditab_emd_assessment/src/core/model/individual_component_model/row_component.dart';

class RowBuilder extends StatelessWidget {
  const RowBuilder({super.key, this.iComponent});

  final IComponent? iComponent;

  @override
  Widget build(BuildContext context) {
    final data = iComponent?.data as Multiple;
    final style = iComponent?.style as RowComponentStyle;

    return Padding(
      padding: style.padding.paddingBuilderToEdgeInsets(),
      child: Row(
        mainAxisAlignment: style.horizontalAlignment.toMainAxisAlignment(),
        children: List.generate(
          data.dataList.length,
          (index) {
            return ComponentBuilder(
              iComponent: data.dataList[index],
            );
          },
        ),
      ),
    );
  }
}
