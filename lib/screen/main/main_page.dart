import 'dart:ui';

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
      duration: const Duration(milliseconds: 400),
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
    double mosw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              color: isClicked
                  ? Colors.grey.withOpacity(0.35)
                  : Colors.transparent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 70, right: 40),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: isClicked
                        ? MediaQuery.of(context).size.width * 0.615
                        : MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                      color: CustomColor.pointColor,
                      borderRadius: BorderRadius.circular(99.0),
                    ),
                    child: Column(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          height: isClicked ? mosw * 0.02 : 0,
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          width: isClicked ? mosw * 0.17 : mosw * 0.1,
                          height: isClicked ? mosw * 0.17 : mosw * 0.1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(99.0),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          height: isClicked ? mosw * 0.03 : 0,
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          width: isClicked ? mosw * 0.17 : mosw * 0.1,
                          height: isClicked ? mosw * 0.17 : mosw * 0.1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(99.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: RotationTransition(
                    turns: animation,
                    child: Transform.rotate(
                      angle: isClicked ? 1.5708 : 0,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isClicked = !isClicked;
                          });
                          controller.reset();
                          controller.forward();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.width * 0.2,
                          decoration: BoxDecoration(
                            color: CustomColor.pointColor,
                            borderRadius: BorderRadius.circular(99.0),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width * 0.14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
