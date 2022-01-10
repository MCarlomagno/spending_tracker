import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spending_tracker/services/authentication_service.dart';
import 'package:spending_tracker/widgets/shared/app_button.dart';
import '../../setup.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  AuthenticationService _authenticationService =
      getIt.get<AuthenticationService>();
  TextEditingController _controller = TextEditingController();

  User? user;

  bool isLoading = false;

  Future<void> loadUser() async {
    user = _authenticationService.currentUser;
    if (user != null) {
      _controller.text = user?.displayName ?? '';
    }
  }

  _clearInput() {
    setState(() {
      _controller = TextEditingController(text: '');
    });
  }

  _onSave() async {
    setState(() => isLoading = true);
    await _authenticationService.updateName(name: _controller.text);
    setState(() => isLoading = false);
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
                onPressed: _clearInput,
              ),
            ),
          ),
          AppButton(
            child: !isLoading
                ? Text('Save')
                : SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
            onPressed: isLoading ? null : _onSave,
            margin: EdgeInsets.only(top: 20),
          ),
        ],
      ),
    );
  }
}
