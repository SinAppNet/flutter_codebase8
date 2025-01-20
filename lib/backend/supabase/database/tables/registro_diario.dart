import '../database.dart';

class RegistroDiarioTable extends SupabaseTable<RegistroDiarioRow> {
  @override
  String get tableName => 'registro_diario';

  @override
  RegistroDiarioRow createRow(Map<String, dynamic> data) =>
      RegistroDiarioRow(data);
}

class RegistroDiarioRow extends SupabaseDataRow {
  RegistroDiarioRow(super.data);

  @override
  SupabaseTable get table => RegistroDiarioTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get user => getField<int>('user');
  set user(int? value) => setField<int>('user', value);

  DateTime? get dataField => getField<DateTime>('data');
  set dataField(DateTime? value) => setField<DateTime>('data', value);

  String? get texto => getField<String>('texto');
  set texto(String? value) => setField<String>('texto', value);
}
