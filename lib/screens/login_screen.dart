import 'package:email_validator/email_validator.dart';
import 'package:flash_chat_starting_project/components/rounded_button.dart';

import '/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: SizedBox(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextFormField(
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter Your Email',
                  labelText: 'Email',
                ),
                onChanged: (value) {
                  //Do something with the user input
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email){
                  return email !=null && EmailValidator.validate(email) ? null :
                  'please enter a valid email address.';
                }
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration:kTextFieldDecoration.copyWith(
                hintText: 'Enter Your Password',
                labelText: 'Password',
              ),
              obscureText: true,
              onChanged: (value) {
                //Do something with the user input
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (password){
                return password != null && password.length > 5 ? null : 'The Password should be at least.';            },
            ),
            const SizedBox(
              height: 24.0,
            ),
            RoundedButton(title: 'Log In ', color: kLoginButtonColor, onPressed: (){},),
            const SizedBox(height: 12),
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
