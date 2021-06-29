import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_beamer_bloc/bloc/bloc1_bloc.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Page A',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePageA(),
    );
  }
}

class MyHomePageA extends StatefulWidget {
  MyHomePageA({Key? key}) : super(key: key);

  @override
  _MyHomePageAState createState() => _MyHomePageAState();
}

class _MyHomePageAState extends State<MyHomePageA> {
  void _goBackHome() {
    Beamer.of(context).beamToNamed('/');
  }

  void _goToPageB() {
    Beamer.of(context).beamToNamed('/page-b');
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<Bloc1Bloc>(context);
    if (bloc.state is Bloc1Initial) {
      bloc.add(Bloc1Load());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page A'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This is Page A',
            ),
            BlocBuilder<Bloc1Bloc, Bloc1State>(
              builder: (context, state) {
                String currStateText = '';
                switch (state.runtimeType) {
                  case Bloc1Initial:
                    currStateText = 'Bloc Initial';
                    break;
                  case Bloc1Loaded:
                    currStateText = 'Bloc Loaded';
                    break;
                  default:
                }
                return Text(currStateText);
              },
            ),
            ElevatedButton(onPressed: _goToPageB, child: Text('To PageB')),
            ElevatedButton(onPressed: _goBackHome, child: Text('Back to Home')),
          ],
        ),
      ),
    );
  }
}
