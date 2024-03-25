import 'package:coursestudy/util/theme.dart';
import 'package:flutter/material.dart';

class NavButton extends StatefulWidget {
  const NavButton(
      {Key? key,
      required this.title,
      required this.icondata,
      required this.onpressed})
      : super(key: key);

  final String title;
  final IconData icondata;
  final VoidCallback onpressed;

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onpressed,
      hoverColor: secondaryColor,
      splashColor: secondaryColor, // Define splash color here
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            isHovered = true;
          });
        },
        onExit: (event) {
          setState(() {
            isHovered = false;
          });
        },
        child: Container(
          // padding: const EdgeInsets.all(5),
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
          color: isHovered ? secondaryColor : primaryColor,

          // decoration: BoxDecoration(
          //   color: isHovered ? secondaryColor : primaryColor,
          // ),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                widget.icondata,
                size: 20,
                //color: secondaryColor,
                color: isHovered ? primaryColor : secondaryColor,
              ),
              Text(
                widget.title,
                style: TextStyle(
                    color: isHovered ? primaryColor : secondaryColor,
                    fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
