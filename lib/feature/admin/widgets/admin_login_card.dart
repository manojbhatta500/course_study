import 'package:coursestudy/feature/user/pages/user_screen/user_details.dart';
import 'package:coursestudy/util/custom_text_form_field.dart';
import 'package:coursestudy/util/theme.dart';
import 'package:flutter/material.dart';

class AdminLoginCard extends StatelessWidget {
  const AdminLoginCard({super.key});

  @override
  Widget build(BuildContext context) {
    bool desktopScreen = MediaQuery.of(context).size.width > 600;
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Login",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: primaryColor),
        ),
        const CustomTextFormField(
          hintText: "Id",
          fillColor: primaryColor,
          keyBoardType: TextInputType.text,
        ),
        SizedBox(
          height: 30,
        ),
        const CustomTextFormField(
          hintText: "Password",
          obscure: true,
          fillColor: primaryColor,
          keyBoardType: TextInputType.text,
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            minimumSize: Size(MediaQuery.of(context).size.width, 44),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Text(
            "Check",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
