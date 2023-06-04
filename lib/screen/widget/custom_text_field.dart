import 'package:flutter/material.dart';

Center customTextField(
    {TextEditingController? controller,
    String? hintText,
    BuildContext? context,
    FocusNode? focusNode,
    bool? autofocus}) {
  return Center(
    child: SizedBox(
      width: MediaQuery.of(context!).size.width - 40,
      child: TextField(
        focusNode: focusNode,
        autofocus: autofocus!,
        controller: controller,
        decoration: InputDecoration(
          fillColor: const Color(0xfff4edff),
          filled: true,
          hintText: hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
        ),
      ),
    ),
  );
}
