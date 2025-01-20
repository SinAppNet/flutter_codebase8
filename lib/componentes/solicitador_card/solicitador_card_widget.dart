import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'solicitador_card_model.dart';
export 'solicitador_card_model.dart';

class SolicitadorCardWidget extends StatefulWidget {
  const SolicitadorCardWidget({
    super.key,
    required this.conexao,
    required this.callb,
  });

  final ConexaoRow? conexao;
  final Future Function()? callb;

  @override
  State<SolicitadorCardWidget> createState() => _SolicitadorCardWidgetState();
}

class _SolicitadorCardWidgetState extends State<SolicitadorCardWidget> {
  late SolicitadorCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SolicitadorCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: FutureBuilder<List<UsersRow>>(
        future: UsersTable().querySingleRow(
          queryFn: (q) => q.eqOrNull(
            'id',
            widget.conexao?.solicitou,
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
          List<UsersRow> containerUsersRowList = snapshot.data!;

          final containerUsersRow = containerUsersRowList.isNotEmpty
              ? containerUsersRowList.first
              : null;

          return Container(
            width: double.infinity,
            height: 94.0,
            decoration: const BoxDecoration(
              color: Color(0x00FFFFFF),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        'userProfile',
                        queryParameters: {
                          'user': serializeParam(
                            containerUsersRow,
                            ParamType.SupabaseRow,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 62.0,
                          height: 62.0,
                          decoration: BoxDecoration(
                            color: const Color(0x00ECECEC),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                valueOrDefault<String>(
                                  containerUsersRow?.profilePic,
                                  'https://static.vecteezy.com/system/resources/thumbnails/003/337/584/small/default-avatar-photo-placeholder-profile-icon-vector.jpg',
                                ),
                              ).image,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              14.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  containerUsersRow?.nome,
                                  'Username',
                                ).maybeHandleOverflow(
                                  maxChars: 18,
                                  replacement: '…',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: const Color(0xFF101828),
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 2.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    containerUsersRow?.empresaNome,
                                    'Empresa nome',
                                  ).maybeHandleOverflow(
                                    maxChars: 30,
                                    replacement: '…',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: const Color(0xFF101828),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          var confirmDialogResponse = await showDialog<bool>(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      title: const Text('Solicitação de conexão'),
                                      content: Text(
                                          'Confirme se não deseja se conectar com ${containerUsersRow?.nome}'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: const Text('Cancelar'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: const Text('Confirmar'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ) ??
                              false;
                          if (confirmDialogResponse) {
                            await ConexaoTable().update(
                              data: {
                                'status': StatusConexao.recusada.name,
                              },
                              matchingRows: (rows) => rows.eqOrNull(
                                'id',
                                widget.conexao?.id,
                              ),
                            );
                            await widget.callb?.call();
                          }
                        },
                        child: Container(
                          width: 42.0,
                          height: 42.0,
                          decoration: BoxDecoration(
                            color: const Color(0x57F44E45),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Icon(
                            Icons.close_outlined,
                            color: Color(0xFFA40000),
                            size: 18.0,
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          var confirmDialogResponse = await showDialog<bool>(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      title: const Text('Solicitação de conexão'),
                                      content: Text(
                                          'Confirme se deseja se conectar com ${containerUsersRow?.nome}'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: const Text('Cancelar'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: const Text('Confirmar'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ) ??
                              false;
                          if (confirmDialogResponse) {
                            await ConexaoTable().update(
                              data: {
                                'status': StatusConexao.aceita.name,
                              },
                              matchingRows: (rows) => rows.eqOrNull(
                                'id',
                                widget.conexao?.id,
                              ),
                            );
                            await widget.callb?.call();
                            _model.apiResult02mCopy = await SendPushCall.call(
                              fcmToken: containerUsersRow?.fcmToken,
                              pushTitle: 'Conexão aceita!',
                              pushMessage:
                                  '${containerUsersRow?.nome} agora faz parte da sua rede de conexões!',
                              pushImg: containerUsersRow?.profilePic != null &&
                                      containerUsersRow?.profilePic != ''
                                  ? containerUsersRow?.profilePic
                                  : 'https://static.vecteezy.com/system/resources/thumbnails/003/337/584/small/default-avatar-photo-placeholder-profile-icon-vector.jpg',
                            );
                          }

                          safeSetState(() {});
                        },
                        child: Container(
                          width: 42.0,
                          height: 42.0,
                          decoration: BoxDecoration(
                            color: const Color(0x43009C3B),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Icon(
                            Icons.check_sharp,
                            color: Color(0xFF003A1A),
                            size: 18.0,
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(width: 10.0)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
