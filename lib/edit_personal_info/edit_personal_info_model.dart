import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_personal_info_widget.dart' show EditPersonalInfoWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditPersonalInfoModel extends FlutterFlowModel<EditPersonalInfoWidget> {
  ///  Local state fields for this page.

  String profilePhoto = '';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for username widget.
  FocusNode? usernameFocusNode;
  TextEditingController? usernameTextController;
  String? Function(BuildContext, String?)? usernameTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for linkedin widget.
  FocusNode? linkedinFocusNode1;
  TextEditingController? linkedinTextController1;
  String? Function(BuildContext, String?)? linkedinTextController1Validator;
  // State field(s) for instagram widget.
  FocusNode? instagramFocusNode;
  TextEditingController? instagramTextController;
  String? Function(BuildContext, String?)? instagramTextControllerValidator;
  // State field(s) for linkedin widget.
  FocusNode? linkedinFocusNode2;
  TextEditingController? linkedinTextController2;
  String? Function(BuildContext, String?)? linkedinTextController2Validator;
  // State field(s) for interessesUser widget.
  List<String>? interessesUserValue;
  FormFieldController<List<String>>? interessesUserValueController;
  // State field(s) for sobre widget.
  FocusNode? sobreFocusNode;
  TextEditingController? sobreTextController;
  String? Function(BuildContext, String?)? sobreTextControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UsersRow>? editedUser;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<EmpresasRow>? empresa;
  // State field(s) for nomeEmpresa widget.
  FocusNode? nomeEmpresaFocusNode;
  TextEditingController? nomeEmpresaTextController;
  String? Function(BuildContext, String?)? nomeEmpresaTextControllerValidator;
  // State field(s) for cnpjEmpresa widget.
  FocusNode? cnpjEmpresaFocusNode;
  TextEditingController? cnpjEmpresaTextController;
  final cnpjEmpresaMask = MaskTextInputFormatter(mask: '##.###.###/####-##');
  String? Function(BuildContext, String?)? cnpjEmpresaTextControllerValidator;
  // State field(s) for segmentoEmpresa widget.
  String? segmentoEmpresaValue;
  FormFieldController<String>? segmentoEmpresaValueController;
  // State field(s) for cidadeEmpresa widget.
  FocusNode? cidadeEmpresaFocusNode;
  TextEditingController? cidadeEmpresaTextController;
  String? Function(BuildContext, String?)? cidadeEmpresaTextControllerValidator;
  // State field(s) for estadoEmpresa widget.
  String? estadoEmpresaValue;
  FormFieldController<String>? estadoEmpresaValueController;
  // State field(s) for portes widget.
  String? portesValue;
  FormFieldController<String>? portesValueController;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsersRow>? user;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    usernameFocusNode?.dispose();
    usernameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    linkedinFocusNode1?.dispose();
    linkedinTextController1?.dispose();

    instagramFocusNode?.dispose();
    instagramTextController?.dispose();

    linkedinFocusNode2?.dispose();
    linkedinTextController2?.dispose();

    sobreFocusNode?.dispose();
    sobreTextController?.dispose();

    nomeEmpresaFocusNode?.dispose();
    nomeEmpresaTextController?.dispose();

    cnpjEmpresaFocusNode?.dispose();
    cnpjEmpresaTextController?.dispose();

    cidadeEmpresaFocusNode?.dispose();
    cidadeEmpresaTextController?.dispose();
  }
}
