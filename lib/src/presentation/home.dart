import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:inditab_emd_assessment/src/constants/constants.dart';
import 'package:inditab_emd_assessment/src/presentation/component_builder.dart';
import 'package:inditab_emd_assessment/src/core/component_parser.dart';
import 'package:inditab_emd_assessment/src/core/model/component_model.dart';
import 'package:inditab_emd_assessment/src/domain/api_provider.dart';
import 'package:inditab_emd_assessment/src/presentation/widgets/custom_loader.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _dio = ApiProvider.getDio();

  ComponentModel? componentModel;

  Future<dynamic> getData() async {
    final response = await _dio.get(Constants.baseUrl);
    Fluttertoast.showToast(msg: "result: ${response.data}");

    try {
      componentModel = JsonDeserializer().deserialize(response.data);
    } catch (e) {
      print("-->errro: $e");
    }

    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print("--> snpshot: ${componentModel?.myObject.first?.type}");
                return ComponentBuilder(
                  iComponent: componentModel?.myObject.first,
                );
              }
        
              if (snapshot.hasData) {
                return Text("Error: ${snapshot.error}");
              }
        
              return const CustomLoader();
            },
          ),
        ),
      ),
    );
  }
}
