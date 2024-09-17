import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_cia_widget.dart' show EditCiaWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditCiaModel extends FlutterFlowModel<EditCiaWidget> {
  ///  Local state fields for this page.

  bool change = false;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for nomeEmpresa widget.
  FocusNode? nomeEmpresaFocusNode;
  TextEditingController? nomeEmpresaTextController;
  String? Function(BuildContext, String?)? nomeEmpresaTextControllerValidator;
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
  // State field(s) for faturamentoAnual widget.
  FocusNode? faturamentoAnualFocusNode;
  TextEditingController? faturamentoAnualTextController;
  String? Function(BuildContext, String?)?
      faturamentoAnualTextControllerValidator;
  // State field(s) for qntdColaboradores widget.
  FocusNode? qntdColaboradoresFocusNode;
  TextEditingController? qntdColaboradoresTextController;
  String? Function(BuildContext, String?)?
      qntdColaboradoresTextControllerValidator;
  // State field(s) for portes widget.
  String? portesValue;
  FormFieldController<String>? portesValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomeEmpresaFocusNode?.dispose();
    nomeEmpresaTextController?.dispose();

    cnpjEmpresaFocusNode?.dispose();
    cnpjEmpresaTextController?.dispose();

    cidadeEmpresaFocusNode?.dispose();
    cidadeEmpresaTextController?.dispose();

    faturamentoAnualFocusNode?.dispose();
    faturamentoAnualTextController?.dispose();

    qntdColaboradoresFocusNode?.dispose();
    qntdColaboradoresTextController?.dispose();
  }
}
