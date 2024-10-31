import '/flutter_flow/flutter_flow_util.dart';
import 'write_commen_widget.dart' show WriteCommenWidget;
import 'package:flutter/material.dart';

class WriteCommenModel extends FlutterFlowModel<WriteCommenWidget> {
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
