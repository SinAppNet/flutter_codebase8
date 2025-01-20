import '../database.dart';

class PagamentoTable extends SupabaseTable<PagamentoRow> {
  @override
  String get tableName => 'pagamento';

  @override
  PagamentoRow createRow(Map<String, dynamic> data) => PagamentoRow(data);
}

class PagamentoRow extends SupabaseDataRow {
  PagamentoRow(super.data);

  @override
  SupabaseTable get table => PagamentoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get inviteId => getField<int>('invite_id');
  set inviteId(int? value) => setField<int>('invite_id', value);

  String? get invitedEmail => getField<String>('invited_email');
  set invitedEmail(String? value) => setField<String>('invited_email', value);

  String? get inviterEmail => getField<String>('inviter_email');
  set inviterEmail(String? value) => setField<String>('inviter_email', value);

  int? get planoId => getField<int>('plano_id');
  set planoId(int? value) => setField<int>('plano_id', value);

  double? get planoValor => getField<double>('plano_valor');
  set planoValor(double? value) => setField<double>('plano_valor', value);

  int? get planoParcelas => getField<int>('plano_parcelas');
  set planoParcelas(int? value) => setField<int>('plano_parcelas', value);

  double? get planoValorParcela => getField<double>('plano_valor_parcela');
  set planoValorParcela(double? value) =>
      setField<double>('plano_valor_parcela', value);

  DateTime? get paymDate => getField<DateTime>('paym_date');
  set paymDate(DateTime? value) => setField<DateTime>('paym_date', value);

  double? get porcentagemSplit => getField<double>('porcentagem_split');
  set porcentagemSplit(double? value) =>
      setField<double>('porcentagem_split', value);

  String? get nomeEmpresario => getField<String>('nome_empresario');
  set nomeEmpresario(String? value) =>
      setField<String>('nome_empresario', value);

  String? get nomeEmpresa => getField<String>('nome_empresa');
  set nomeEmpresa(String? value) => setField<String>('nome_empresa', value);
}
