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
      body: Padding(
        padding: const EdgeInsets.only(bottom: 70, right: 40),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: MediaQuery.of(context).size.width * 0.18,
                height: isClicked
                    ? MediaQuery.of(context).size.width * 0.6
                    : MediaQuery.of(context).size.width * 0.18,
                decoration: BoxDecoration(
                  color: CustomColor.pointColor,
                  borderRadius: BorderRadius.circular(99.0),
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
                      if (!controller.isAnimating) {
                        setState(() {
                          isClicked = !isClicked;
                        });
                        controller.reset();
                        controller.forward();
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
            ),
          ],
        ),
      ),
    );
  }
}
