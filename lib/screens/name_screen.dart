import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:rocket_science_login/widgets/buttomsheet.dart';
import 'package:rocket_science_login/widgets/custom_buttons.dart';
import 'package:rocket_science_login/widgets/custom_textfield.dart';
import 'package:markdown/markdown.dart' as md;

class NameScreen extends StatefulWidget {
  final int dotPosition;
  final int dotCount;
  final dynamic Function() nextButton;
  final dynamic Function() backButton;
  final Function(String)? textFieldOnChanged;
  const NameScreen({
    super.key,
    required this.dotPosition,
    required this.dotCount,
    required this.nextButton,
    required this.backButton,
    required this.textFieldOnChanged,
  });

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
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
                'What is your name',
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
                  'assets/airy-multitasking-woman-working-in-virtual-world.png',
                ),
              ),
              const SizedBox(height: 42),
              CustomTextField(
                hinText: 'Name',
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
              const SizedBox(height: 24),
              RichText(
                text: TextSpan(
                  text: "By clicking Sign Up, you agree to our ",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Privacy Policy',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => showCustomBottomSheet(
                              context: context,
                              mdFile: 'assets/privacy_policy.md',
                            ),
                    ),
                    const TextSpan(
                      text: ' and',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text: ' Terms of Service.',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => showCustomBottomSheet(
                              context: context,
                              mdFile: 'assets/terms_of_service.md',
                            ),
                    ),
                  ],
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
