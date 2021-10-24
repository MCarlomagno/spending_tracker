import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spending_tracker/models/transactions_model.dart';
import 'package:spending_tracker/widgets/settings/settings.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(120);

  @override
  Widget build(BuildContext context) {
    var headerHeight = this.preferredSize.height;
    var contentWidth = MediaQuery.of(context).size.width * 0.8;
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
              onSelected: (int result) {
                switch (result) {
                  case 0:
                     Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => SettingsPage()));
                    break;
                  case 1:
                    Provider.of<PaymentModel>(context, listen: false)
                      .deleteAll();
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
                        Icons.delete,
                        color: Colors.red,
                      ),
                      Text(
                        'Delete all',
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
          "Welcome back,\nMarcos",
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
