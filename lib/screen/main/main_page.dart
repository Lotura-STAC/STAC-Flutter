import 'package:flutter/material.dart';
import 'package:stac_flutter/common/common.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width * 0.18,
        height: MediaQuery.of(context).size.width * 0.18,
        child: FloatingActionButton(
          backgroundColor: CustomColor.pointColor,
          onPressed: () {},
          child: Icon(
            Icons.add,
            size: MediaQuery.of(context).size.width * 0.11,
          ),
        ),
      ),
    );
  }
}
