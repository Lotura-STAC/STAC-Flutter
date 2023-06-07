import 'package:flutter/material.dart';
import 'package:stac_flutter/common/common.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.focusNode,
    this.textInputType = TextInputType.text,
    this.autofocus = false,
  });

  TextEditingController controller;
  TextInputType textInputType;
  String? hintText;
  FocusNode? focusNode;
  bool autofocus;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 40,
        child: TextField(
          onChanged: (value) => setState(() {}),
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          keyboardType: widget.textInputType,
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.black),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: CustomColor.pointColor),
            ),
          ),
        ),
      ),
    );
  }
}
