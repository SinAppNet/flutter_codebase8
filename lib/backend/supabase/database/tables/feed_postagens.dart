import '../database.dart';

class FeedPostagensTable extends SupabaseTable<FeedPostagensRow> {
  @override
  String get tableName => 'feed_postagens';

  @override
  FeedPostagensRow createRow(Map<String, dynamic> data) =>
      FeedPostagensRow(data);
}

class FeedPostagensRow extends SupabaseDataRow {
  FeedPostagensRow(super.data);

  @override
  SupabaseTable get table => FeedPostagensTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get poster => getField<int>('poster');
  set poster(int? value) => setField<int>('poster', value);

  String? get postText => getField<String>('post_text');
  set postText(String? value) => setField<String>('post_text', value);

  String? get postImage => getField<String>('post_image');
  set postImage(String? value) => setField<String>('post_image', value);

  List<String> get postImages => getListField<String>('post_images');
  set postImages(List<String>? value) =>
      setListField<String>('post_images', value);

  bool? get hasImage => getField<bool>('hasImage');
  set hasImage(bool? value) => setField<bool>('hasImage', value);

  bool? get isSingleImage => getField<bool>('isSingleImage');
  set isSingleImage(bool? value) => setField<bool>('isSingleImage', value);

  List<dynamic> get likes => getListField<dynamic>('likes');
  set likes(List<dynamic>? value) => setListField<dynamic>('likes', value);

  bool? get approved => getField<bool>('approved');
  set approved(bool? value) => setField<bool>('approved', value);
}
