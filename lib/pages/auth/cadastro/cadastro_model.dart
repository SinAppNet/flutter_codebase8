import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'cadastro_widget.dart' show CadastroWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CadastroModel extends FlutterFlowModel<CadastroWidget> {
  ///  Local state fields for this page.

  CurrentUserStruct? user;
  void updateUserStruct(Function(CurrentUserStruct) updateFn) {
    updateFn(user ??= CurrentUserStruct());
  }

  String? passw;

  int? step = 1;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for username widget.
  FocusNode? usernameFocusNode;
  TextEditingController? usernameTextController;
  String? Function(BuildContext, String?)? usernameTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for cpf widget.
  FocusNode? cpfFocusNode;
  TextEditingController? cpfTextController;
  final cpfMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? cpfTextControllerValidator;
  // State field(s) for wpp widget.
  FocusNode? wppFocusNode;
  TextEditingController? wppTextController;
  String? Function(BuildContext, String?)? wppTextControllerValidator;
  // State field(s) for senha01 widget.
  FocusNode? senha01FocusNode;
  TextEditingController? senha01TextController;
  late bool senha01Visibility;
  String? Function(BuildContext, String?)? senha01TextControllerValidator;
  // State field(s) for nomeEmpresa widget.
  FocusNode? nomeEmpresaFocusNode;
  TextEditingController? nomeEmpresaTextController;
  String? Function(BuildContext, String?)? nomeEmpresaTextControllerValidator;
  // State field(s) for segmentoEmpresa widget.
  String? segmentoEmpresaValue;
  FormFieldController<String>? segmentoEmpresaValueController;
  // State field(s) for sobre widget.
  FocusNode? sobreFocusNode;
  TextEditingController? sobreTextController;
  String? Function(BuildContext, String?)? sobreTextControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  UsersRow? createdUser;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  EmpresasRow? createdEmpresa;
  // Stores action output result for [Backend Call - API (add asaas customer)] action in Button widget.
  ApiCallResponse? asaasClient;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UsersRow>? editedUser;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UsersRow>? editedUserm;
  // Stores action output result for [Backend Call - API (nn acc created)] action in Button widget.
  ApiCallResponse? apiResult4l2de;
  // Stores action output result for [Backend Call - API (nn acc created)] action in Button widget.
  ApiCallResponse? apiResult4l2;
  // State field(s) for tipoConex widget.
  FocusNode? tipoConexFocusNode;
  TextEditingController? tipoConexTextController;
  String? Function(BuildContext, String?)? tipoConexTextControllerValidator;

  @override
  void initState(BuildContext context) {
    senha01Visibility = false;
  }

  @override
  void dispose() {
    usernameFocusNode?.dispose();
    usernameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    cpfFocusNode?.dispose();
    cpfTextController?.dispose();

    wppFocusNode?.dispose();
    wppTextController?.dispose();

    senha01FocusNode?.dispose();
    senha01TextController?.dispose();

    nomeEmpresaFocusNode?.dispose();
    nomeEmpresaTextController?.dispose();

    sobreFocusNode?.dispose();
    sobreTextController?.dispose();

    tipoConexFocusNode?.dispose();
    tipoConexTextController?.dispose();
  }
}
