import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:rocket_science_login/widgets/custom_buttons.dart';
import 'package:rocket_science_login/widgets/custom_textfield.dart';

class PasswordScreen extends StatefulWidget {
  final int dotPosition;
  final int dotCount;
  final dynamic Function() nextButton;
  final dynamic Function() backButton;
  final Function(String)? textFieldOnChanged;
  const PasswordScreen({
    super.key,
    required this.dotPosition,
    required this.dotCount,
    required this.nextButton,
    required this.backButton,
    required this.textFieldOnChanged,
  });

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7540EE),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xFF7540EE),
        title: const Text(
          'Sign up',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const Text(
                'Choose a password',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  height: 2,
                ),
              ),
              SizedBox(
                height: 300,
                child: Image.asset(
                  'assets/airy-biometric-authentication-and-lock-with-personal-data.png',
                ),
              ),
              const SizedBox(height: 42),
              CustomTextField(
                hinText: 'Password',
                onChanged: widget.textFieldOnChanged,
              ),
              const SizedBox(height: 32),
              DotsIndicator(
                dotsCount: widget.dotCount,
                position: widget.dotPosition,
                decorator: const DotsDecorator(
                  color: Colors.white38,
                  activeColor: Colors.white,
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.dotPosition == 0
                          ? Container()
                          : CustomTextButton(
                              text: 'Back',
                              onPressed: widget.backButton,
                            ),
                      CustomElevatedButton(
                        text: 'Next',
                        onPressed: widget.nextButton,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
