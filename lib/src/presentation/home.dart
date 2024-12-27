import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:inditab_emd_assessment/src/constants/constants.dart';
import 'package:inditab_emd_assessment/src/domain/api_provider.dart';
import 'package:inditab_emd_assessment/src/presentation/widgets/custom_loader.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _dio = ApiProvider.getDio();

  Future<dynamic> getData() async {
    final result = await _dio.get(Constants.baseUrl);
    Fluttertoast.showToast(msg: "result: $result");

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text("data loaded");
            }

            return const CustomLoader();
          },
        ),
      ),
    );
  }
}
