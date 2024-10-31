import '../database.dart';

class FeedComentariosTable extends SupabaseTable<FeedComentariosRow> {
  @override
  String get tableName => 'feed_comentarios';

  @override
  FeedComentariosRow createRow(Map<String, dynamic> data) =>
      FeedComentariosRow(data);
}

class FeedComentariosRow extends SupabaseDataRow {
  FeedComentariosRow(super.data);

  @override
  SupabaseTable get table => FeedComentariosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  bool? get onPost => getField<bool>('onPost');
  set onPost(bool? value) => setField<bool>('onPost', value);

  int? get post => getField<int>('post');
  set post(int? value) => setField<int>('post', value);

  bool? get onComment => getField<bool>('onComment');
  set onComment(bool? value) => setField<bool>('onComment', value);

  int? get comment => getField<int>('comment');
  set comment(int? value) => setField<int>('comment', value);

  int? get commenter => getField<int>('commenter');
  set commenter(int? value) => setField<int>('commenter', value);

  String? get commentText => getField<String>('comment_text');
  set commentText(String? value) => setField<String>('comment_text', value);

  DateTime? get timestamp => getField<DateTime>('timestamp');
  set timestamp(DateTime? value) => setField<DateTime>('timestamp', value);
}
