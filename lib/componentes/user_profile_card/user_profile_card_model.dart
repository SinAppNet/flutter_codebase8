import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_profile_card_widget.dart' show UserProfileCardWidget;
import 'package:flutter/material.dart';

class UserProfileCardModel extends FlutterFlowModel<UserProfileCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<UsersRow>? usr;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<UsersRow>? usrCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
