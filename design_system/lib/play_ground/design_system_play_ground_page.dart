import 'package:design_system/color/lotura_color.dart';
import 'package:flutter/material.dart';

class DesignSystemPlayGroundPage extends StatelessWidget {
  DesignSystemPlayGroundPage({super.key});

  final List<String> components = [
    "bottom_sheet",
    "button",
    "check_box",
    "color",
    "icon",
    "image",
    "text_field"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LoturaColor.white,
      body: ListView.builder(
        itemCount: components.length,
        itemBuilder: (context, index) {
          return Text(components[index]);
        },
      ),
    );
  }
}
