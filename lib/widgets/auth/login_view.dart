import 'package:flutter/material.dart';
import 'package:spending_tracker/services/authentication_service.dart';
import 'package:spending_tracker/widgets/home/home.dart';
import 'package:spending_tracker/widgets/shared/app_button.dart';
import 'package:spending_tracker/widgets/shared/app_text_field.dart';
import '../../setup.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _authenticationService = getIt<AuthenticationService>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _loading = false;

  _onSubmit() async {
    setState(() => _loading = true);
    try {
      await _authenticationService.loginWithEmail(
        email: _emailController.text,
        password: _passwordController.text,
      );
      setState(() => _loading = false);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ),
      );
    } catch (e) {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: _loading
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                )
              : Text('Log in'),
          onPressed: _loading ? null : _onSubmit,
        ),
      ],
    );
  }
}
