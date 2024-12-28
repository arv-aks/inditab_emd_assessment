// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:inditab_emd_assessment/src/core/component.dart';

class ComponentModel {
  List<IComponent?> myObject;
  ComponentModel({
    required this.myObject,
  });

  // Component Types as Constants
  static const String typeTEXT = "text";
  static const String typeROW = "row";
  static const String typeCOLUMN = "column";
  static const String typeNetworkImage = "networkImage";
  

  factory ComponentModel.fromMap(Map<String, dynamic> map) {
    return ComponentModel(
      myObject: List<IComponent?>.from(
        (map['children'] as List).map<IComponent?>(
          (x) => IComponent.fromMap(x as Map<String, dynamic>),
        ),
      ),
   
    );
  }

  @override
  String toString() => 'ComponentModel(myObject: $myObject)';
}
