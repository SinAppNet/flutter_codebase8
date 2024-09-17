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

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
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
  // State field(s) for senha01 widget.
  FocusNode? senha01FocusNode;
  TextEditingController? senha01TextController;
  late bool senha01Visibility;
  String? Function(BuildContext, String?)? senha01TextControllerValidator;
  // State field(s) for instagram widget.
  FocusNode? instagramFocusNode;
  TextEditingController? instagramTextController;
  String? Function(BuildContext, String?)? instagramTextControllerValidator;
  // State field(s) for linkedin widget.
  FocusNode? linkedinFocusNode;
  TextEditingController? linkedinTextController;
  String? Function(BuildContext, String?)? linkedinTextControllerValidator;
  // State field(s) for nomeEmpresa widget.
  FocusNode? nomeEmpresaFocusNode1;
  TextEditingController? nomeEmpresaTextController1;
  String? Function(BuildContext, String?)? nomeEmpresaTextController1Validator;
  // State field(s) for interessesUser widget.
  List<String>? interessesUserValue;
  FormFieldController<List<String>>? interessesUserValueController;
  // State field(s) for wpp widget.
  FocusNode? wppFocusNode;
  TextEditingController? wppTextController;
  String? Function(BuildContext, String?)? wppTextControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  UsersRow? createdUser;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  EmpresasRow? createdEmpresa;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UsersRow>? editedUser;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UsersRow>? editedUserm;
  // State field(s) for nomeEmpresa widget.
  FocusNode? nomeEmpresaFocusNode2;
  TextEditingController? nomeEmpresaTextController2;
  String? Function(BuildContext, String?)? nomeEmpresaTextController2Validator;
  // State field(s) for cnpjEmpresa widget.
  FocusNode? cnpjEmpresaFocusNode;
  TextEditingController? cnpjEmpresaTextController;
  final cnpjEmpresaMask = MaskTextInputFormatter(mask: '##.###.###/####-##');
  String? Function(BuildContext, String?)? cnpjEmpresaTextControllerValidator;
  // State field(s) for cargoUser widget.
  FocusNode? cargoUserFocusNode;
  TextEditingController? cargoUserTextController;
  String? Function(BuildContext, String?)? cargoUserTextControllerValidator;
  // State field(s) for siteEmpresa widget.
  FocusNode? siteEmpresaFocusNode;
  TextEditingController? siteEmpresaTextController;
  String? Function(BuildContext, String?)? siteEmpresaTextControllerValidator;
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
  // State field(s) for interessesEmpresas widget.
  List<String>? interessesEmpresasValue;
  FormFieldController<List<String>>? interessesEmpresasValueController;
  // State field(s) for portes widget.
  String? portesValue;
  FormFieldController<String>? portesValueController;
  // State field(s) for cash widget.
  FocusNode? cashFocusNode;
  TextEditingController? cashTextController;
  String? Function(BuildContext, String?)? cashTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController12;
  String? Function(BuildContext, String?)? textController12Validator;

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

    senha01FocusNode?.dispose();
    senha01TextController?.dispose();

    instagramFocusNode?.dispose();
    instagramTextController?.dispose();

    linkedinFocusNode?.dispose();
    linkedinTextController?.dispose();

    nomeEmpresaFocusNode1?.dispose();
    nomeEmpresaTextController1?.dispose();

    wppFocusNode?.dispose();
    wppTextController?.dispose();

    nomeEmpresaFocusNode2?.dispose();
    nomeEmpresaTextController2?.dispose();

    cnpjEmpresaFocusNode?.dispose();
    cnpjEmpresaTextController?.dispose();

    cargoUserFocusNode?.dispose();
    cargoUserTextController?.dispose();

    siteEmpresaFocusNode?.dispose();
    siteEmpresaTextController?.dispose();

    cidadeEmpresaFocusNode?.dispose();
    cidadeEmpresaTextController?.dispose();

    cashFocusNode?.dispose();
    cashTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController12?.dispose();
  }
}
