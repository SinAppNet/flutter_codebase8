import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ia_recommend_widget.dart' show IaRecommendWidget;
import 'package:flutter/material.dart';

class IaRecommendModel extends FlutterFlowModel<IaRecommendWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for tipoConex widget.
  FocusNode? tipoConexFocusNode;
  TextEditingController? tipoConexTextController;
  String? Function(BuildContext, String?)? tipoConexTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsersRow>? user;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tipoConexFocusNode?.dispose();
    tipoConexTextController?.dispose();
  }
}
