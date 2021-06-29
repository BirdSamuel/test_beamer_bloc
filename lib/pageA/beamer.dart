import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_beamer_bloc/pageA/pageA.dart';

import '../bloc/bloc1_bloc.dart';

class HomePageALocation extends BeamLocation {
  @override
  List<String> get pathBlueprints => ['/page-a'];

  // Give Bloc1Bloc access to all pages within this beamer scope
  @override
  Widget builder(BuildContext context, Widget navigator) {
    return BlocProvider<Bloc1Bloc>(
      create: (context) {
        return Bloc1Bloc();
      },
      child: navigator,
    );
  }

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: ValueKey('page-a-key'),
        child: MyHomePageA(),
      ),
    ];
  }
}
