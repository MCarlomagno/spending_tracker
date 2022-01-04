import 'package:flutter/material.dart';
import 'package:spending_tracker/services/authentication_service.dart';
import 'package:spending_tracker/widgets/shared/app_button.dart';
import 'package:spending_tracker/widgets/shared/app_text_field.dart';

import '../../setup.dart';

class AuthenticationView extends StatefulWidget {
  const AuthenticationView({Key? key}) : super(key: key);

  @override
  _AuthenticationViewState createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> {
  final _authenticationService = getIt<AuthenticationService>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextField(
              margin: EdgeInsets.all(10),
              controller: _emailController,
              labelText: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            AppTextField(
              margin: EdgeInsets.all(10),
              controller: _passwordController,
              labelText: 'Password',
              obscureText: true,
            ),
            AppButton(
              margin: EdgeInsets.all(10),
              child: Text('Get in'),
              onPressed: () => _authenticationService.signUpWithEmail(
                email: _emailController.text,
                password: _passwordController.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
