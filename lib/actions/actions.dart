import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';

Future<UsersRow?> updateUserState(BuildContext context) async {
  List<UsersRow>? returnedUser;
  String? fcm;

  returnedUser = await UsersTable().queryRows(
    queryFn: (q) => q.eq(
      'uuid',
      currentUserUid,
    ),
  );
  fcm = await actions.getFCMToken();
  await UsersTable().update(
    data: {
      'fcm_token': fcm,
    },
    matchingRows: (rows) => rows.eq(
      'uuid',
      currentUserUid,
    ),
  );
  FFAppState().currentUser = CurrentUserStruct(
    id: returnedUser.first.id,
    nome: returnedUser.first.nome,
    email: currentUserEmail,
    profilePic: returnedUser.first.profilePic,
    sobre: returnedUser.first.sobre,
    whatsapp: returnedUser.first.whatsapp,
    instagram: returnedUser.first.instagram,
    linkedin: returnedUser.first.linkedin,
    empresaId: returnedUser.first.empresa,
    cargo: returnedUser.first.cargo,
    interesses: returnedUser.first.interesses,
    perfilCompleto: returnedUser.first.perfilCompleto,
  );
  FFAppState().update(() {});
  return returnedUser.first;
}
