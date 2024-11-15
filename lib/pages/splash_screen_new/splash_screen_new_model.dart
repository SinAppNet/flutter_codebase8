import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'splash_screen_new_widget.dart' show SplashScreenNewWidget;
import 'package:flutter/material.dart';

class SplashScreenNewModel extends FlutterFlowModel<SplashScreenNewWidget> {
  ///  State fields for stateful widgets in this page.

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
