import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'input_diario_widget.dart' show InputDiarioWidget;
import 'package:flutter/material.dart';

class InputDiarioModel extends FlutterFlowModel<InputDiarioWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for postText widget.
  FocusNode? postTextFocusNode;
  TextEditingController? postTextTextController;
  String? Function(BuildContext, String?)? postTextTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsersRow>? user;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    postTextFocusNode?.dispose();
    postTextTextController?.dispose();
  }
}
