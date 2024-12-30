
import 'package:inditab_emd_assessment/src/core/component.dart';

class SpacerComponent implements IComponent {
  @override
  bool? isVisible;

  @override
  IComponentStyle? style;

  @override
  String? type;

  @override
  ComponentDataWrapper? data;

  SpacerComponent({
    this.isVisible,
    this.style,
    this.type,
    this.data,
  });

}
