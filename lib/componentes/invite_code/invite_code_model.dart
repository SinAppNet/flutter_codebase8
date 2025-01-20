import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'invite_code_widget.dart' show InviteCodeWidget;
import 'package:flutter/material.dart';

class InviteCodeModel extends FlutterFlowModel<InviteCodeWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for mail widget.
  FocusNode? mailFocusNode;
  TextEditingController? mailTextController;
  String? Function(BuildContext, String?)? mailTextControllerValidator;
  // State field(s) for codigoInvite widget.
  FocusNode? codigoInviteFocusNode;
  TextEditingController? codigoInviteTextController;
  String? Function(BuildContext, String?)? codigoInviteTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<InviteRow>? codigo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    mailFocusNode?.dispose();
    mailTextController?.dispose();

    codigoInviteFocusNode?.dispose();
    codigoInviteTextController?.dispose();
  }
}
