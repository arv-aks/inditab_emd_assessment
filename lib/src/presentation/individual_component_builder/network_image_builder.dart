import 'package:flutter/material.dart';
import 'package:inditab_emd_assessment/src/core/component.dart';
import 'package:inditab_emd_assessment/src/core/model/core.dart';
import 'package:inditab_emd_assessment/src/core/model/individual_component_model/network_image_component.dart';
import 'package:inditab_emd_assessment/src/presentation/widgets/custom_loader.dart';

class NetworkImageBuilder extends StatelessWidget {
  const NetworkImageBuilder({super.key, this.iComponent});

  final IComponent? iComponent;

  @override
  Widget build(BuildContext context) {
    final data = iComponent?.data as Single;

    final imageUrl = data.data as NetworkImageComponentData;
    final style = iComponent?.style as NetworkImageComponentStyle;

    return Padding(
      padding: style.padding.paddingBuilderToEdgeInsets(),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
            Radius.circular(style.cornerRadius?.toDouble() ?? 0.0)),
        child: Image.network(
          imageUrl.text,
          loadingBuilder: (___, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return CustomLoader(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            );
          },
          height: style.height?.toDouble(),
          width: style.width?.toDouble(),
        ),
      ),
    );
  }
}
