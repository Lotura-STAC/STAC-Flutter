import 'package:design_system/color/lotura_color.dart';
import 'package:design_system/list_tile/lotura_list_tile.dart';
import 'package:flutter/material.dart';

class LoturaListTileView extends StatelessWidget {
  const LoturaListTileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LoturaColor.gray100,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoturaListTile(
              width: 382,
              height: 78,
              device: 1,
              text: "히히",
              status: 1,
            ),
            LoturaListTile(
              width: 382,
              height: 78,
              device: 0,
              text: "zzzzzzzzzz",
              status: 1,
            ),
            LoturaListTile(
              width: 382,
              height: 78,
              device: 1,
              text: "안녕하세요안녕하세요안녕하세요",
              status: 1,
            ),
          ],
        ),
      ),
    );
  }
}
