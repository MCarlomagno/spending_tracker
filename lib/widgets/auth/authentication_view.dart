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
    Widget body = const TabBarView(
      children: [
        LoginView(),
        SignupView(),
      ],
    );

    TabBar tabBar = TabBar(
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
    );

    AppBar appBar = AppBar(
      backgroundColor: Color(0xFF5BC8AA),
      bottom: tabBar,
      title: const Text('Spending tracker'),
    );

    return DefaultTabController(
      length: tabBar.tabs.length,
      child: Scaffold(
        appBar: appBar,
        body: body,
      ),
    );
  }
}
