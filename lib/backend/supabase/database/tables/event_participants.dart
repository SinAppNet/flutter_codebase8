import '../database.dart';

class EventParticipantsTable extends SupabaseTable<EventParticipantsRow> {
  @override
  String get tableName => 'event_participants';

  @override
  EventParticipantsRow createRow(Map<String, dynamic> data) =>
      EventParticipantsRow(data);
}

class EventParticipantsRow extends SupabaseDataRow {
  EventParticipantsRow(super.data);

  @override
  SupabaseTable get table => EventParticipantsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get eventId => getField<int>('event_id');
  set eventId(int? value) => setField<int>('event_id', value);

  int? get userId => getField<int>('user_id');
  set userId(int? value) => setField<int>('user_id', value);

  DateTime? get joinedAt => getField<DateTime>('joined_at');
  set joinedAt(DateTime? value) => setField<DateTime>('joined_at', value);

  DateTime? get leftAt => getField<DateTime>('left_at');
  set leftAt(DateTime? value) => setField<DateTime>('left_at', value);
}
