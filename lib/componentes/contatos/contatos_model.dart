import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'contatos_widget.dart' show ContatosWidget;
import 'package:flutter/material.dart';

class ContatosModel extends FlutterFlowModel<ContatosWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<ChatRow>? chats;
  // Stores action output result for [Backend Call - Insert Row] action in IconButton widget.
  ChatRow? chat;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
