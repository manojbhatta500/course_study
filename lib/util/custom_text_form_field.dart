import 'package:coursestudy/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool obscure;
  final Widget? prefixIcon;
  final IconButton? sufixIcon;
  final Color? fillColor;
  final bool? readOnly;
  final int? maxLines;
  final TextInputType? keyBoardType;
  final int? maxLength;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.controller,
    this.validator,
    this.keyboardType,
    this.obscure = false,
    this.prefixIcon,
    this.sufixIcon,
    this.fillColor,
    this.readOnly = false,
    this.maxLines,
    this.keyBoardType,
    this.maxLength = 500,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: secondaryColor,
      obscureText: obscure,
      style: lightTheme(context).textTheme.labelLarge,
      keyboardType: keyboardType,
      controller: controller,
      readOnly: readOnly!,
      inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
      decoration: InputDecoration(
        prefix: prefixIcon,
        suffix: sufixIcon,
        alignLabelWithHint: true,
        filled: true,
        //fillColor: fillColor,
        fillColor: primaryColor,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
        hintText: hintText,
        hintStyle: lightTheme(context)
            .textTheme
            .labelMedium!
            .copyWith(color: secondaryColor),

        enabled: true,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
    );
  }
}
