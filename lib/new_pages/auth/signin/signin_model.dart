import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'signin_widget.dart' show SigninWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SigninModel extends FlutterFlowModel<SigninWidget> {
  ///  Local state fields for this page.

  int currentStep = 0;

  bool tutorialSwipe = true;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeTextController;
  String? Function(BuildContext, String?)? nomeTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for CPF widget.
  FocusNode? cpfFocusNode;
  TextEditingController? cpfTextController;
  final cpfMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? cpfTextControllerValidator;
  // State field(s) for senha widget.
  FocusNode? senhaFocusNode;
  TextEditingController? senhaTextController;
  late bool senhaVisibility;
  String? Function(BuildContext, String?)? senhaTextControllerValidator;
  // State field(s) for whatsapp widget.
  FocusNode? whatsappFocusNode;
  TextEditingController? whatsappTextController;
  String? Function(BuildContext, String?)? whatsappTextControllerValidator;
  // State field(s) for nomeEmpresa widget.
  FocusNode? nomeEmpresaFocusNode;
  TextEditingController? nomeEmpresaTextController;
  String? Function(BuildContext, String?)? nomeEmpresaTextControllerValidator;
  // State field(s) for segmento widget.
  FocusNode? segmentoFocusNode;
  TextEditingController? segmentoTextController;
  String? Function(BuildContext, String?)? segmentoTextControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  UsersRow? createdUser;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  EmpresasRow? createdEmpresa;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<UsersRow>? editedUser;
  // State field(s) for tipoConex widget.
  FocusNode? tipoConexFocusNode;
  TextEditingController? tipoConexTextController;
  String? Function(BuildContext, String?)? tipoConexTextControllerValidator;

  @override
  void initState(BuildContext context) {
    senhaVisibility = false;
  }

  @override
  void dispose() {
    nomeFocusNode?.dispose();
    nomeTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    cpfFocusNode?.dispose();
    cpfTextController?.dispose();

    senhaFocusNode?.dispose();
    senhaTextController?.dispose();

    whatsappFocusNode?.dispose();
    whatsappTextController?.dispose();

    nomeEmpresaFocusNode?.dispose();
    nomeEmpresaTextController?.dispose();

    segmentoFocusNode?.dispose();
    segmentoTextController?.dispose();

    tipoConexFocusNode?.dispose();
    tipoConexTextController?.dispose();
  }
}
