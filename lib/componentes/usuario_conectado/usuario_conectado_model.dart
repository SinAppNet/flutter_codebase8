import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'usuario_conectado_widget.dart' show UsuarioConectadoWidget;
import 'package:flutter/material.dart';

class UsuarioConectadoModel extends FlutterFlowModel<UsuarioConectadoWidget> {
  ///  Local state fields for this component.

  int number = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<ChatRow>? chats;
  // Stores action output result for [Backend Call - Insert Row] action in Container widget.
  ChatRow? chat;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
