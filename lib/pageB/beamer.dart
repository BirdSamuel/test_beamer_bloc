import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_beamer_bloc/pageB/pageB.dart';

class HomePageBLocation extends BeamLocation {
  @override
  List<String> get pathBlueprints => ['/page-b'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: ValueKey('page-b-key'),
        child: MyHomePageB(),
      ),
    ];
  }
}
