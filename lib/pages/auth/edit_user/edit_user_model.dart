import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_user_widget.dart' show EditUserWidget;
import 'package:flutter/material.dart';

class EditUserModel extends FlutterFlowModel<EditUserWidget> {
  ///  Local state fields for this page.

  bool changed = false;

  ///  State fields for stateful widgets in this page.

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
  // State field(s) for instagram widget.
  FocusNode? instagramFocusNode;
  TextEditingController? instagramTextController;
  String? Function(BuildContext, String?)? instagramTextControllerValidator;
  // State field(s) for linkedin widget.
  FocusNode? linkedinFocusNode1;
  TextEditingController? linkedinTextController1;
  String? Function(BuildContext, String?)? linkedinTextController1Validator;
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    usernameFocusNode?.dispose();
    usernameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    instagramFocusNode?.dispose();
    instagramTextController?.dispose();

    linkedinFocusNode1?.dispose();
    linkedinTextController1?.dispose();

    linkedinFocusNode2?.dispose();
    linkedinTextController2?.dispose();

    sobreFocusNode?.dispose();
    sobreTextController?.dispose();
  }
}
