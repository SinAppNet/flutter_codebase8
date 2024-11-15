import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/componentes/usuario_nao_conectado/usuario_nao_conectado_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'usser_card_model.dart';
export 'usser_card_model.dart';

class UsserCardWidget extends StatefulWidget {
  const UsserCardWidget({
    super.key,
    required this.user,
    this.action,
    this.idx,
    int? temp,
  }) : temp = temp ?? 0;

  final UsuariosSemConexaoAceitaRow? user;
  final Future Function()? action;
  final int? idx;
  final int temp;

  @override
  State<UsserCardWidget> createState() => _UsserCardWidgetState();
}

class _UsserCardWidgetState extends State<UsserCardWidget>
    with TickerProviderStateMixin {
  late UsserCardModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UsserCardModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(-3.0, 0.0),
            end: const Offset(100.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(-3.0, 0.0),
            end: const Offset(100.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        _model.usr = await UsersTable().queryRows(
          queryFn: (q) => q.eq(
            'id',
            widget.user!.id!,
          ),
        );
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return WebViewAware(
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.95,
                  child: UsuarioNaoConectadoWidget(
                    user: _model.usr!.first,
                    solicitacao: widget.user?.solicitacao,
                    temp: widget.temp,
                    callback: () async {},
                  ),
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));

        await widget.action?.call();

        safeSetState(() {});
      },
      child: Container(
        width: 300.0,
        height: 320.0,
        decoration: BoxDecoration(
          color: const Color(0x00D6D6D6),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(
              valueOrDefault<String>(
                widget.user?.profilePic,
                'https://static.vecteezy.com/system/resources/thumbnails/003/337/584/small/default-avatar-photo-placeholder-profile-icon-vector.jpg',
              ),
            ),
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0x4CFFFFFF),
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 154.0,
                              decoration: const BoxDecoration(
                                color: Color(0x33000000),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 2.0,
                                  sigmaY: 20.0,
                                ),
                                child: Stack(
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  widget.user?.nome,
                                                  'Username',
                                                ).maybeHandleOverflow(
                                                  maxChars: 15,
                                                  replacement: '…',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: Colors.white,
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                              const Icon(
                                                Icons.arrow_outward_sharp,
                                                color: Colors.white,
                                                size: 24.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 20.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  widget.user?.sobre,
                                                  'Sobre',
                                                ),
                                                maxLines: 3,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(const SizedBox(height: 10.0)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 85.0, 0.0, 0.0),
                                        child: FutureBuilder<List<ConexaoRow>>(
                                          future: FFAppState()
                                              .card(
                                            requestFn: () =>
                                                ConexaoTable().querySingleRow(
                                              queryFn: (q) => q.eq(
                                                'id',
                                                widget.user!.solicitacao!,
                                              ),
                                            ),
                                          )
                                              .then((result) {
                                            _model.requestCompleted = true;
                                            return result;
                                          }),
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
                                            List<ConexaoRow>
                                                columnConexaoRowList =
                                                snapshot.data!;

                                            final columnConexaoRow =
                                                columnConexaoRowList.isNotEmpty
                                                    ? columnConexaoRowList.first
                                                    : null;

                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                if (widget.user?.solicitacao ==
                                                    null)
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.89, -1.19),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        if (widget.temp == 1) {
                                                          await ConexaoTable()
                                                              .insert({
                                                            'solicitou':
                                                                FFAppState()
                                                                    .currentUser
                                                                    .id,
                                                            'solicitado':
                                                                widget
                                                                    .user?.id,
                                                            'status':
                                                                StatusConexao
                                                                    .aceita
                                                                    .name,
                                                          });
                                                          await widget.action
                                                              ?.call();
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Conexão realizada com sucesso!',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          );
                                                          _model.usres =
                                                              await UsersTable()
                                                                  .queryRows(
                                                            queryFn: (q) =>
                                                                q.eq(
                                                              'id',
                                                              widget.user!.id!,
                                                            ),
                                                          );
                                                          _model.apiResultnx6a =
                                                              await SendPushCall
                                                                  .call(
                                                            fcmToken: _model
                                                                .usres
                                                                ?.first
                                                                .fcmToken,
                                                            pushTitle:
                                                                'Nova conexão!',
                                                            pushMessage:
                                                                '${_model.usres?.first.nome} fez uma conexão com você!',
                                                            pushImg: _model
                                                                            .usres
                                                                            ?.first
                                                                            .profilePic !=
                                                                        null &&
                                                                    _model
                                                                            .usres
                                                                            ?.first
                                                                            .profilePic !=
                                                                        ''
                                                                ? _model
                                                                    .usres
                                                                    ?.first
                                                                    .profilePic
                                                                : 'https://static.vecteezy.com/system/resources/thumbnails/003/337/584/small/default-avatar-photo-placeholder-profile-icon-vector.jpg',
                                                          );

                                                          FFAppState()
                                                                  .initAvance =
                                                              true;
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            FFAppState()
                                                                .clearCardCache();
                                                            _model.requestCompleted =
                                                                false;
                                                          });
                                                          await _model
                                                              .waitForRequestCompleted();
                                                          await widget.action
                                                              ?.call();
                                                        } else {
                                                          var confirmDialogResponse =
                                                              await showDialog<
                                                                      bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return WebViewAware(
                                                                        child:
                                                                            AlertDialog(
                                                                          title:
                                                                              const Text('Enviar solicitação'),
                                                                          content:
                                                                              Text('Confirme se deseja enviar uma solicitação de conexão para ${widget.user?.nome}'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                              child: const Text('Cancelar'),
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                              child: const Text('Confirmar'),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  ) ??
                                                                  false;
                                                          if (confirmDialogResponse) {
                                                            await ConexaoTable()
                                                                .insert({
                                                              'solicitou':
                                                                  FFAppState()
                                                                      .currentUser
                                                                      .id,
                                                              'solicitado':
                                                                  widget
                                                                      .user?.id,
                                                              'status':
                                                                  StatusConexao
                                                                      .solicitada
                                                                      .name,
                                                            });
                                                            await widget.action
                                                                ?.call();
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Solicitação de conexão enviada.',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                            _model.usre =
                                                                await UsersTable()
                                                                    .queryRows(
                                                              queryFn: (q) =>
                                                                  q.eq(
                                                                'id',
                                                                widget
                                                                    .user!.id!,
                                                              ),
                                                            );
                                                            _model.apiResultnx6 =
                                                                await SendPushCall
                                                                    .call(
                                                              fcmToken: _model
                                                                  .usre
                                                                  ?.first
                                                                  .fcmToken,
                                                              pushTitle:
                                                                  'Solicitação de conexão',
                                                              pushMessage:
                                                                  '${widget.user?.nome} quer fazer uma conexão com você!',
                                                              pushImg: _model
                                                                              .usre
                                                                              ?.first
                                                                              .profilePic !=
                                                                          null &&
                                                                      _model.usre?.first
                                                                              .profilePic !=
                                                                          ''
                                                                  ? _model
                                                                      .usre
                                                                      ?.first
                                                                      .profilePic
                                                                  : 'https://static.vecteezy.com/system/resources/thumbnails/003/337/584/small/default-avatar-photo-placeholder-profile-icon-vector.jpg',
                                                            );
                                                          }
                                                        }

                                                        safeSetState(() {});
                                                      },
                                                      child: Container(
                                                        width: 60.0,
                                                        height: 60.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              const Color(0xFF009C3B),
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              blurRadius: 4.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                0.0,
                                                                2.0,
                                                              ),
                                                              spreadRadius: 1.0,
                                                            )
                                                          ],
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  10.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/image-user-plus_(1).png',
                                                                  width: 24.0,
                                                                  height: 24.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation1']!,
                                                    ),
                                                  ),
                                                if (widget.user?.solicitacao !=
                                                    null)
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.89, -1.19),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        var confirmDialogResponse =
                                                            await showDialog<
                                                                    bool>(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return WebViewAware(
                                                                      child:
                                                                          AlertDialog(
                                                                        title: const Text(
                                                                            'Cancelar solicitação'),
                                                                        content:
                                                                            Text('Confirme se deseja cancelar a solicitação de conexão com ${widget.user?.nome}'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, false),
                                                                            child:
                                                                                const Text('Cancelar'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, true),
                                                                            child:
                                                                                const Text('Confirmar'),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                ) ??
                                                                false;
                                                        if (confirmDialogResponse) {
                                                          await ConexaoTable()
                                                              .delete(
                                                            matchingRows:
                                                                (rows) =>
                                                                    rows.eq(
                                                              'id',
                                                              widget.user!
                                                                  .solicitacao!,
                                                            ),
                                                          );
                                                          await widget.action
                                                              ?.call();
                                                        }
                                                      },
                                                      child: Container(
                                                        width: 60.0,
                                                        height: 60.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .warning,
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              blurRadius: 4.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                0.0,
                                                                2.0,
                                                              ),
                                                              spreadRadius: 1.0,
                                                            )
                                                          ],
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  10.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/image-user-plus_(1).png',
                                                                  width: 24.0,
                                                                  height: 24.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation2']!,
                                                    ),
                                                  ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (widget.user?.premium == true)
              Align(
                alignment: const AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 12.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      'https://static.vecteezy.com/system/resources/thumbnails/047/309/918/small_2x/verified-badge-profile-icon-png.png',
                      width: 42.0,
                      height: 42.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
