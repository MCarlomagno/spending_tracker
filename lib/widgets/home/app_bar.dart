import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spending_tracker/services/authentication_service.dart';
import 'package:spending_tracker/widgets/auth/authentication_view.dart';
import 'package:spending_tracker/widgets/settings/settings.dart';

import '../../setup.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(120);

  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  final _authenticationService = getIt<AuthenticationService>();
  User? user;
  bool isLoading = false;
  String title = "Welcome back";

  _singOut() async {
    await _authenticationService.logOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => AuthenticationView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var headerHeight = widget.preferredSize.height;
    var contentWidth = MediaQuery.of(context).size.width * 0.8;

    User? user = _authenticationService.currentUser;
    if (user?.displayName != null && user?.displayName != '') {
      title = "Welcome back,\n${user!.displayName}";
    } else {
      title = "Welcome back";
    }

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 3,
      toolbarHeight: headerHeight,
      actions: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Align(
            alignment: Alignment.topRight,
            child: PopupMenuButton<int>(
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              onSelected: (int result) async {
                switch (result) {
                  case 0:
                    await Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SettingsPage()));
                    break;
                  case 1:
                    _singOut();
                    break;
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
                PopupMenuItem<int>(
                  value: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        Icons.settings,
                        color: Colors.grey[700],
                      ),
                      Text(
                        'Settings',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      Text(
                        'Sign Out',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
      title: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
        width: contentWidth,
        height: headerHeight,
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 25,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
