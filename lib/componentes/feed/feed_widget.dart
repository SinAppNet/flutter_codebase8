import '/backend/supabase/supabase.dart';
import '/componentes/empty/empty_widget.dart';
import '/componentes/navbar/navbar_widget.dart';
import '/componentes/postagem/postagem_widget.dart';
import '/componentes/write_post/write_post_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'feed_model.dart';
export 'feed_model.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({super.key});

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> with TickerProviderStateMixin {
  late FeedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeedModel());

    animationsMap.addAll({
      'listViewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 770.0.ms,
            begin: const Offset(0.0, -47.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 770.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFB8CBB6),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: InkWell(
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
                          child: GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: SizedBox(
                                height: MediaQuery.sizeOf(context).height * 0.8,
                                child: WritePostWidget(
                                  callback: () async {
                                    safeSetState(
                                        () => _model.requestCompleter = null);
                                    await _model.waitForRequestCompleted();
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                  child: Material(
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
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
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
                                      FFAppState().currentUser.profilePic,
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  'O que você está buscando?',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(const SizedBox(width: 12.0)),
                            ),
                            FlutterFlowIconButton(
                              borderRadius: 20.0,
                              buttonSize: 40.0,
                              fillColor: const Color(0xFF009C3B),
                              icon: Icon(
                                Icons.photo_camera,
                                color: FlutterFlowTheme.of(context).info,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return WebViewAware(
                                      child: GestureDetector(
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: SizedBox(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.8,
                                            child: WritePostWidget(
                                              callback: () async {
                                                safeSetState(() => _model
                                                    .requestCompleter = null);
                                                await _model
                                                    .waitForRequestCompleted();
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                            ),
                          ].divide(const SizedBox(width: 12.0)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(),
                      child: FutureBuilder<List<FeedPostagensRow>>(
                        future: (_model.requestCompleter ??=
                                Completer<List<FeedPostagensRow>>()
                                  ..complete(FeedPostagensTable().queryRows(
                                    queryFn: (q) => q
                                        .eqOrNull(
                                          'approved',
                                          true,
                                        )
                                        .order('created_at'),
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
                          List<FeedPostagensRow> listViewFeedPostagensRowList =
                              snapshot.data!;

                          if (listViewFeedPostagensRowList.isEmpty) {
                            return const Center(
                              child: SizedBox(
                                width: double.infinity,
                                height: double.infinity,
                                child: EmptyWidget(),
                              ),
                            );
                          }

                          return ListView.separated(
                            padding: const EdgeInsets.fromLTRB(
                              0,
                              12.0,
                              0,
                              82.0,
                            ),
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewFeedPostagensRowList.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 16.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewFeedPostagensRow =
                                  listViewFeedPostagensRowList[listViewIndex];
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    18.0, 0.0, 18.0, 0.0),
                                child: Stack(
                                  children: [
                                    PostagemWidget(
                                      key: Key(
                                          'Keyhvu_${listViewIndex}_of_${listViewFeedPostagensRowList.length}'),
                                      feed: listViewFeedPostagensRow,
                                      callback: () async {
                                        safeSetState(() =>
                                            _model.requestCompleter = null);
                                        await _model.waitForRequestCompleted();
                                      },
                                    ),
                                    if (listViewFeedPostagensRow.poster ==
                                        FFAppState().currentUser.id)
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(1.0, -1.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 200.0,
                                                buttonSize: 32.0,
                                                fillColor: const Color(0xA0009C3B),
                                                icon: FaIcon(
                                                  FontAwesomeIcons.edit,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 12.0,
                                                ),
                                                onPressed: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (context) {
                                                      return WebViewAware(
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child: SizedBox(
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.8,
                                                              child:
                                                                  WritePostWidget(
                                                                edit: true,
                                                                postEdit:
                                                                    listViewFeedPostagensRow,
                                                                callback:
                                                                    () async {
                                                                  safeSetState(() =>
                                                                      _model.requestCompleter =
                                                                          null);
                                                                  await _model
                                                                      .waitForRequestCompleted();
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                              ),
                                              FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 200.0,
                                                buttonSize: 32.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                icon: FaIcon(
                                                  FontAwesomeIcons.trashAlt,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 12.0,
                                                ),
                                                onPressed: () async {
                                                  var confirmDialogResponse =
                                                      await showDialog<bool>(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return WebViewAware(
                                                                child:
                                                                    AlertDialog(
                                                                  title: const Text(
                                                                      'Deletar publicação'),
                                                                  content: const Text(
                                                                      'Essa ação não pode ser revertida. Clique em CONFIRMAR apenas se realmente deseja deletar sua publicação.'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                      child: const Text(
                                                                          'Cancel'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                      child: const Text(
                                                                          'Confirmar'),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          ) ??
                                                          false;
                                                  if (confirmDialogResponse) {
                                                    await FeedPostagensTable()
                                                        .delete(
                                                      matchingRows: (rows) =>
                                                          rows.eqOrNull(
                                                        'id',
                                                        listViewFeedPostagensRow
                                                            .id,
                                                      ),
                                                    );
                                                    safeSetState(() => _model
                                                            .requestCompleter =
                                                        null);
                                                    await _model
                                                        .waitForRequestCompleted();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Publicação deletada com sucesso.',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: const Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                            ].divide(const SizedBox(width: 12.0)),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              );
                            },
                          ).animateOnPageLoad(
                              animationsMap['listViewOnPageLoadAnimation']!);
                        },
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: const BoxDecoration(),
                        child: wrapWithModel(
                          model: _model.navbarModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const NavbarWidget(
                            stateInt: 4,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ].divide(const SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
