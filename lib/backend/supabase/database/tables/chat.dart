import '../database.dart';

class ChatTable extends SupabaseTable<ChatRow> {
  @override
  String get tableName => 'chat';

  @override
  ChatRow createRow(Map<String, dynamic> data) => ChatRow(data);
}

class ChatRow extends SupabaseDataRow {
  ChatRow(super.data);

  @override
  SupabaseTable get table => ChatTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  List<int> get users => getListField<int>('users');
  set users(List<int>? value) => setListField<int>('users', value);

  int? get messagesCount => getField<int>('messagesCount');
  set messagesCount(int? value) => setField<int>('messagesCount', value);

  String? get lastMessage => getField<String>('last_message');
  set lastMessage(String? value) => setField<String>('last_message', value);

  DateTime? get lastUpdate => getField<DateTime>('last_update');
  set lastUpdate(DateTime? value) => setField<DateTime>('last_update', value);
}
