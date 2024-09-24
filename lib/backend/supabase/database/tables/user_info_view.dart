import '../database.dart';

class UserInfoViewTable extends SupabaseTable<UserInfoViewRow> {
  @override
  String get tableName => 'user_info_view';

  @override
  UserInfoViewRow createRow(Map<String, dynamic> data) => UserInfoViewRow(data);
}

class UserInfoViewRow extends SupabaseDataRow {
  UserInfoViewRow(super.data);

  @override
  SupabaseTable get table => UserInfoViewTable();

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);
}
