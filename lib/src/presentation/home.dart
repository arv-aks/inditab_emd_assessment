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

  bool isLoading = false;
  String error = "";

  ComponentModel? componentModel;

  @override
  initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        getData();
      },
    );
  }

  Future<dynamic> getData() async {
    setState(() {
      isLoading = true;
      error = "";
    });
    componentModel = null;
    final response = await _dio.get(Constants.baseUrl);
    Fluttertoast.showToast(msg: "result: ${response.data}");

    debugPrint("--> response: ${response.data}", wrapWidth: 1024);

    try {
      componentModel = JsonDeserializer().deserialize(response.data);

    debugPrint("--> response component type: ${componentModel?.myObject.first?.type}", wrapWidth: 1024);

    } catch (e) {
      print("-->errro: $e");
      setState(() {
        error = e.toString();
      });
    }

    setState(() {
      isLoading = false;
    });

    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () async {
                getData();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: SafeArea(
        child: Center(
            child: isLoading
                ? const CustomLoader()
                : error.isNotEmpty
                    ? Text(error, style: const TextStyle(color: Colors.black),)
                    : ComponentBuilder(
                        iComponent: componentModel?.myObject.first,
                      )),
      ),
    );
  }
}
