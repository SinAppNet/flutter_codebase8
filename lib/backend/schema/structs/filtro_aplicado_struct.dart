// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FiltroAplicadoStruct extends BaseStruct {
  FiltroAplicadoStruct({
    List<String>? interesses,
    String? cidade,
  })  : _interesses = interesses,
        _cidade = cidade;

  // "interesses" field.
  List<String>? _interesses;
  List<String> get interesses => _interesses ?? const [];
  set interesses(List<String>? val) => _interesses = val;

  void updateInteresses(Function(List<String>) updateFn) {
    updateFn(_interesses ??= []);
  }

  bool hasInteresses() => _interesses != null;

  // "cidade" field.
  String? _cidade;
  String get cidade => _cidade ?? '';
  set cidade(String? val) => _cidade = val;

  bool hasCidade() => _cidade != null;

  static FiltroAplicadoStruct fromMap(Map<String, dynamic> data) =>
      FiltroAplicadoStruct(
        interesses: getDataList(data['interesses']),
        cidade: data['cidade'] as String?,
      );

  static FiltroAplicadoStruct? maybeFromMap(dynamic data) => data is Map
      ? FiltroAplicadoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'interesses': _interesses,
        'cidade': _cidade,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'interesses': serializeParam(
          _interesses,
          ParamType.String,
          isList: true,
        ),
        'cidade': serializeParam(
          _cidade,
          ParamType.String,
        ),
      }.withoutNulls;

  static FiltroAplicadoStruct fromSerializableMap(Map<String, dynamic> data) =>
      FiltroAplicadoStruct(
        interesses: deserializeParam<String>(
          data['interesses'],
          ParamType.String,
          true,
        ),
        cidade: deserializeParam(
          data['cidade'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FiltroAplicadoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is FiltroAplicadoStruct &&
        listEquality.equals(interesses, other.interesses) &&
        cidade == other.cidade;
  }

  @override
  int get hashCode => const ListEquality().hash([interesses, cidade]);
}

FiltroAplicadoStruct createFiltroAplicadoStruct({
  String? cidade,
}) =>
    FiltroAplicadoStruct(
      cidade: cidade,
    );
