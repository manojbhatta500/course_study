import 'package:coursestudy/util/theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? buttonName;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final Color? textColor;
  const CustomButton(
      {super.key,
      this.buttonName,
      this.backgroundColor,
      this.onPressed,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: Size(MediaQuery.of(context).size.width, 44),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Text(
        buttonName!,
        style:
            Theme.of(context).textTheme.bodyLarge!.copyWith(color: textColor),
      ),
    );
  }
}
