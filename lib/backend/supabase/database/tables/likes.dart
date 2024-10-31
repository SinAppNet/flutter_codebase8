import '../database.dart';

class LikesTable extends SupabaseTable<LikesRow> {
  @override
  String get tableName => 'likes';

  @override
  LikesRow createRow(Map<String, dynamic> data) => LikesRow(data);
}

class LikesRow extends SupabaseDataRow {
  LikesRow(super.data);

  @override
  SupabaseTable get table => LikesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get user => getField<int>('user');
  set user(int? value) => setField<int>('user', value);

  bool? get isPost => getField<bool>('isPost');
  set isPost(bool? value) => setField<bool>('isPost', value);

  bool? get isComment => getField<bool>('isComment');
  set isComment(bool? value) => setField<bool>('isComment', value);

  int? get post => getField<int>('post');
  set post(int? value) => setField<int>('post', value);

  int? get comment => getField<int>('comment');
  set comment(int? value) => setField<int>('comment', value);
}
