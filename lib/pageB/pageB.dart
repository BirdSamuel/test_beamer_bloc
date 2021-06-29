import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Page B',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePageB(),
    );
  }
}

class MyHomePageB extends StatefulWidget {
  MyHomePageB({Key? key}) : super(key: key);

  @override
  _MyHomePageBState createState() => _MyHomePageBState();
}

class _MyHomePageBState extends State<MyHomePageB> {
  void _goBackHome() {
    Beamer.of(context).beamToNamed('/');
  }

  void _goToPageA() {
    Beamer.of(context).beamToNamed('/page-a');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page B'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This is Page B',
            ),
            ElevatedButton(onPressed: _goToPageA, child: Text('To Page A')),
            ElevatedButton(onPressed: _goBackHome, child: Text('Back to Home')),
          ],
        ),
      ),
    );
  }
}
