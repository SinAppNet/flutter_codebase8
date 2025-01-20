import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/new_pages/new_app_bar/new_app_bar_widget.dart';
import 'new_chats_widget.dart' show NewChatsWidget;
import 'package:flutter/material.dart';

class NewChatsModel extends FlutterFlowModel<NewChatsWidget> {
  ///  Local state fields for this page.

  String tab = 'all';

  ///  State fields for stateful widgets in this page.

  // State field(s) for PesquisaNome widget.
  final pesquisaNomeKey = GlobalKey();
  FocusNode? pesquisaNomeFocusNode;
  TextEditingController? pesquisaNomeTextController;
  String? pesquisaNomeSelectedOption;
  String? Function(BuildContext, String?)? pesquisaNomeTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in PesquisaNome widget.
  List<UsersRow>? usr;
  // Model for newAppBar component.
  late NewAppBarModel newAppBarModel;

  @override
  void initState(BuildContext context) {
    newAppBarModel = createModel(context, () => NewAppBarModel());
  }

  @override
  void dispose() {
    pesquisaNomeFocusNode?.dispose();

    newAppBarModel.dispose();
  }
}
