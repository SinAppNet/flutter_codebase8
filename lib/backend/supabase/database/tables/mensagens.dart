import '../database.dart';

class MensagensTable extends SupabaseTable<MensagensRow> {
  @override
  String get tableName => 'mensagens';

  @override
  MensagensRow createRow(Map<String, dynamic> data) => MensagensRow(data);
}

class MensagensRow extends SupabaseDataRow {
  MensagensRow(super.data);

  @override
  SupabaseTable get table => MensagensTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get chat => getField<int>('chat');
  set chat(int? value) => setField<int>('chat', value);

  int? get sender => getField<int>('sender');
  set sender(int? value) => setField<int>('sender', value);

  String? get mensagem => getField<String>('mensagem');
  set mensagem(String? value) => setField<String>('mensagem', value);

  bool? get firstMessageOfDay => getField<bool>('first_message_of_day');
  set firstMessageOfDay(bool? value) =>
      setField<bool>('first_message_of_day', value);

  DateTime? get daySended => getField<DateTime>('day_sended');
  set daySended(DateTime? value) => setField<DateTime>('day_sended', value);
}
