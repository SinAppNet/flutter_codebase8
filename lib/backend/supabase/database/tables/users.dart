import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(super.data);

  @override
  SupabaseTable get table => UsersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get uuid => getField<String>('uuid');
  set uuid(String? value) => setField<String>('uuid', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get instagram => getField<String>('instagram');
  set instagram(String? value) => setField<String>('instagram', value);

  String? get linkedin => getField<String>('linkedin');
  set linkedin(String? value) => setField<String>('linkedin', value);

  String? get whatsapp => getField<String>('whatsapp');
  set whatsapp(String? value) => setField<String>('whatsapp', value);

  String? get sobre => getField<String>('sobre');
  set sobre(String? value) => setField<String>('sobre', value);

  String? get profilePic => getField<String>('profile_pic');
  set profilePic(String? value) => setField<String>('profile_pic', value);

  int? get empresa => getField<int>('empresa');
  set empresa(int? value) => setField<int>('empresa', value);

  String? get cargo => getField<String>('cargo');
  set cargo(String? value) => setField<String>('cargo', value);

  String? get empresaNome => getField<String>('empresa_nome');
  set empresaNome(String? value) => setField<String>('empresa_nome', value);

  List<String> get interesses => getListField<String>('interesses');
  set interesses(List<String>? value) =>
      setListField<String>('interesses', value);

  bool? get onboarding => getField<bool>('onboarding');
  set onboarding(bool? value) => setField<bool>('onboarding', value);

  bool? get perfilCompleto => getField<bool>('perfil_completo');
  set perfilCompleto(bool? value) => setField<bool>('perfil_completo', value);

  String? get fcmToken => getField<String>('fcm_token');
  set fcmToken(String? value) => setField<String>('fcm_token', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get site => getField<String>('site');
  set site(String? value) => setField<String>('site', value);

  String? get tipoConexao => getField<String>('tipo_conexao');
  set tipoConexao(String? value) => setField<String>('tipo_conexao', value);

  String? get segmentoEmpresa => getField<String>('segmento_empresa');
  set segmentoEmpresa(String? value) =>
      setField<String>('segmento_empresa', value);

  String? get cidadePrincipal => getField<String>('cidade_principal');
  set cidadePrincipal(String? value) =>
      setField<String>('cidade_principal', value);

  String? get estadoPrincipal => getField<String>('estado_principal');
  set estadoPrincipal(String? value) =>
      setField<String>('estado_principal', value);

  bool? get initRecommend => getField<bool>('init_recommend');
  set initRecommend(bool? value) => setField<bool>('init_recommend', value);

  String? get asaasCustomerId => getField<String>('asaas_customer_id');
  set asaasCustomerId(String? value) =>
      setField<String>('asaas_customer_id', value);

  int? get planoAtual => getField<int>('plano_atual');
  set planoAtual(int? value) => setField<int>('plano_atual', value);

  bool? get premium => getField<bool>('premium');
  set premium(bool? value) => setField<bool>('premium', value);

  bool? get in7daysTrial => getField<bool>('in_7days_trial');
  set in7daysTrial(bool? value) => setField<bool>('in_7days_trial', value);

  bool? get field7daysTrialEnded => getField<bool>('7days_trial_ended');
  set field7daysTrialEnded(bool? value) =>
      setField<bool>('7days_trial_ended', value);

  String? get referredCode => getField<String>('referred_code');
  set referredCode(String? value) => setField<String>('referred_code', value);

  int? get destaque => getField<int>('destaque');
  set destaque(int? value) => setField<int>('destaque', value);
}
