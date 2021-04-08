import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spending tracker',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    const headerHeight = 200.0;
    const headerTextWidth = 400.0;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: headerHeight,
            actions: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
            title: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
              width: headerTextWidth,
              height: headerHeight,
              child: Text(
                "Welcome back,\nMarcos",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            )),
        body: SizedBox.expand());
  }
}
