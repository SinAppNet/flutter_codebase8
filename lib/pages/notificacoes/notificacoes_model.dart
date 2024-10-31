import '/backend/supabase/supabase.dart';
import '/componentes/app_bar/app_bar_widget.dart';
import '/componentes/drawer_content/drawer_content_widget.dart';
import '/componentes/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'notificacoes_widget.dart' show NotificacoesWidget;
import 'package:flutter/material.dart';

class NotificacoesModel extends FlutterFlowModel<NotificacoesWidget> {
  ///  Local state fields for this page.

  int? actualState = 1;

  ///  State fields for stateful widgets in this page.

  // Model for appBar component.
  late AppBarModel appBarModel;
  Completer<List<ConexaoRow>>? requestCompleter;
  // Stores action output result for [Backend Call - Query Rows] action in Row widget.
  List<UsersRow>? usr;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<ChatRow>? chats;
  // Stores action output result for [Backend Call - Insert Row] action in Container widget.
  ChatRow? chat;
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
