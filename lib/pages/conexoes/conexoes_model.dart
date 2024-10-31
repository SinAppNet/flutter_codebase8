import '/backend/supabase/supabase.dart';
import '/componentes/app_bar/app_bar_widget.dart';
import '/componentes/drawer_content/drawer_content_widget.dart';
import '/componentes/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'conexoes_widget.dart' show ConexoesWidget;
import 'package:flutter/material.dart';

class ConexoesModel extends FlutterFlowModel<ConexoesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for appBar component.
  late AppBarModel appBarModel;
  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in TextField widget.
  List<UsersRow>? userSelected;
  // Stores action output result for [Backend Call - Query Rows] action in Row widget.
  List<UsersRow>? usr;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<ChatRow>? chats;
  // Stores action output result for [Backend Call - Insert Row] action in Container widget.
  ChatRow? chat;
  // Model for navbar component.
  late NavbarModel navbarModel;
  // Model for drawerContent component.
  late DrawerContentModel drawerContentModel;

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    navbarModel = createModel(context, () => NavbarModel());
    drawerContentModel = createModel(context, () => DrawerContentModel());
  }

  @override
  void dispose() {
    appBarModel.dispose();
    textFieldFocusNode?.dispose();

    navbarModel.dispose();
    drawerContentModel.dispose();
  }
}
