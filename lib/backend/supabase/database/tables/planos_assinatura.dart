import '../database.dart';

class PlanosAssinaturaTable extends SupabaseTable<PlanosAssinaturaRow> {
  @override
  String get tableName => 'planos_assinatura';

  @override
  PlanosAssinaturaRow createRow(Map<String, dynamic> data) =>
      PlanosAssinaturaRow(data);
}

class PlanosAssinaturaRow extends SupabaseDataRow {
  PlanosAssinaturaRow(super.data);

  @override
  SupabaseTable get table => PlanosAssinaturaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  dynamic get benefits => getField<dynamic>('benefits');
  set benefits(dynamic value) => setField<dynamic>('benefits', value);

  int? get value => getField<int>('value');
  set value(int? value) => setField<int>('value', value);

  bool? get mostWanted => getField<bool>('mostWanted');
  set mostWanted(bool? value) => setField<bool>('mostWanted', value);

  String? get cycle => getField<String>('cycle');
  set cycle(String? value) => setField<String>('cycle', value);

  bool? get ativo => getField<bool>('ativo');
  set ativo(bool? value) => setField<bool>('ativo', value);
}
