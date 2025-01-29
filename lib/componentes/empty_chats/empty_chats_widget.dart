import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/limit_views_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'empty_chats_model.dart';
export 'empty_chats_model.dart';

class EmptyChatsWidget extends StatefulWidget {
  const EmptyChatsWidget({super.key});

  @override
  State<EmptyChatsWidget> createState() => _EmptyChatsWidgetState();
}

class _EmptyChatsWidgetState extends State<EmptyChatsWidget> {
  late EmptyChatsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyChatsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Oopss...nada por aqui \nainda',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      color: const Color(0xFF76767C),
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/undraw_mobile_messages_re_yx8w_1.png',
                    width: 181.0,
                    height: 155.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15.0, 40.0, 15.0, 0.0),
                child: Text(
                  'Você ainda não tem nenhuma conexão ativa, clique aqui para começar uma nova!',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: const Color(0xFF76767C),
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Builder(
                builder: (context) => Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      var shouldSetState = false;
                      _model.userd = await UsersTable().queryRows(
                        queryFn: (q) => q.eqOrNull(
                          'uuid',
                          currentUserUid,
                        ),
                      );
                      shouldSetState = true;
                      if (_model.userd?.firstOrNull?.perfilCompleto == true) {
                        _model.matchTrack =
                            await MatchTrackingTable().queryRows(
                          queryFn: (q) => q
                              .eqOrNull(
                                'user',
                                FFAppState().currentUser.id,
                              )
                              .eqOrNull(
                                'date',
                                supaSerialize<DateTime>(getCurrentTimestamp),
                              ),
                        );
                        shouldSetState = true;
                        if (_model.matchTrack?.firstOrNull?.qntdDisponivel ==
                            0) {
                          await showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: const AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: const WebViewAware(
                                  child: SizedBox(
                                    height: double.infinity,
                                    width: double.infinity,
                                    child: LimitViewsWidget(
                                      type: 'recomendacoes',
                                    ),
                                  ),
                                ),
                              );
                            },
                          );

                          if (shouldSetState) safeSetState(() {});
                          return;
                        } else {
                          if (_model
                                  .matchTrack?.firstOrNull?.likesDisponiveis ==
                              0) {
                            await showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: const AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: const WebViewAware(
                                    child: SizedBox(
                                      height: double.infinity,
                                      width: double.infinity,
                                      child: LimitViewsWidget(
                                        type: 'likes',
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          } else {
                            context.pushNamed(
                              'matchPage',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );

                            unawaited(
                              () async {
                                await action_blocks.appTracking(
                                  context,
                                  userid: FFAppState().currentUser.id,
                                  eventName: 'abrir-central-conexoes',
                                );
                              }(),
                            );
                          }

                          if (shouldSetState) safeSetState(() {});
                          return;
                        }
                      } else {
                        await showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: const AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: const WebViewAware(
                                child: SizedBox(
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: LimitViewsWidget(
                                    type: 'completarPerfil',
                                  ),
                                ),
                              ),
                            );
                          },
                        );

                        if (shouldSetState) safeSetState(() {});
                        return;
                      }

                      if (shouldSetState) safeSetState(() {});
                    },
                    text: 'Nova conexão',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: const Color(0xFF009C3B),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Inter',
                                color: Colors.white,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    showLoadingIndicator: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
