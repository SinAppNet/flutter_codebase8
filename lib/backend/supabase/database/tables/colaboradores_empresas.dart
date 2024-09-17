import '../database.dart';

class ColaboradoresEmpresasTable
    extends SupabaseTable<ColaboradoresEmpresasRow> {
  @override
  String get tableName => 'colaboradores_empresas';

  @override
  ColaboradoresEmpresasRow createRow(Map<String, dynamic> data) =>
      ColaboradoresEmpresasRow(data);
}

class ColaboradoresEmpresasRow extends SupabaseDataRow {
  ColaboradoresEmpresasRow(super.data);

  @override
  SupabaseTable get table => ColaboradoresEmpresasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get empresa => getField<int>('empresa');
  set empresa(int? value) => setField<int>('empresa', value);

  int? get colaborador => getField<int>('colaborador');
  set colaborador(int? value) => setField<int>('colaborador', value);

  String? get cargoColaborador => getField<String>('cargo_colaborador');
  set cargoColaborador(String? value) =>
      setField<String>('cargo_colaborador', value);
}
