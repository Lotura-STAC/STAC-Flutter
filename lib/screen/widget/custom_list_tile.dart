import 'package:flutter/material.dart';
import 'package:stac_flutter/common/common.dart';
import 'package:stac_flutter/screen/widget/custom_icons.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.title,
    required this.content,
    required this.deviceType,
  }) : super(key: key);

  final String title, content;
  final int deviceType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(width: 1),
        ),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.09,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                deviceType == 0
                    ? CustomIcons.washingMachine
                    : CustomIcons.dryer,
                size: 40,
                color: CustomColor.pointColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
