import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'usuario_nao_conectado_widget.dart' show UsuarioNaoConectadoWidget;
import 'package:flutter/material.dart';

class UsuarioNaoConectadoModel
    extends FlutterFlowModel<UsuarioNaoConectadoWidget> {
  ///  Local state fields for this component.

  int number = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<UsersRow>? usres;
  // Stores action output result for [Backend Call - API (send push)] action in Container widget.
  ApiCallResponse? apiResultnx6a;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<UsersRow>? usre;
  // Stores action output result for [Backend Call - API (send push)] action in Container widget.
  ApiCallResponse? apiResultnx6;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
