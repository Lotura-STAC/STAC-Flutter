import 'package:flutter/material.dart';
import 'package:stac_flutter/common/common.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 700),
            curve: Curves.easeIn,
            width: MediaQuery.of(context).size.width * 0.18,
            height: MediaQuery.of(context).size.width * 0.18,
            decoration: BoxDecoration(
              color: CustomColor.pointColor,
              borderRadius: BorderRadius.circular(99.0),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.18,
            height: MediaQuery.of(context).size.width * 0.18,
            decoration: BoxDecoration(
              color: CustomColor.pointColor,
              borderRadius: BorderRadius.circular(99.0),
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: MediaQuery.of(context).size.width * 0.12,
            ),
          ),
        ],
      ),
    );
  }
}
