import 'package:flutter/material.dart';
import 'package:spending_tracker/interfaces/user.dart';
import 'package:spending_tracker/services/users_service.dart';

import '../../setup.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  User? user;
  UsersService _usersService = getIt.get<UsersService>();
  TextEditingController _controller = TextEditingController();

  Future<void> loadUser() async {
    user = await _usersService.getSingle();
    if(user != null) {
      _controller.text = user?.name ?? '';  
    }
  }

 Future<void> saveName() async {
    if (user?.name != null) {
      await _usersService.patchById(user!.id!, name: _controller.text);
    } else {
      User newUser = new User(name: _controller.text);
      user = await _usersService.create(user: newUser);
    }
  }

  Future<void> deleteAll() async {
    await _usersService.deleteAll();
    user = null;
    _controller.text = '';
  }

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        children: [
          TextField(
            controller: _controller,
            maxLines: 1,
            decoration: InputDecoration(
                label: Text('Name'),
                hintMaxLines: 20,
                suffixIcon: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => deleteAll(),
                )),
            onEditingComplete: () async  {
              await saveName(); 
              FocusScope.of(context).unfocus();
            }
          )
        ],
      ),
    );
  }
}