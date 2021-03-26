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
      home: MyHomePage(title: 'Spending tracker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title!,
          style: TextStyle(fontFamily: 'Poppins'),
        ),
      ),
      body: SizedBox.expand(
        child: GestureDetector(
            child: Container(
              color: Colors.black,
            ),
            onVerticalDragUpdate: (details) {
              if (details.delta.dy < 10) {
                Navigator.of(context).push(_createRoute());
              }
            }),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SecondRoute(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add"),
      ),
      body: GestureDetector(
          child: Container(
            color: Colors.pink,
          ),
          onVerticalDragUpdate: (details) {
            if (details.delta.dy > 10) {
              print("swipe to bottom");
              Navigator.pop(context);
            }
          }),
    );
  }
}
