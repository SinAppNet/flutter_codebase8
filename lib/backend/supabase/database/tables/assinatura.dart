import '../database.dart';

class AssinaturaTable extends SupabaseTable<AssinaturaRow> {
  @override
  String get tableName => 'assinatura';

  @override
  AssinaturaRow createRow(Map<String, dynamic> data) => AssinaturaRow(data);
}

class AssinaturaRow extends SupabaseDataRow {
  AssinaturaRow(super.data);

  @override
  SupabaseTable get table => AssinaturaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get usuario => getField<int>('usuario');
  set usuario(int? value) => setField<int>('usuario', value);

  int? get plano => getField<int>('plano');
  set plano(int? value) => setField<int>('plano', value);

  DateTime? get dataPagamento => getField<DateTime>('data_pagamento');
  set dataPagamento(DateTime? value) =>
      setField<DateTime>('data_pagamento', value);

  DateTime? get dataRecorrencia => getField<DateTime>('data_recorrencia');
  set dataRecorrencia(DateTime? value) =>
      setField<DateTime>('data_recorrencia', value);

  DateTime? get endDate => getField<DateTime>('end_date');
  set endDate(DateTime? value) => setField<DateTime>('end_date', value);

  String? get subscriptionId => getField<String>('subscription_id');
  set subscriptionId(String? value) =>
      setField<String>('subscription_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);
}
