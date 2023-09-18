import 'package:design_system/color/lotura_color.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoturaTextField extends StatefulWidget {
  LoturaTextField({
    super.key,
    required this.controller,
    this.autofocus = false,
    this.isPasswordTextField = false,
    this.obscureText = true,
    this.iconSize = 24,
    this.maxLength = 12,
    this.focusNode,
    this.hintText,
    this.filteringTextInputFormatter,
    this.hintTextStyle = const TextStyle(fontSize: 24),
  });

  final TextEditingController controller;
  final bool autofocus, isPasswordTextField;
  final double iconSize;
  final String? hintText;
  final TextStyle hintTextStyle;
  bool obscureText;
  final FocusNode? focusNode;
  final int maxLength;
  final FilteringTextInputFormatter? filteringTextInputFormatter;

  @override
  State<LoturaTextField> createState() => _LoturaTextFieldState();
}

class _LoturaTextFieldState extends State<LoturaTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: widget.filteringTextInputFormatter != null
          ? [widget.filteringTextInputFormatter!]
          : null,
      autofocus: widget.autofocus,
      controller: widget.controller,
      focusNode: widget.focusNode,
      cursorColor: LoturaColor.black,
      obscureText: widget.obscureText && widget.isPasswordTextField,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: widget.hintTextStyle,
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
