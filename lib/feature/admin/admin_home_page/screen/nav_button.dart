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
      splashColor: Colors.yellow, // Define splash color here
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
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color:
                isHovered ? const Color(0xffF5A331) : const Color(0xff868690),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                widget.icondata,
                size: 20,
                color: Colors.white,
              ),
              Text(
                widget.title,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
