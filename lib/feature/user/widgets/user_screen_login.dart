import 'package:coursestudy/feature/user/bloc/user_event.dart';
import 'package:coursestudy/feature/user/model/user_model.dart';
import 'package:coursestudy/feature/user/user_screen/user_details.dart';
import 'package:coursestudy/util/custom_text_form_field.dart';
import 'package:coursestudy/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_bloc.dart';
import '../bloc/user_state.dart';

class UserScreenLogin extends StatefulWidget {
  const UserScreenLogin({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  State<UserScreenLogin> createState() => _UserScreenLoginState();
}

class _UserScreenLoginState extends State<UserScreenLogin> {
  final TextEditingController _idController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool desktopScreen = MediaQuery.of(context).size.width > 600;
    bool mobileScreen = MediaQuery.of(context).size.width > 600;
    double width = MediaQuery.of(context).size.width;

    return Card(
      margin: EdgeInsetsDirectional.symmetric(
          horizontal: desktopScreen ? width * 0.3 : width * 0.1,
          vertical: desktopScreen ? widget.height * 0.2 : widget.height * 0.1),
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
              CustomTextFormField(
                controller: _idController,
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
              BlocListener<UserBloc, UserState>(
                listener: (context, state) {
                  if (state is LoadingUserState) {
                    Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ErrorUserState) {
                    Text("error found ");
                  } else if (state is SuccessUserState) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UserDetails(
                              id: _idController.text,
                              userModel: state.userModel,
                            )));
                  } else {
                    Container();
                  }
                },
                child: ElevatedButton(
                  onPressed: () {
                    context
                        .read<UserBloc>()
                        .add(FetchUserEvent(_idController.text));
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
