import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'usser_card_widget.dart' show UsserCardWidget;
import 'package:flutter/material.dart';

class UsserCardModel extends FlutterFlowModel<UsserCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<UsersRow>? usr;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<UsersRow>? usre;
  // Stores action output result for [Backend Call - API (send push)] action in Container widget.
  ApiCallResponse? apiResultnx6;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
