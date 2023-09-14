import 'package:design_system/check_box/loutra_check_box.dart';
import 'package:design_system/color/lotura_color.dart';
import 'package:flutter/material.dart';

class LoturaCheckBoxView extends StatefulWidget {
  const LoturaCheckBoxView({super.key});

  @override
  State<LoturaCheckBoxView> createState() => _LoturaCheckBoxViewState();
}

class _LoturaCheckBoxViewState extends State<LoturaCheckBoxView> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LoturaColor.gray100,
      body: Center(
        child: LoturaCheckBox(
          isSelected: isSelected,
          onPressed: () => setState(() => isSelected = !isSelected),
        ),
      ),
    );
  }
}
