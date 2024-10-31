import '/backend/supabase/supabase.dart';
import '/componentes/app_bar/app_bar_widget.dart';
import '/componentes/drawer_content/drawer_content_widget.dart';
import '/componentes/navbar/navbar_widget.dart';
import '/componentes/usser_card/usser_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'home_all_widget.dart' show HomeAllWidget;
import 'package:flutter/material.dart';

class HomeAllModel extends FlutterFlowModel<HomeAllWidget> {
  ///  Local state fields for this page.

  bool all = false;

  int? num = 0;

  ///  State fields for stateful widgets in this page.

  // Model for appBar component.
  late AppBarModel appBarModel;
  // State field(s) for PesquisaNome widget.
  final pesquisaNomeKey = GlobalKey();
  FocusNode? pesquisaNomeFocusNode;
  TextEditingController? pesquisaNomeTextController;
  String? pesquisaNomeSelectedOption;
  String? Function(BuildContext, String?)? pesquisaNomeTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in PesquisaNome widget.
  List<UsersRow>? usr;
  Completer<List<UsuariosSemConexaoAceitaRow>>? requestCompleter2;
  // Model for usserCard component.
  late UsserCardModel usserCardModel1;
  Completer<List<UsuariosSemConexaoAceitaRow>>? requestCompleter1;
  Completer<List<UsuariosSemConexaoAceitaRow>>? requestCompleter3;
  // Model for navbar component.
  late NavbarModel navbarModel;
  // Model for drawerContent component.
  late DrawerContentModel drawerContentModel;

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    usserCardModel1 = createModel(context, () => UsserCardModel());
    navbarModel = createModel(context, () => NavbarModel());
    drawerContentModel = createModel(context, () => DrawerContentModel());
  }

  @override
  void dispose() {
    appBarModel.dispose();
    pesquisaNomeFocusNode?.dispose();

    usserCardModel1.dispose();
    navbarModel.dispose();
    drawerContentModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter3?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
