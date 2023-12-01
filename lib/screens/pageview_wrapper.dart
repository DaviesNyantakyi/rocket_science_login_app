import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rocket_science_login/screens/date_of_birth_screen.dart';
import 'package:rocket_science_login/screens/email_screen.dart';
import 'package:rocket_science_login/screens/home_screen.dart';
import 'package:rocket_science_login/screens/name_screen.dart';
import 'package:rocket_science_login/screens/password_screen.dart';
import 'package:rocket_science_login/services/fire_auth.dart';

class PageViewWrapper extends StatefulWidget {
  const PageViewWrapper({super.key});

  @override
  State<PageViewWrapper> createState() => _PageViewWrapperState();
}

class _PageViewWrapperState extends State<PageViewWrapper> {
  int currentPage = 0;
  int pageCount = 4;
  final PageController _controller = PageController();
  Duration animationduration = const Duration(milliseconds: 300);
  final Curve animationCurve = Curves.easeIn;
  final MyFireBase _myFireBase = MyFireBase();
  String? name;
  String? email;
  String? dateofBirth;
  String? password;

  Future<void> createAccount() async {
    if (email != null && password != null) {
      await _myFireBase.signUpWithEmailPassword(
        email: email!,
        password: password!,
      );
    }
    if (name != null && dateofBirth != null) {
      await _myFireBase.storeUserInfo(
        name: name,
        dateofBirth: dateofBirth,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      onPageChanged: (value) {
        currentPage = value;
        setState(() {});
      },
      children: [
        NameScreen(
          dotCount: pageCount,
          dotPosition: currentPage,
          backButton: () {
            _controller.previousPage(
              duration: animationduration,
              curve: animationCurve,
            );
          },
          nextButton: () {
            _controller.nextPage(
              duration: animationduration,
              curve: animationCurve,
            );
          },
          textFieldOnChanged: (value) {
            name = value;
            setState(() {});
          },
        ),
        EmailScreen(
          dotCount: pageCount,
          dotPosition: currentPage,
          backButton: () {
            _controller.previousPage(
              duration: animationduration,
              curve: animationCurve,
            );
          },
          nextButton: () {
            _controller.nextPage(
              duration: animationduration,
              curve: animationCurve,
            );
          },
          textFieldOnChanged: (value) {
            setState(() {
              email = value;
            });
          },
        ),
        PasswordScreen(
          dotPosition: currentPage,
          dotCount: pageCount,
          nextButton: () {
            _controller.nextPage(
              duration: animationduration,
              curve: animationCurve,
            );
          },
          backButton: () {
            _controller.previousPage(
              duration: animationduration,
              curve: animationCurve,
            );
          },
          textFieldOnChanged: (value) {
            password = value;
            setState(() {});
          },
        ),
        DateOFBirthScreen(
          dotCount: pageCount,
          dotPosition: currentPage,
          backButton: () {
            _controller.previousPage(
              duration: animationduration,
              curve: animationCurve,
            );
          },
          nextButton: () async {
            await createAccount();

            if (FirebaseAuth.instance.currentUser?.uid != null) {
              _controller.nextPage(
                duration: animationduration,
                curve: animationCurve,
              );
            }
          },
          textFieldOnchanged: (value) {
            setState(() {
              dateofBirth = value;
            });
          },
        ),
      ],
    );
  }
}
