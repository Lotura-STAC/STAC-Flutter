import 'package:design_system/color/lotura_color.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class LoturaTextField extends StatefulWidget {
  LoturaTextField({
    super.key,
    required this.controller,
    this.autofocus = false,
    this.isPasswordTextField = false,
    this.obscureText = false,
    this.iconSize = 24,
    this.focusNode,
  });

  final TextEditingController controller;
  final bool autofocus, isPasswordTextField;
  final double iconSize;
  bool obscureText;
  final FocusNode? focusNode;

  @override
  State<LoturaTextField> createState() => _LoturaTextFieldState();
}

class _LoturaTextFieldState extends State<LoturaTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: widget.autofocus,
      controller: widget.controller,
      focusNode: widget.focusNode,
      cursorColor: LoturaColor.black,
      obscureText: widget.obscureText,
      maxLength: 20,
      decoration: InputDecoration(
        counterText: '',
        suffixIcon: widget.isPasswordTextField
            ? IconButton(
                color: LoturaColor.black,
                iconSize: widget.iconSize,
                onPressed: () =>
                    setState(() => widget.obscureText = !widget.obscureText),
                icon: Icon(widget.obscureText
                    ? FluentIcons.eye_24_regular
                    : FluentIcons.eye_off_24_regular),
              )
            : null,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: LoturaColor.primary700),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: LoturaColor.gray200),
        ),
      ),
    );
  }
}
