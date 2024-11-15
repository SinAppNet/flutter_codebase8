import '../database.dart';

class InviteHistoryTable extends SupabaseTable<InviteHistoryRow> {
  @override
  String get tableName => 'invite_history';

  @override
  InviteHistoryRow createRow(Map<String, dynamic> data) =>
      InviteHistoryRow(data);
}

class InviteHistoryRow extends SupabaseDataRow {
  InviteHistoryRow(super.data);

  @override
  SupabaseTable get table => InviteHistoryTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get usedByUserId => getField<int>('used_by_user_id');
  set usedByUserId(int? value) => setField<int>('used_by_user_id', value);

  String? get usedByEmail => getField<String>('used_by_email');
  set usedByEmail(String? value) => setField<String>('used_by_email', value);

  int? get inviteId => getField<int>('invite_id');
  set inviteId(int? value) => setField<int>('invite_id', value);
}
