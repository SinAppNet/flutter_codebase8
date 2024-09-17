import '/flutter_flow/flutter_flow_util.dart';
import 'email_reset_widget.dart' show EmailResetWidget;
import 'package:flutter/material.dart';

class EmailResetModel extends FlutterFlowModel<EmailResetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
