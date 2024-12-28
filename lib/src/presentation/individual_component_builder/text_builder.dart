import 'package:flutter/material.dart';
import 'package:inditab_emd_assessment/src/core/component.dart';
import 'package:inditab_emd_assessment/src/core/model/core.dart';
import 'package:inditab_emd_assessment/src/core/model/individual_component_model/text_component.dart';

class TextBuilder extends StatelessWidget {
  const TextBuilder({super.key, this.iComponent});

  final IComponent? iComponent;

  @override
  Widget build(BuildContext context) {
    final data = iComponent?.data as Single;

    final textData = data.data as TextComponentData;
    final style = iComponent?.style as TextComponentStyle;

    return Text(
      textData.text,
      style: TextStyle(
        fontSize: style.fontSize?.toDouble(),
        fontWeight: style.fontWeight?.toFlutterFontWeight(),
        color: style.fontColor != null ? parseColor(style.fontColor!) : null,
      ),
    );
  }
}
