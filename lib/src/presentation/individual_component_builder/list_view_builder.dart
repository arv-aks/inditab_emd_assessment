import 'package:flutter/material.dart';
import 'package:inditab_emd_assessment/src/core/component.dart';
import 'package:inditab_emd_assessment/src/core/model/core.dart';
import 'package:inditab_emd_assessment/src/core/model/individual_component_model/list_view_component.dart';
import 'package:inditab_emd_assessment/src/presentation/component_builder.dart';

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({super.key, this.iComponent});

  final IComponent? iComponent;

  @override
  Widget build(BuildContext context) {
    final data = iComponent?.data as Multiple;

    final style = iComponent?.style as ListViewComponentStyle;

    final scrollDirection =
        style.scrollDirection == "horizontal" ? Axis.horizontal : Axis.vertical;
    final spacing = style.spacing?.toDouble() ?? 0.0;
    final shrinkWrap = style.shrinkWrap;

    return Padding(
        padding: style.padding.paddingBuilderToEdgeInsets(),
        child: ListView.separated(
          shrinkWrap: shrinkWrap ?? false,
          scrollDirection: scrollDirection,
          itemCount: data.dataList.length,
          itemBuilder: (context, index) {
            return ComponentBuilder(iComponent: data.dataList[index]);
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: scrollDirection == Axis.horizontal ? spacing : 0.0,
              height: scrollDirection == Axis.vertical ? spacing : 0.0,
            );
          },
        ));
  }
}
