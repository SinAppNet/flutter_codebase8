import '/backend/supabase/supabase.dart';
import '/componentes/app_bar/app_bar_widget.dart';
import '/componentes/drawer_content/drawer_content_widget.dart';
import '/componentes/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'home_widget.dart' show HomeWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  bool all = false;

  int? num = 0;

  String? tkm;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? initialOnboardingController;
  // Stores action output result for [Backend Call - Query Rows] action in home widget.
  List<UsersRow>? cuSer;
  // Stores action output result for [Action Block - updateUserState] action in home widget.
  UsersRow? user;
  // Model for appBar component.
  late AppBarModel appBarModel;
  // Stores action output result for [Custom Action - getFCMToken] action in Text widget.
  String? fcmt;
  Completer<List<UsuariosSemConexaoAceitaRow>>? requestCompleter;
  // Model for navbar component.
  late NavbarModel navbarModel;
  // Model for drawerContent component.
  late DrawerContentModel drawerContentModel;

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    navbarModel = createModel(context, () => NavbarModel());
    drawerContentModel = createModel(context, () => DrawerContentModel());
  }

  @override
  void dispose() {
    initialOnboardingController?.finish();
    appBarModel.dispose();
    navbarModel.dispose();
    drawerContentModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
