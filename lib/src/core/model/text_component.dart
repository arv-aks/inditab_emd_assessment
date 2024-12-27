import 'package:inditab_emd_assessment/src/core/component.dart';

class TextComponent implements IComponent {
  @override
  bool? isVisible;

  @override
  IComponentStyle? style;

  @override
  String? type;

  @override
  IComponentData? data;
}

// TextComponentData class
class TextComponentData implements IComponentData {
  final String text;

  TextComponentData({required this.text});
}

// TextComponentStyle Class
class TextComponentStyle implements IComponentStyle {
  final int? fontSize;
  final String? fontColor;
  final String? fontColorDark;
  final String? fontWeight;
  final int? maxLines;
  // final EdgeInsets? padding;

  TextComponentStyle({
    this.fontSize,
    this.fontColor,
    this.fontColorDark,
    this.fontWeight,
    this.maxLines,
    // this.padding,
  });
}
