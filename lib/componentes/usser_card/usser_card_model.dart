import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'usser_card_widget.dart' show UsserCardWidget;
import 'package:flutter/material.dart';

class UsserCardModel extends FlutterFlowModel<UsserCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<UsersRow>? usr;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<UsersRow>? usres;
  // Stores action output result for [Backend Call - API (send push)] action in Container widget.
  ApiCallResponse? apiResultnx6a;
  bool requestCompleted = false;
  String? requestLastUniqueKey;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<UsersRow>? usre;
  // Stores action output result for [Backend Call - API (send push)] action in Container widget.
  ApiCallResponse? apiResultnx6;

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
      final requestComplete = requestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
