import 'package:baemin_again/common/const/color.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final bool autofoucs;
  final bool obsecureText;
  final String? hintText;
  final String? errorText;
  final ValueChanged<String>? onChanged;

  const CustomTextFormField({
    this.autofoucs = false,
    this.obsecureText = false,
    this.hintText,
    this.errorText,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: INPUT_BORDER_COLOR,
        width: 1.0,
      ),
    );

    return TextFormField(
      cursorColor: PRIMARY_COLOR,
      autofocus: autofoucs,
      onChanged: onChanged,
      obscureText: obsecureText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: BODY_TEXT_COLOR,
          fontSize: 14.0,
        ),
        errorText: errorText,
        fillColor: INPUT_BG_COLOR,
        filled: true,
        border: baseBorder,
        enabledBorder: baseBorder.copyWith(
          borderSide: baseBorder.borderSide.copyWith(
            color: INPUT_BG_COLOR,
          ),
        ),
        focusedBorder: baseBorder.copyWith(
          borderSide: baseBorder.borderSide.copyWith(
            color: PRIMARY_COLOR,
          ),
        ),
      ),
    );
  }
}
