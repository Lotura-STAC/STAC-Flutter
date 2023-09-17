import 'package:design_system/icon/lotura_icons.dart';
import 'package:flutter/material.dart';

class LoturaIconView extends StatelessWidget {
  const LoturaIconView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(LoturaIcons.laundry),
            Icon(LoturaIcons.dry),
            Icon(LoturaIcons.working),
            Icon(LoturaIcons.list),
            Icon(LoturaIcons.breakdown),
            Icon(LoturaIcons.checkCircle),
            Icon(LoturaIcons.grid),
          ],
        ),
      ),
    );
  }
}
