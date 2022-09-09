import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final bool? isEnable, isObscure;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final FocusNode? node;
  final void Function(String)? onFieldSubmit, onChange;
  final String? Function(String?)? validator;
  final TextInputAction? inputAction;
  final bool? readOnly;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final Function()? onTap;
  final VoidCallback? onPressedLeadingIcon;
  final String? labelText;
  final double? padding;
  final int? maxLines;
  final String? initialValue;
  final Color? cursorColor;
  final String? headerText;

  CustomTextFormField(
      {this.validator,
      this.initialValue,
      this.headerText,
      this.cursorColor,
      this.inputAction,
      this.isEnable = true,
      this.isObscure = false,
      this.onFieldSubmit,
      this.prefixWidget,
      this.hintText,
      this.inputType,
      this.controller,
      this.node,
      this.onChange,
      this.onTap,
      this.suffixWidget,
      this.readOnly = false,
      this.onPressedLeadingIcon,
      this.labelText,
      this.maxLines = 1,
      this.padding = 0.0});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headerText != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(headerText!,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500)),
              )
            : const SizedBox(),
        Stack(
          children: [
            TextFormField(
              style: const TextStyle(fontSize: 15.0, color: Colors.black),
              cursorColor: Colors.black,
              onTap: onTap,
              enabled: isEnable,
              obscureText: isObscure!,
              focusNode: node,
              onFieldSubmitted: onFieldSubmit,
              initialValue: initialValue,
              controller: controller,
              textInputAction: inputAction,
              keyboardType: inputType,
              maxLines: maxLines,
              readOnly: readOnly!,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  prefixIcon: prefixWidget,
                  hintText: hintText,
                  labelText: labelText,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  labelStyle:
                      const TextStyle(color: Colors.black12, fontSize: 25.0),
                  hintStyle:
                      const TextStyle(color: Colors.grey, fontSize: 14.0),
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
              onChanged: onChange ?? (String value) {},
              onSaved: (String? val) {
                controller!.text = val!;
              },
            ),
            suffixWidget != null
                ? Align(alignment: Alignment.centerRight, child: suffixWidget)
                : const SizedBox()
          ],
        ),
      ],
    );
  }
}
