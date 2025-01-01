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
        child: scrollDirection == Axis.horizontal
            ? SingleChildScrollView(
                scrollDirection: scrollDirection,
                child: Row(
                  // mainAxisAlignment: style.horizontalAlignment.toMainAxisAlignment(),
                  children: List.generate(
                    data.dataList.length,
                    (index) {
                      return Row(
                        children: [
                          ComponentBuilder(
                            iComponent: data.dataList[index],
                          ),
                          SizedBox(
                            width: spacing,
                          )
                        ],
                      );
                    },
                  ),
                ),
              )
            : SingleChildScrollView(
                scrollDirection: scrollDirection,
                child: Column(
                  // mainAxisAlignment: style.horizontalAlignment.toMainAxisAlignment(),
                  children: List.generate(
                    data.dataList.length,
                    (index) {
                      return Column(
                        children: [
                          ComponentBuilder(
                            iComponent: data.dataList[index],
                          ),
                          SizedBox(
                            height: spacing,
                          )
                         
                        ],
                      );
                    },
                  ),
                ),
              ));

  }
}
