import 'package:flutter/material.dart';
import 'package:inditab_emd_assessment/src/core/component.dart';
import 'package:inditab_emd_assessment/src/core/model/core.dart';
import 'package:inditab_emd_assessment/src/core/model/individual_component_model/container_component.dart';

import 'package:inditab_emd_assessment/src/presentation/component_builder.dart';

class ContainerBuilder extends StatelessWidget {
  const ContainerBuilder({super.key, this.iComponent});

  final IComponent? iComponent;

  @override
  Widget build(BuildContext context) {
    final data = iComponent?.data as Multiple;
    final child = data.dataList.first;

    final style = iComponent?.style as ContainerComponentStyle;
    return Padding(
      padding: style.padding.paddingBuilderToEdgeInsets(),
      child: Container(
        height: style.height?.toDouble(),
        width: style.width?.toDouble(),
        padding: style.innerPadding.paddingBuilderToEdgeInsets(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              style.border?.borderRadius?.toDouble() ?? 0.0),
          color: style.backgroundColor != null
              ? parseColor(style.backgroundColor!)
              : null,
        ),
        alignment: style.alignment == "center" ? Alignment.center : null,
        child: ComponentBuilder(
          iComponent: child,
        ),
      ),
    );
  }
}
