// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FiltroAplicadoStruct extends BaseStruct {
  FiltroAplicadoStruct({
    String? estado,
    String? segmento,
  })  : _estado = estado,
        _segmento = segmento;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  set estado(String? val) => _estado = val;

  bool hasEstado() => _estado != null;

  // "segmento" field.
  String? _segmento;
  String get segmento => _segmento ?? '';
  set segmento(String? val) => _segmento = val;

  bool hasSegmento() => _segmento != null;

  static FiltroAplicadoStruct fromMap(Map<String, dynamic> data) =>
      FiltroAplicadoStruct(
        estado: data['estado'] as String?,
        segmento: data['segmento'] as String?,
      );

  static FiltroAplicadoStruct? maybeFromMap(dynamic data) => data is Map
      ? FiltroAplicadoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'estado': _estado,
        'segmento': _segmento,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'estado': serializeParam(
          _estado,
          ParamType.String,
        ),
        'segmento': serializeParam(
          _segmento,
          ParamType.String,
        ),
      }.withoutNulls;

  static FiltroAplicadoStruct fromSerializableMap(Map<String, dynamic> data) =>
      FiltroAplicadoStruct(
        estado: deserializeParam(
          data['estado'],
          ParamType.String,
          false,
        ),
        segmento: deserializeParam(
          data['segmento'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FiltroAplicadoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FiltroAplicadoStruct &&
        estado == other.estado &&
        segmento == other.segmento;
  }

  @override
  int get hashCode => const ListEquality().hash([estado, segmento]);
}

FiltroAplicadoStruct createFiltroAplicadoStruct({
  String? estado,
  String? segmento,
}) =>
    FiltroAplicadoStruct(
      estado: estado,
      segmento: segmento,
    );
