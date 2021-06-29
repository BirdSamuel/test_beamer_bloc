import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_beamer_bloc/main.dart';

class HomePageLocation extends BeamLocation {
  @override
  List<String> get pathBlueprints => ['/'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: ValueKey('page-home-key'),
        child: MyHomePage(title: 'Home'),
      ),
    ];
  }
}
