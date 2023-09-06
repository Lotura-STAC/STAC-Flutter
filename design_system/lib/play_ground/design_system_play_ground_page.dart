import 'package:design_system/bottom_sheet/lotura_bottom_sheet_view.dart';
import 'package:design_system/button/lotura_buttom_view.dart';
import 'package:design_system/check_box/lotura_check_box_view.dart';
import 'package:design_system/color/lotura_color.dart';
import 'package:design_system/color/lotura_color_view.dart';
import 'package:design_system/icon/lotura_icon_view.dart';
import 'package:design_system/image/lotura_image_view.dart';
import 'package:design_system/text_field/lotura_text_field_view.dart';
import 'package:flutter/material.dart';

class DesignSystemPlayGroundPage extends StatelessWidget {
  const DesignSystemPlayGroundPage({super.key});

  final List<String> componentList = const [
    "bottom_sheet",
    "button",
    "check_box",
    "color",
    "icon",
    "image",
    "text_field"
  ];

  final Map<String, Widget> components = const {
    "bottom_sheet": LoturaBottomSheetView(),
    "button": LoturaButtonView(),
    "check_box": LoturaCheckBoxView(),
    "color": LoturaColorView(),
    "icon": LoturaIconView(),
    "image": LoturaImageView(),
    "text_field": LoturaTextFieldView()
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LoturaColor.white,
      body: ListView.builder(
        itemCount: componentList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => components[componentList[index]]!)),
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                Text(
                  componentList[index],
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                Divider(
                  color: LoturaColor.black,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
