import 'package:flutter/material.dart';
import 'package:spending_tracker/services/authentication_service.dart';
import 'package:spending_tracker/setup.dart';
import 'package:spending_tracker/widgets/auth/authentication_view.dart';
import 'package:spending_tracker/widgets/home/home.dart';

class StartUpView extends StatefulWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  _StartUpViewState createState() => _StartUpViewState();
}

class _StartUpViewState extends State<StartUpView> {
  final _authenticationService = getIt<AuthenticationService>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkUser();
  }

  _checkUser() async {
    await Future.delayed(Duration(seconds: 1));
    if (_authenticationService.isLoggedIn) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ),
      );
      return;
    }
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => AuthenticationView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
