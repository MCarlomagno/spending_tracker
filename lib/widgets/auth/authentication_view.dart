import 'package:flutter/material.dart';
import 'package:spending_tracker/widgets/auth/login_view.dart';
import 'package:spending_tracker/widgets/auth/signup_view.dart';

class AuthenticationView extends StatefulWidget {
  const AuthenticationView({Key? key}) : super(key: key);

  @override
  _AuthenticationViewState createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF5BC8AA),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(Icons.login),
                text: 'Log In',
              ),
              Tab(
                icon: Icon(Icons.add_reaction_outlined),
                text: 'Sign Up',
              ),
            ],
          ),
          title: const Text('Spending tracker'),
        ),
        body: const TabBarView(
          children: [
            LoginView(),
            SignupView(),
          ],
        ),
      ),
    );
  }
}
