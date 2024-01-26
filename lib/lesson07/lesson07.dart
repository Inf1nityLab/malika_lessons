import 'package:flutter/material.dart';
import 'package:malika_lessons/lesson05/lesson05.dart';
import 'package:malika_lessons/lesson07/widgets/elevated_button_widget.dart';
import 'package:malika_lessons/lesson07/widgets/text_field_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  List<String> name = const <String>[''];
  List<Widget> widgets = const <Widget>[];
  String names = 'Sign in';
  double height = 100;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String password = '123456';
  String email = 'qwerty';

  void signIn() {
    if (email == emailController.text && passwordController.text == password) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Lesson05()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email or password is wrong'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: height,
            ),
            Text(names),
            const Text('Login to your account'),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Container(
                height: 350,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Column(children: [
                    TextFieldWidget(
                      iconData: Icons.person,
                      text: 'Email',
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                      iconData: Icons.key,
                      iconDataOne: Icons.remove_red_eye,
                      text: 'Password',
                      controller: passwordController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButtonWidget(onPressed: () {
                      signIn();
                    }, text: 'Sign in'),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textField(IconData iconData, IconData iconDataOne) {
    return TextField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          prefixIcon: Icon(iconData),
          suffixIcon: Icon(iconDataOne)),
    );
  }

  String you(String avans) {
    return 'IT $avans';
  }



}
