import 'package:flutter/material.dart';
import 'package:rocket_science_login/services/fire_auth.dart';
import 'package:rocket_science_login/widgets/custom_buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7540EE),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xFF7540EE),
        title: const Text(
          'HomeScreen',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Welcome',
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
              CustomElevatedButton(
                text: 'Logout',
                onPressed: () async {
                  await MyFireBase().signOutUser();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
