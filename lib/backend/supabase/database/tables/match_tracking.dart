import '../database.dart';

class MatchTrackingTable extends SupabaseTable<MatchTrackingRow> {
  @override
  String get tableName => 'match_tracking';

  @override
  MatchTrackingRow createRow(Map<String, dynamic> data) =>
      MatchTrackingRow(data);
}

class MatchTrackingRow extends SupabaseDataRow {
  MatchTrackingRow(super.data);

  @override
  SupabaseTable get table => MatchTrackingTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get user => getField<int>('user');
  set user(int? value) => setField<int>('user', value);

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);

  int? get qntdDisponivel => getField<int>('qntd_disponivel');
  set qntdDisponivel(int? value) => setField<int>('qntd_disponivel', value);

  int? get likesDisponiveis => getField<int>('likes_disponiveis');
  set likesDisponiveis(int? value) => setField<int>('likes_disponiveis', value);
}
