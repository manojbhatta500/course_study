import 'package:coursestudy/feature/user/user_screen/user_details.dart';
import 'package:coursestudy/util/custom_text_form_field.dart';
import 'package:coursestudy/util/theme.dart';
import 'package:flutter/material.dart';

class UserScreenLogin extends StatelessWidget {
  const UserScreenLogin({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    bool desktopScreen = MediaQuery.of(context).size.width > 600;
    bool mobileScreen = MediaQuery.of(context).size.width > 600;
    double width = MediaQuery.of(context).size.width;

    return Card(
      margin: EdgeInsetsDirectional.symmetric(
          horizontal: desktopScreen ? width * 0.3 : width * 0.1,
          vertical: desktopScreen ? height * 0.2 : height * 0.1),
      color: secondaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "You can search users details",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: primaryColor),
              ),
              const CustomTextFormField(
                hintText: "Search...",
                prefixIcon: Icon(
                  Icons.search,
                  color: secondaryColor,
                ),
                fillColor: primaryColor,
                keyBoardType: TextInputType.text,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const UserDetails()));
                },
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
          ),
        ),
      ),
    );
  }
}
