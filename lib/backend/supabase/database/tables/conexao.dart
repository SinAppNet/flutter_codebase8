import '../database.dart';

class ConexaoTable extends SupabaseTable<ConexaoRow> {
  @override
  String get tableName => 'conexao';

  @override
  ConexaoRow createRow(Map<String, dynamic> data) => ConexaoRow(data);
}

class ConexaoRow extends SupabaseDataRow {
  ConexaoRow(super.data);

  @override
  SupabaseTable get table => ConexaoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  int? get solicitou => getField<int>('solicitou');
  set solicitou(int? value) => setField<int>('solicitou', value);

  int? get solicitado => getField<int>('solicitado');
  set solicitado(int? value) => setField<int>('solicitado', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);
}
