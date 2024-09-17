import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'complete_perfil_widget.dart' show CompletePerfilWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CompletePerfilModel extends FlutterFlowModel<CompletePerfilWidget> {
  ///  Local state fields for this component.

  int? step = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for instagram widget.
  FocusNode? instagramFocusNode;
  TextEditingController? instagramTextController;
  String? Function(BuildContext, String?)? instagramTextControllerValidator;
  // State field(s) for linkedin widget.
  FocusNode? linkedinFocusNode;
  TextEditingController? linkedinTextController;
  String? Function(BuildContext, String?)? linkedinTextControllerValidator;
  // State field(s) for sobre widget.
  FocusNode? sobreFocusNode;
  TextEditingController? sobreTextController;
  String? Function(BuildContext, String?)? sobreTextControllerValidator;
  // State field(s) for cnpjEmpresa widget.
  FocusNode? cnpjEmpresaFocusNode;
  TextEditingController? cnpjEmpresaTextController;
  final cnpjEmpresaMask = MaskTextInputFormatter(mask: '##.###.###/####-##');
  String? Function(BuildContext, String?)? cnpjEmpresaTextControllerValidator;
  // State field(s) for cidadeEmpresa widget.
  FocusNode? cidadeEmpresaFocusNode;
  TextEditingController? cidadeEmpresaTextController;
  String? Function(BuildContext, String?)? cidadeEmpresaTextControllerValidator;
  // State field(s) for estadoEmpresa widget.
  String? estadoEmpresaValue;
  FormFieldController<String>? estadoEmpresaValueController;
  // State field(s) for segmentosEmpresa widget.
  String? segmentosEmpresaValue;
  FormFieldController<String>? segmentosEmpresaValueController;
  // State field(s) for portes widget.
  String? portesValue;
  FormFieldController<String>? portesValueController;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UsersRow>? user;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instagramFocusNode?.dispose();
    instagramTextController?.dispose();

    linkedinFocusNode?.dispose();
    linkedinTextController?.dispose();

    sobreFocusNode?.dispose();
    sobreTextController?.dispose();

    cnpjEmpresaFocusNode?.dispose();
    cnpjEmpresaTextController?.dispose();

    cidadeEmpresaFocusNode?.dispose();
    cidadeEmpresaTextController?.dispose();
  }
}
