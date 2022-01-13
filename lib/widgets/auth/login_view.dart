import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spending_tracker/constants/dimensions.dart';
import 'package:spending_tracker/services/authentication_service.dart';
import 'package:spending_tracker/widgets/home/home.dart';
import 'package:spending_tracker/widgets/shared/app_button.dart';
import 'package:spending_tracker/widgets/shared/app_text_field.dart';
import 'package:spending_tracker/widgets/shared/circular_progress_button.dart';
import 'package:spending_tracker/widgets/shared/error_message.dart';
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
  bool _errored = false;
  bool _showPassword = false;
  String? _errorMsg = "";

  _togglePasswordVisibility() => setState(() => _showPassword = !_showPassword);

  _navigateToHome() => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );

  _login() async => _authenticationService.loginWithEmail(
      email: _emailController.text, password: _passwordController.text);

  _handleError(e) {
    print(e);
    if (e is FirebaseAuthException) {
      setState(() {
        _loading = false;
        _errored = true;
        _errorMsg = e.message;
      });
    }
  }

  _onSubmit() async {
    setState(() {
      _loading = true;
      _errored = false;
    });
    try {
      await _login();
      setState(() => _loading = false);
      _navigateToHome();
    } catch (e) {
      _handleError(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Icon passwordInputSuffix = Icon(Icons.visibility);
    if (_showPassword) {
      passwordInputSuffix = Icon(Icons.visibility_off);
    }

    Function()? onPressed = _onSubmit;
    Widget appButtonChild = Text('Log in');
    if (_loading) {
      appButtonChild = CircularProgressButton();
      onPressed = null;
    }

    double currentWidth = MediaQuery.of(context).size.width;
    double? _inputMaxWidth;
    if (currentWidth > Dimensions.m) {
      _inputMaxWidth = Dimensions.xs;
    }

    EdgeInsetsGeometry _inputMargin = EdgeInsets.all(10);
    EdgeInsetsGeometry _zeroPadding = EdgeInsets.all(0);

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextField(
            maxWidth: _inputMaxWidth,
            margin: _inputMargin.add(EdgeInsets.only(top: 20)),
            controller: _emailController,
            labelText: 'Email',
            keyboardType: TextInputType.emailAddress,
          ),
          AppTextField(
            maxWidth: _inputMaxWidth,
            margin: _inputMargin,
            controller: _passwordController,
            labelText: 'Password',
            obscureText: !_showPassword,
            suffix: IconButton(
              padding: _zeroPadding,
              splashRadius: 1,
              icon: passwordInputSuffix,
              onPressed: _togglePasswordVisibility,
            ),
          ),
          Visibility(
            child: ErrorMessage(
              message: _errorMsg,
            ),
            visible: _errored,
          ),
          AppButton(
            maxWidth: _inputMaxWidth,
            margin: _inputMargin,
            child: appButtonChild,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
