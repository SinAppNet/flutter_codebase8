import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'connect_recommend_widget.dart' show ConnectRecommendWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class ConnectRecommendModel extends FlutterFlowModel<ConnectRecommendWidget> {
  ///  Local state fields for this page.

  bool continar = false;

  ///  State fields for stateful widgets in this page.

  Completer<List<UsuariosSemConexaoAceitaRow>>? requestCompleter;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

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
