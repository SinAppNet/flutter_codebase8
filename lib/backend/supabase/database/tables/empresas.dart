import '../database.dart';

class EmpresasTable extends SupabaseTable<EmpresasRow> {
  @override
  String get tableName => 'empresas';

  @override
  EmpresasRow createRow(Map<String, dynamic> data) => EmpresasRow(data);
}

class EmpresasRow extends SupabaseDataRow {
  EmpresasRow(super.data);

  @override
  SupabaseTable get table => EmpresasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get logoPic => getField<String>('logo_pic');
  set logoPic(String? value) => setField<String>('logo_pic', value);

  String? get cnpj => getField<String>('cnpj');
  set cnpj(String? value) => setField<String>('cnpj', value);

  dynamic get address => getField<dynamic>('address');
  set address(dynamic value) => setField<dynamic>('address', value);

  String? get segmento => getField<String>('segmento');
  set segmento(String? value) => setField<String>('segmento', value);

  List<String> get interesses => getListField<String>('interesses');
  set interesses(List<String>? value) =>
      setListField<String>('interesses', value);

  double? get faturamentoAtual => getField<double>('faturamento_atual');
  set faturamentoAtual(double? value) =>
      setField<double>('faturamento_atual', value);

  int? get colaboradoresCount => getField<int>('colaboradores_count');
  set colaboradoresCount(int? value) =>
      setField<int>('colaboradores_count', value);

  int? get createdBy => getField<int>('created_by');
  set createdBy(int? value) => setField<int>('created_by', value);

  String? get porte => getField<String>('porte');
  set porte(String? value) => setField<String>('porte', value);
}
