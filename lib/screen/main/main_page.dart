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
  late final TextEditingController textController;

  late final Animation<double> animation;

  List<String> list = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    textController = TextEditingController();
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
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double mosw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              color:
                  isClicked ? Colors.grey.withOpacity(0.8) : Colors.transparent,
            ),
          ),
          ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(list[index]),
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
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      insetPadding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      title: Column(
                                        children: [
                                          Text("세탁기 이름"),
                                          TextField(controller: textController),
                                        ],
                                      ),
                                      actions: [
                                        SizedBox(
                                          width: mosw - 50,
                                          height: mosw * 0.1,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  CustomColor.pointColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(99),
                                              ),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                list.add(textController.text);
                                              });
                                              textController.clear();
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              "확인",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ));
                            setState(() {
                              isClicked = false;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            width: isClicked ? mosw * 0.17 : mosw * 0.1,
                            height: isClicked ? mosw * 0.17 : mosw * 0.1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(99.0),
                            ),
                            child: const Center(
                              child: Text(
                                "세탁기",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          height: isClicked ? mosw * 0.03 : 0,
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      insetPadding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      title: Column(
                                        children: [
                                          Text("건조기 이름"),
                                          TextField(
                                            controller: textController,
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        SizedBox(
                                          width: mosw - 50,
                                          height: mosw * 0.1,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  CustomColor.pointColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(99),
                                              ),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                list.add(textController.text);
                                              });
                                              Navigator.pop(context);
                                              textController.clear();
                                            },
                                            child: const Text(
                                              "확인",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ));
                            setState(() {
                              isClicked = false;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            width: isClicked ? mosw * 0.17 : mosw * 0.1,
                            height: isClicked ? mosw * 0.17 : mosw * 0.1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(99.0),
                            ),
                            child: const Center(
                              child: Text(
                                "건조기",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
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
