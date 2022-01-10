import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spending_tracker/services/authentication_service.dart';
import 'package:spending_tracker/widgets/home/home.dart';
import 'package:spending_tracker/widgets/shared/app_button.dart';
import 'package:spending_tracker/widgets/shared/app_text_field.dart';
import 'package:spending_tracker/widgets/shared/error_message.dart';
import '../../setup.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _authenticationService = getIt<AuthenticationService>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  bool _loading = false;
  bool _errored = false;
  String? errorMsg = "";

  bool _showPassword = false;

  _togglePasswordVisibility() {
    setState(() => _showPassword = !_showPassword);
  }

  _onSubmit() async {
    setState(() {
      _loading = true;
      _errored = false;
    });
    try {
      await _authenticationService.signUpWithEmail(
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text,
      );
      setState(() => _loading = false);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ),
      );
    } catch (e) {
      print(e);
      if (e is FirebaseAuthException) {
        setState(() {
          _loading = false;
          _errored = true;
          errorMsg = e.message;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            obscureText: _showPassword,
            suffix: _showPassword
                ? IconButton(
                    padding: EdgeInsets.all(0),
                    splashRadius: 1,
                    icon: Icon(Icons.visibility),
                    onPressed: _togglePasswordVisibility,
                  )
                : IconButton(
                    padding: EdgeInsets.all(0),
                    splashRadius: 1,
                    icon: Icon(Icons.visibility_off),
                    onPressed: _togglePasswordVisibility,
                  ),
          ),
          AppTextField(
            margin: EdgeInsets.all(10),
            controller: _nameController,
            labelText: 'Name (Optional)',
          ),
          Visibility(
            child: ErrorMessage(
              message: errorMsg,
            ),
            visible: _errored,
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
                : Text('Create account'),
            onPressed: _loading ? null : _onSubmit,
          ),
        ],
      ),
    );
  }
}
