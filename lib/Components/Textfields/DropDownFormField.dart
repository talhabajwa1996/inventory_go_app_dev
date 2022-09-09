import 'package:flutter/material.dart';

class CustomDropDownFormField extends StatelessWidget {
  final String? hintText;
  final FocusNode? node;
  final String? Function(dynamic)? validator;
  final List<DropdownMenuItem<dynamic>>? items;
  final TextInputAction? inputAction;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final dynamic value;
  final void Function(dynamic)? onChanged;

  CustomDropDownFormField(
      {this.inputAction,
      this.prefixWidget,
      this.hintText,
      this.node,
      this.suffixWidget,
      this.onChanged,
      this.items,
      this.value,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<dynamic>(
      items: items,
      style: const TextStyle(fontSize: 15.0, color: Colors.black),
      focusNode: node,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          fillColor: Colors.white,
          prefixIcon: prefixWidget,
          hintText: hintText,
          labelStyle: const TextStyle(color: Colors.black12, fontSize: 25.0),
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14.0),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.4),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.4),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.4),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.4),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.4),
          ),
          errorStyle: const TextStyle(color: Colors.grey, height: 1.1),
          errorMaxLines: 3,
          // contentPadding: EdgeInsets.only(left: 10.0, top: padding),
          // fillColor: Colors.white,
          filled: true),
      validator: validator,
      value: value,
      onChanged: onChanged,
    );
  }
}
