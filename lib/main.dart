import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:test_beamer_bloc/pageA/beamer.dart';
import 'package:test_beamer_bloc/pageB/beamer.dart';

import 'beamer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final BeamerDelegate routerDelegate = BeamerDelegate(
    listener: (state, location) {
      print("BEAMER: Beaming to ${location.state.uri}");
    },
    transitionDelegate: NoAnimationTransitionDelegate(),
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        HomePageLocation(),
        HomePageALocation(),
        HomePageBLocation(),
      ],
    ),
    notFoundPage: BeamPage(
      child: Container(
        child: Text("Not found"),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _goToPageA() {
    Beamer.of(context).beamToNamed('/page-a');
  }

  void _goToPageB() {
    Beamer.of(context).beamToNamed('/page-b');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Page A or B?',
            ),
            ElevatedButton(onPressed: _goToPageA, child: Text('PageA')),
            ElevatedButton(onPressed: _goToPageB, child: Text('PageB')),
          ],
        ),
      ),
    );
  }
}
