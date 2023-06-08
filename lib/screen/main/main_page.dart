import 'dart:math';
import 'package:flutter/material.dart';
import 'package:stac_flutter/common/common.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  bool isClicked = false;
  late final AnimationController controller;

  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    animation = Tween<double>(
      begin: 0,
      end: -0.25,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: MediaQuery.of(context).size.width * 0.18,
            height: MediaQuery.of(context).size.width * 0.18,
            decoration: BoxDecoration(
              color: CustomColor.pointColor,
              borderRadius: BorderRadius.circular(99.0),
            ),
          ),
          RotationTransition(
            turns: animation,
            child: Transform.rotate(
              angle: isClicked ? 1.5708 : 0,
              child: GestureDetector(
                onTap: () {
                  if (!controller.isAnimating) {
                    setState(() {
                      isClicked = !isClicked;
                    });
                    if (isClicked) {
                      controller.reset();
                      controller.forward();
                    }
                  }
                },
                child: Container(
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
