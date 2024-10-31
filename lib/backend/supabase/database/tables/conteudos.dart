import '../database.dart';

class ConteudosTable extends SupabaseTable<ConteudosRow> {
  @override
  String get tableName => 'conteudos';

  @override
  ConteudosRow createRow(Map<String, dynamic> data) => ConteudosRow(data);
}

class ConteudosRow extends SupabaseDataRow {
  ConteudosRow(super.data);

  @override
  SupabaseTable get table => ConteudosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get refLink => getField<String>('refLink');
  set refLink(String? value) => setField<String>('refLink', value);

  int? get ordem => getField<int>('ordem');
  set ordem(int? value) => setField<int>('ordem', value);
}
