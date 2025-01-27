import '../database.dart';

class InviteTable extends SupabaseTable<InviteRow> {
  @override
  String get tableName => 'invite';

  @override
  InviteRow createRow(Map<String, dynamic> data) => InviteRow(data);
}

class InviteRow extends SupabaseDataRow {
  InviteRow(super.data);

  @override
  SupabaseTable get table => InviteTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get emailInviter => getField<String>('email_inviter');
  set emailInviter(String? value) => setField<String>('email_inviter', value);

  String? get codigoInvite => getField<String>('codigo_invite');
  set codigoInvite(String? value) => setField<String>('codigo_invite', value);

  String? get categoria => getField<String>('categoria');
  set categoria(String? value) => setField<String>('categoria', value);
}
