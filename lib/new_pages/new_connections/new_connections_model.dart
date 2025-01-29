import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_pages/new_app_bar/new_app_bar_widget.dart';
import 'dart:async';
import 'new_connections_widget.dart' show NewConnectionsWidget;
import 'package:flutter/material.dart';

class NewConnectionsModel extends FlutterFlowModel<NewConnectionsWidget> {
  ///  Local state fields for this page.

  int tab = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Icon widget.
  List<UsersRow>? userd;
  // Stores action output result for [Backend Call - Query Rows] action in Icon widget.
  List<MatchTrackingRow>? matchTrack;
  // State field(s) for PesquisaNome widget.
  FocusNode? pesquisaNomeFocusNode;
  TextEditingController? pesquisaNomeTextController;
  String? Function(BuildContext, String?)? pesquisaNomeTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in PesquisaNome widget.
  List<UsersRow>? usr;
  // Stores action output result for [Backend Call - Query Rows] action in Row widget.
  List<UsersRow>? user;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<ChatRow>? chats;
  // Stores action output result for [Backend Call - Insert Row] action in Container widget.
  ChatRow? chat;
  // Stores action output result for [Backend Call - Query Rows] action in Row widget.
  List<UsersRow>? userCopy;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<ChatRow>? chatsCopy;
  // Stores action output result for [Backend Call - Insert Row] action in Container widget.
  ChatRow? chatCopy;
  Completer<List<ConexaoRow>>? requestCompleter;
  // Model for newAppBar component.
  late NewAppBarModel newAppBarModel;

  @override
  void initState(BuildContext context) {
    newAppBarModel = createModel(context, () => NewAppBarModel());
  }

  @override
  void dispose() {
    pesquisaNomeFocusNode?.dispose();
    pesquisaNomeTextController?.dispose();

    newAppBarModel.dispose();
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
