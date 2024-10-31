// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CurrentUserStruct extends BaseStruct {
  CurrentUserStruct({
    int? id,
    String? nome,
    String? email,
    String? profilePic,
    String? sobre,
    String? whatsapp,
    String? instagram,
    String? linkedin,
    int? empresaId,
    String? cargo,
    int? cDisp,
    List<String>? interesses,
    bool? perfilCompleto,
    String? customerIdAsaas,
    bool? premium,
    String? currentPlan,
  })  : _id = id,
        _nome = nome,
        _email = email,
        _profilePic = profilePic,
        _sobre = sobre,
        _whatsapp = whatsapp,
        _instagram = instagram,
        _linkedin = linkedin,
        _empresaId = empresaId,
        _cargo = cargo,
        _cDisp = cDisp,
        _interesses = interesses,
        _perfilCompleto = perfilCompleto,
        _customerIdAsaas = customerIdAsaas,
        _premium = premium,
        _currentPlan = currentPlan;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "profile_pic" field.
  String? _profilePic;
  String get profilePic => _profilePic ?? '';
  set profilePic(String? val) => _profilePic = val;

  bool hasProfilePic() => _profilePic != null;

  // "sobre" field.
  String? _sobre;
  String get sobre => _sobre ?? '';
  set sobre(String? val) => _sobre = val;

  bool hasSobre() => _sobre != null;

  // "whatsapp" field.
  String? _whatsapp;
  String get whatsapp => _whatsapp ?? '';
  set whatsapp(String? val) => _whatsapp = val;

  bool hasWhatsapp() => _whatsapp != null;

  // "instagram" field.
  String? _instagram;
  String get instagram => _instagram ?? '';
  set instagram(String? val) => _instagram = val;

  bool hasInstagram() => _instagram != null;

  // "linkedin" field.
  String? _linkedin;
  String get linkedin => _linkedin ?? '';
  set linkedin(String? val) => _linkedin = val;

  bool hasLinkedin() => _linkedin != null;

  // "empresa_id" field.
  int? _empresaId;
  int get empresaId => _empresaId ?? 0;
  set empresaId(int? val) => _empresaId = val;

  void incrementEmpresaId(int amount) => empresaId = empresaId + amount;

  bool hasEmpresaId() => _empresaId != null;

  // "cargo" field.
  String? _cargo;
  String get cargo => _cargo ?? '';
  set cargo(String? val) => _cargo = val;

  bool hasCargo() => _cargo != null;

  // "cDisp" field.
  int? _cDisp;
  int get cDisp => _cDisp ?? 0;
  set cDisp(int? val) => _cDisp = val;

  void incrementCDisp(int amount) => cDisp = cDisp + amount;

  bool hasCDisp() => _cDisp != null;

  // "interesses" field.
  List<String>? _interesses;
  List<String> get interesses => _interesses ?? const [];
  set interesses(List<String>? val) => _interesses = val;

  void updateInteresses(Function(List<String>) updateFn) {
    updateFn(_interesses ??= []);
  }

  bool hasInteresses() => _interesses != null;

  // "perfil_completo" field.
  bool? _perfilCompleto;
  bool get perfilCompleto => _perfilCompleto ?? false;
  set perfilCompleto(bool? val) => _perfilCompleto = val;

  bool hasPerfilCompleto() => _perfilCompleto != null;

  // "customer_id_asaas" field.
  String? _customerIdAsaas;
  String get customerIdAsaas => _customerIdAsaas ?? '';
  set customerIdAsaas(String? val) => _customerIdAsaas = val;

  bool hasCustomerIdAsaas() => _customerIdAsaas != null;

  // "premium" field.
  bool? _premium;
  bool get premium => _premium ?? false;
  set premium(bool? val) => _premium = val;

  bool hasPremium() => _premium != null;

  // "currentPlan" field.
  String? _currentPlan;
  String get currentPlan => _currentPlan ?? '';
  set currentPlan(String? val) => _currentPlan = val;

  bool hasCurrentPlan() => _currentPlan != null;

  static CurrentUserStruct fromMap(Map<String, dynamic> data) =>
      CurrentUserStruct(
        id: castToType<int>(data['id']),
        nome: data['nome'] as String?,
        email: data['email'] as String?,
        profilePic: data['profile_pic'] as String?,
        sobre: data['sobre'] as String?,
        whatsapp: data['whatsapp'] as String?,
        instagram: data['instagram'] as String?,
        linkedin: data['linkedin'] as String?,
        empresaId: castToType<int>(data['empresa_id']),
        cargo: data['cargo'] as String?,
        cDisp: castToType<int>(data['cDisp']),
        interesses: getDataList(data['interesses']),
        perfilCompleto: data['perfil_completo'] as bool?,
        customerIdAsaas: data['customer_id_asaas'] as String?,
        premium: data['premium'] as bool?,
        currentPlan: data['currentPlan'] as String?,
      );

  static CurrentUserStruct? maybeFromMap(dynamic data) => data is Map
      ? CurrentUserStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'nome': _nome,
        'email': _email,
        'profile_pic': _profilePic,
        'sobre': _sobre,
        'whatsapp': _whatsapp,
        'instagram': _instagram,
        'linkedin': _linkedin,
        'empresa_id': _empresaId,
        'cargo': _cargo,
        'cDisp': _cDisp,
        'interesses': _interesses,
        'perfil_completo': _perfilCompleto,
        'customer_id_asaas': _customerIdAsaas,
        'premium': _premium,
        'currentPlan': _currentPlan,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'profile_pic': serializeParam(
          _profilePic,
          ParamType.String,
        ),
        'sobre': serializeParam(
          _sobre,
          ParamType.String,
        ),
        'whatsapp': serializeParam(
          _whatsapp,
          ParamType.String,
        ),
        'instagram': serializeParam(
          _instagram,
          ParamType.String,
        ),
        'linkedin': serializeParam(
          _linkedin,
          ParamType.String,
        ),
        'empresa_id': serializeParam(
          _empresaId,
          ParamType.int,
        ),
        'cargo': serializeParam(
          _cargo,
          ParamType.String,
        ),
        'cDisp': serializeParam(
          _cDisp,
          ParamType.int,
        ),
        'interesses': serializeParam(
          _interesses,
          ParamType.String,
          isList: true,
        ),
        'perfil_completo': serializeParam(
          _perfilCompleto,
          ParamType.bool,
        ),
        'customer_id_asaas': serializeParam(
          _customerIdAsaas,
          ParamType.String,
        ),
        'premium': serializeParam(
          _premium,
          ParamType.bool,
        ),
        'currentPlan': serializeParam(
          _currentPlan,
          ParamType.String,
        ),
      }.withoutNulls;

  static CurrentUserStruct fromSerializableMap(Map<String, dynamic> data) =>
      CurrentUserStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        profilePic: deserializeParam(
          data['profile_pic'],
          ParamType.String,
          false,
        ),
        sobre: deserializeParam(
          data['sobre'],
          ParamType.String,
          false,
        ),
        whatsapp: deserializeParam(
          data['whatsapp'],
          ParamType.String,
          false,
        ),
        instagram: deserializeParam(
          data['instagram'],
          ParamType.String,
          false,
        ),
        linkedin: deserializeParam(
          data['linkedin'],
          ParamType.String,
          false,
        ),
        empresaId: deserializeParam(
          data['empresa_id'],
          ParamType.int,
          false,
        ),
        cargo: deserializeParam(
          data['cargo'],
          ParamType.String,
          false,
        ),
        cDisp: deserializeParam(
          data['cDisp'],
          ParamType.int,
          false,
        ),
        interesses: deserializeParam<String>(
          data['interesses'],
          ParamType.String,
          true,
        ),
        perfilCompleto: deserializeParam(
          data['perfil_completo'],
          ParamType.bool,
          false,
        ),
        customerIdAsaas: deserializeParam(
          data['customer_id_asaas'],
          ParamType.String,
          false,
        ),
        premium: deserializeParam(
          data['premium'],
          ParamType.bool,
          false,
        ),
        currentPlan: deserializeParam(
          data['currentPlan'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CurrentUserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CurrentUserStruct &&
        id == other.id &&
        nome == other.nome &&
        email == other.email &&
        profilePic == other.profilePic &&
        sobre == other.sobre &&
        whatsapp == other.whatsapp &&
        instagram == other.instagram &&
        linkedin == other.linkedin &&
        empresaId == other.empresaId &&
        cargo == other.cargo &&
        cDisp == other.cDisp &&
        listEquality.equals(interesses, other.interesses) &&
        perfilCompleto == other.perfilCompleto &&
        customerIdAsaas == other.customerIdAsaas &&
        premium == other.premium &&
        currentPlan == other.currentPlan;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        nome,
        email,
        profilePic,
        sobre,
        whatsapp,
        instagram,
        linkedin,
        empresaId,
        cargo,
        cDisp,
        interesses,
        perfilCompleto,
        customerIdAsaas,
        premium,
        currentPlan
      ]);
}

CurrentUserStruct createCurrentUserStruct({
  int? id,
  String? nome,
  String? email,
  String? profilePic,
  String? sobre,
  String? whatsapp,
  String? instagram,
  String? linkedin,
  int? empresaId,
  String? cargo,
  int? cDisp,
  bool? perfilCompleto,
  String? customerIdAsaas,
  bool? premium,
  String? currentPlan,
}) =>
    CurrentUserStruct(
      id: id,
      nome: nome,
      email: email,
      profilePic: profilePic,
      sobre: sobre,
      whatsapp: whatsapp,
      instagram: instagram,
      linkedin: linkedin,
      empresaId: empresaId,
      cargo: cargo,
      cDisp: cDisp,
      perfilCompleto: perfilCompleto,
      customerIdAsaas: customerIdAsaas,
      premium: premium,
      currentPlan: currentPlan,
    );
