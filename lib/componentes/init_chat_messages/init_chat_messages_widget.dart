import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'init_chat_messages_model.dart';
export 'init_chat_messages_model.dart';

class InitChatMessagesWidget extends StatefulWidget {
  const InitChatMessagesWidget({
    super.key,
    required this.username,
    this.mensagem,
  });

  final int? username;
  final Future Function(String? message)? mensagem;

  @override
  State<InitChatMessagesWidget> createState() => _InitChatMessagesWidgetState();
}

class _InitChatMessagesWidgetState extends State<InitChatMessagesWidget> {
  late InitChatMessagesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InitChatMessagesModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.usr = await UsersTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget.username,
        ),
      );
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
      child: FutureBuilder<List<UsersRow>>(
        future: UsersTable().querySingleRow(
          queryFn: (q) => q.eqOrNull(
            'id',
            widget.username,
          ),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return const Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitPulse(
                  color: Color(0xFF009C3B),
                  size: 50.0,
                ),
              ),
            );
          }
          List<UsersRow> columnUsersRowList = snapshot.data!;

          final columnUsersRow =
              columnUsersRowList.isNotEmpty ? columnUsersRowList.first : null;

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Escreva ou escolha abaixo sua primeira mensagem!',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await widget.mensagem?.call(
                    'Olá ${valueOrDefault<String>(
                      _model.usr?.firstOrNull?.nome,
                      'username',
                    )}, acabamos de nos conectar! Que tal agendarmos uma call para nos conhecermos melhor e entender como podemos somar nos nossos negócios?',
                  );
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00524B),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Agendar Reunião',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Olá ',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: functions
                                    .newCustomFunctionz(columnUsersRow!.nome!),
                                style: const TextStyle(),
                              ),
                              const TextSpan(
                                text:
                                    ', acabamos de nos conectar! Que tal agendarmos uma call para nos conhecermos melhor e entender como podemos somar nos nossos negócios?',
                                style: TextStyle(),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ].divide(const SizedBox(height: 12.0)),
                    ),
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await widget.mensagem?.call(
                    'Olá ${valueOrDefault<String>(
                      _model.usr?.firstOrNull?.nome,
                      'username',
                    )}, acabamos de nos conectar! Gostaria de aproveitar para apresentar [meu produto/serviço], que pode ajudar você a [resolver um problema/atingir um objetivo específico]. Vamos conversar mais sobre como isso pode beneficiar seu negócio?',
                  );
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00524B),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Oferecer Produto/Serviço',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Olá ',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: functions
                                    .newCustomFunctionz(columnUsersRow.nome!),
                                style: const TextStyle(),
                              ),
                              const TextSpan(
                                text:
                                    ', acabamos de nos conectar! Gostaria de aproveitar para apresentar [meu produto/serviço], que pode ajudar você a [resolver um problema/atingir um objetivo específico]. Vamos conversar mais sobre como isso pode beneficiar seu negócio?',
                                style: TextStyle(),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ].divide(const SizedBox(height: 12.0)),
                    ),
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await widget.mensagem?.call(
                    'Olá ${valueOrDefault<String>(
                      _model.usr?.firstOrNull?.nome,
                      'username',
                    )}, estou em busca de [insira necessidade]. Será que você pode me ajudar ou conhece alguém que possa?',
                  );
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00524B),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Buscar Apoio',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Oi ',
                                style: TextStyle(),
                              ),
                              TextSpan(
                                text: functions
                                    .newCustomFunctionz(columnUsersRow.nome!),
                                style: const TextStyle(),
                              ),
                              const TextSpan(
                                text:
                                    ', estou em busca de [insira necessidade]. Será que você pode me ajudar ou conhece alguém que possa?',
                                style: TextStyle(),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ].divide(const SizedBox(height: 12.0)),
                    ),
                  ),
                ),
              ),
            ].divide(const SizedBox(height: 12.0)),
          );
        },
      ),
    );
  }
}
