import '/backend/supabase/supabase.dart';
import '/componentes/current_user_profile/current_user_profile_widget.dart';
import '/componentes/usuario_conectado/usuario_conectado_widget.dart';
import '/componentes/usuario_nao_conectado/usuario_nao_conectado_widget.dart';
import '/components/comments_widget.dart';
import '/components/write_post_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'postagem_model.dart';
export 'postagem_model.dart';

class PostagemWidget extends StatefulWidget {
  const PostagemWidget({
    super.key,
    this.feed,
    this.callback,
  });

  final FeedPostagensRow? feed;
  final Future Function()? callback;

  @override
  State<PostagemWidget> createState() => _PostagemWidgetState();
}

class _PostagemWidgetState extends State<PostagemWidget> {
  late PostagemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostagemModel());

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

    return Material(
      color: Colors.transparent,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<List<UsersRow>>(
                future:
                    (_model.requestCompleter3 ??= Completer<List<UsersRow>>()
                          ..complete(UsersTable().querySingleRow(
                            queryFn: (q) => q.eq(
                              'id',
                              widget.feed?.poster,
                            ),
                          )))
                        .future,
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
                  List<UsersRow> rowUsersRowList = snapshot.data!;

                  final rowUsersRow =
                      rowUsersRowList.isNotEmpty ? rowUsersRowList.first : null;

                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          var shouldSetState = false;
                          if (rowUsersRow.id == FFAppState().currentUser.id) {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return WebViewAware(
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.95,
                                      child: const CurrentUserProfileWidget(),
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));

                            if (shouldSetState) safeSetState(() {});
                            return;
                          } else {
                            _model.try1 = await ConexaoTable().queryRows(
                              queryFn: (q) => q
                                  .eq(
                                    'status',
                                    'aceita',
                                  )
                                  .eq(
                                    'solicitou',
                                    rowUsersRow.id,
                                  )
                                  .eq(
                                    'solicitado',
                                    FFAppState().currentUser.id,
                                  ),
                            );
                            shouldSetState = true;
                            if (_model.try1 != null &&
                                (_model.try1)!.isNotEmpty) {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return WebViewAware(
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.95,
                                        child: UsuarioConectadoWidget(
                                          user: rowUsersRow,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));

                              if (shouldSetState) safeSetState(() {});
                              return;
                            } else {
                              _model.try2 = await ConexaoTable().queryRows(
                                queryFn: (q) => q
                                    .eq(
                                      'status',
                                      'aceita',
                                    )
                                    .eq(
                                      'solicitou',
                                      FFAppState().currentUser.id,
                                    )
                                    .eq(
                                      'solicitado',
                                      rowUsersRow.id,
                                    ),
                              );
                              shouldSetState = true;
                              if (_model.try2 != null &&
                                  (_model.try2)!.isNotEmpty) {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return WebViewAware(
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.95,
                                          child: UsuarioConectadoWidget(
                                            user: rowUsersRow,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              } else {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return WebViewAware(
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.95,
                                          child: UsuarioNaoConectadoWidget(
                                            user: rowUsersRow,
                                            callback: () async {},
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              }

                              if (shouldSetState) safeSetState(() {});
                              return;
                            }
                          }

                          if (shouldSetState) safeSetState(() {});
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).accent1,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.network(
                                  rowUsersRow!.profilePic!,
                                  width: 40.0,
                                  height: 40.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    rowUsersRow.nome,
                                    'Username',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Text(
                                  dateTimeFormat(
                                    "relative",
                                    widget.feed!.createdAt,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ].divide(const SizedBox(width: 12.0)),
                        ),
                      ),
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderRadius: 200.0,
                              buttonSize: 32.0,
                              fillColor: const Color(0xA0009C3B),
                              icon: FaIcon(
                                FontAwesomeIcons.edit,
                                color: FlutterFlowTheme.of(context).info,
                                size: 12.0,
                              ),
                              onPressed: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return WebViewAware(
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.8,
                                          child: WritePostWidget(
                                            edit: true,
                                            postEdit: widget.feed,
                                            callback: () async {
                                              safeSetState(() => _model
                                                  .requestCompleter3 = null);
                                              await _model
                                                  .waitForRequestCompleted3();
                                              safeSetState(() => _model
                                                  .requestCompleter1 = null);
                                              await _model
                                                  .waitForRequestCompleted1();
                                              safeSetState(() => _model
                                                  .requestCompleter2 = null);
                                              await _model
                                                  .waitForRequestCompleted2();
                                            },
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 200.0,
                              buttonSize: 32.0,
                              fillColor: FlutterFlowTheme.of(context).error,
                              icon: FaIcon(
                                FontAwesomeIcons.trashAlt,
                                color: FlutterFlowTheme.of(context).info,
                                size: 12.0,
                              ),
                              onPressed: () async {
                                var confirmDialogResponse = await showDialog<
                                        bool>(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            title: const Text('Deletar publicação'),
                                            content: const Text(
                                                'Essa ação não pode ser revertida. Clique em CONFIRMAR apenas se realmente deseja deletar sua publicação.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: const Text('Cancel'),
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
                                  await FeedPostagensTable().delete(
                                    matchingRows: (rows) => rows.eq(
                                      'id',
                                      widget.feed?.id,
                                    ),
                                  );
                                  await widget.callback?.call();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Publicação deletada com sucesso.',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                }
                              },
                            ),
                          ].divide(const SizedBox(width: 12.0)),
                        ),
                    ].divide(const SizedBox(width: 12.0)),
                  );
                },
              ),
              Text(
                valueOrDefault<String>(
                  widget.feed?.postText,
                  'text',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
              ),
              if ((widget.feed?.hasImage == true) &&
                  (widget.feed?.isSingleImage == true))
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    widget.feed!.postImage!,
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
              if ((widget.feed?.hasImage == true) &&
                  (widget.feed?.isSingleImage == false))
                Builder(
                  builder: (context) {
                    final imgs = widget.feed?.postImages.toList() ?? [];

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(imgs.length, (imgsIndex) {
                          final imgsItem = imgs[imgsIndex];
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              imgsItem,
                              width: 200.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          );
                        }).divide(const SizedBox(width: 18.0)),
                      ),
                    );
                  },
                ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FutureBuilder<List<LikesRow>>(
                        future: (_model.requestCompleter1 ??=
                                Completer<List<LikesRow>>()
                                  ..complete(LikesTable().queryRows(
                                    queryFn: (q) => q.eq(
                                      'post',
                                      widget.feed?.id,
                                    ),
                                  )))
                            .future,
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
                          List<LikesRow> containerLikesRowList = snapshot.data!;

                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if ((containerLikesRowList
                                      .where((e) =>
                                          e.user == FFAppState().currentUser.id)
                                      .toList()
                                      .isNotEmpty) ==
                                  false) {
                                await LikesTable().insert({
                                  'isPost': true,
                                  'isComment': false,
                                  'user': FFAppState().currentUser.id,
                                  'post': widget.feed?.id,
                                });
                                safeSetState(
                                    () => _model.requestCompleter1 = null);
                                await _model.waitForRequestCompleted1();
                              } else {
                                await LikesTable().delete(
                                  matchingRows: (rows) => rows
                                      .eq(
                                        'user',
                                        FFAppState().currentUser.id,
                                      )
                                      .eq(
                                        'post',
                                        widget.feed?.id,
                                      ),
                                );
                                safeSetState(
                                    () => _model.requestCompleter1 = null);
                                await _model.waitForRequestCompleted1();
                              }

                              await widget.callback?.call();
                            },
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.solidHandshake,
                                    color: (containerLikesRowList
                                                .where((e) =>
                                                    e.user ==
                                                    FFAppState().currentUser.id)
                                                .toList()
                                                .isNotEmpty) ==
                                            true
                                        ? const Color(0xFF009C3B)
                                        : const Color(0xFF57636C),
                                    size: 20.0,
                                  ),
                                  Text(
                                    containerLikesRowList.length.toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].divide(const SizedBox(width: 4.0)),
                              ),
                            ),
                          );
                        },
                      ),
                      FutureBuilder<List<FeedComentariosRow>>(
                        future: (_model.requestCompleter2 ??=
                                Completer<List<FeedComentariosRow>>()
                                  ..complete(FeedComentariosTable().queryRows(
                                    queryFn: (q) => q.eq(
                                      'post',
                                      widget.feed?.id,
                                    ),
                                  )))
                            .future,
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
                          List<FeedComentariosRow>
                              containerFeedComentariosRowList = snapshot.data!;

                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return WebViewAware(
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.8,
                                        child: CommentsWidget(
                                          post: widget.feed,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.chat_bubble,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 20.0,
                                  ),
                                  Text(
                                    containerFeedComentariosRowList.length
                                        .toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].divide(const SizedBox(width: 4.0)),
                              ),
                            ),
                          );
                        },
                      ),
                    ].divide(const SizedBox(width: 16.0)),
                  ),
                  Icon(
                    Icons.share,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 20.0,
                  ),
                ],
              ),
            ].divide(const SizedBox(height: 12.0)),
          ),
        ),
      ),
    );
  }
}
