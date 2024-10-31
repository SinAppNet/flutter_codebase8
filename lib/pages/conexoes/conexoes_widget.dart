import '/backend/supabase/supabase.dart';
import '/componentes/app_bar/app_bar_widget.dart';
import '/componentes/drawer_content/drawer_content_widget.dart';
import '/componentes/empty/empty_widget.dart';
import '/componentes/navbar/navbar_widget.dart';
import '/componentes/usuario_conectado/usuario_conectado_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'conexoes_model.dart';
export 'conexoes_model.dart';

class ConexoesWidget extends StatefulWidget {
  const ConexoesWidget({super.key});

  @override
  State<ConexoesWidget> createState() => _ConexoesWidgetState();
}

class _ConexoesWidgetState extends State<ConexoesWidget>
    with TickerProviderStateMixin {
  late ConexoesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConexoesModel());

    _model.textController ??= TextEditingController();

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
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
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFFFDF00),
        drawer: Drawer(
          elevation: 16.0,
          child: WebViewAware(
            child: wrapWithModel(
              model: _model.drawerContentModel,
              updateCallback: () => safeSetState(() {}),
              child: const DrawerContentWidget(),
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(100.0, 0.0, 0.0, 300.0),
                  child: Container(
                    width: 700.0,
                    height: 700.0,
                    decoration: BoxDecoration(
                      color: const Color(0x00FFFFFF),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/images/Ellipse_1.png',
                        ).image,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      wrapWithModel(
                        model: _model.appBarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: const AppBarWidget(),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(32.0),
                            topRight: Radius.circular(32.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(32.0),
                                topRight: Radius.circular(32.0),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      25.0, 25.0, 25.0, 15.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: FutureBuilder<
                                            List<ConexoesAceitasRow>>(
                                          future:
                                              ConexoesAceitasTable().queryRows(
                                            queryFn: (q) => q,
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
                                            List<ConexoesAceitasRow>
                                                containerConexoesAceitasRowList =
                                                snapshot.data!;

                                            return Container(
                                              width: 100.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                border: Border.all(
                                                  color:
                                                      (_model.textFieldFocusNode
                                                                  ?.hasFocus ??
                                                              false)
                                                          ? const Color(0xFF6CEB57)
                                                          : const Color(0xFFD0D5DD),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 15.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/search-lg.png',
                                                        width: 20.0,
                                                        height: 20.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child:
                                                          Autocomplete<String>(
                                                        initialValue:
                                                            const TextEditingValue(),
                                                        optionsBuilder:
                                                            (textEditingValue) {
                                                          if (textEditingValue
                                                                  .text ==
                                                              '') {
                                                            return const Iterable<
                                                                String>.empty();
                                                          }
                                                          return containerConexoesAceitasRowList
                                                              .map(
                                                                  (e) => e.nome)
                                                              .withoutNulls
                                                              .toList()
                                                              .where((option) {
                                                            final lowercaseOption =
                                                                option
                                                                    .toLowerCase();
                                                            return lowercaseOption
                                                                .contains(
                                                                    textEditingValue
                                                                        .text
                                                                        .toLowerCase());
                                                          });
                                                        },
                                                        optionsViewBuilder:
                                                            (context,
                                                                onSelected,
                                                                options) {
                                                          return AutocompleteOptionsList(
                                                            textFieldKey: _model
                                                                .textFieldKey,
                                                            textController: _model
                                                                .textController!,
                                                            options: options
                                                                .toList(),
                                                            onSelected:
                                                                onSelected,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            textHighlightStyle:
                                                                const TextStyle(),
                                                            elevation: 4.0,
                                                            optionBackgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            optionHighlightColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            maxHeight: 200.0,
                                                          );
                                                        },
                                                        onSelected:
                                                            (String selection) {
                                                          safeSetState(() =>
                                                              _model.textFieldSelectedOption =
                                                                  selection);
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                        },
                                                        fieldViewBuilder: (
                                                          context,
                                                          textEditingController,
                                                          focusNode,
                                                          onEditingComplete,
                                                        ) {
                                                          _model.textFieldFocusNode =
                                                              focusNode;

                                                          _model.textController =
                                                              textEditingController;
                                                          return TextFormField(
                                                            key: _model
                                                                .textFieldKey,
                                                            controller:
                                                                textEditingController,
                                                            focusNode:
                                                                focusNode,
                                                            onEditingComplete:
                                                                onEditingComplete,
                                                            onFieldSubmitted:
                                                                (_) async {
                                                              _model.userSelected =
                                                                  await UsersTable()
                                                                      .queryRows(
                                                                queryFn: (q) =>
                                                                    q.eq(
                                                                  'nome',
                                                                  _model
                                                                      .textFieldSelectedOption,
                                                                ),
                                                              );
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap: () =>
                                                                          FocusScope.of(context)
                                                                              .unfocus(),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            MediaQuery.viewInsetsOf(context),
                                                                        child:
                                                                            SizedBox(
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 0.95,
                                                                          child:
                                                                              UsuarioConectadoWidget(
                                                                            user:
                                                                                _model.userSelected!.first,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            autofocus: false,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              hintText:
                                                                  'Busque pelo nome da conexão',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: const Color(
                                                                            0xFF667085),
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Color(
                                                                      0x00E0E3E7),
                                                                  width: 0.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Color(
                                                                      0x004B39EF),
                                                                  width: 0.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Color(
                                                                      0x00FF5963),
                                                                  width: 0.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Color(
                                                                      0x00FF5963),
                                                                  width: 0.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              contentPadding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          20.0,
                                                                          10.0,
                                                                          0.0),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                            validator: _model
                                                                .textControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 60.0),
                                      child: FutureBuilder<
                                          List<ConexoesAceitasRow>>(
                                        future:
                                            ConexoesAceitasTable().queryRows(
                                          queryFn: (q) => q,
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
                                          List<ConexoesAceitasRow>
                                              listViewConexoesAceitasRowList =
                                              snapshot.data!;

                                          if (listViewConexoesAceitasRowList
                                              .isEmpty) {
                                            return const EmptyWidget();
                                          }

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewConexoesAceitasRowList
                                                    .length,
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewConexoesAceitasRow =
                                                  listViewConexoesAceitasRowList[
                                                      listViewIndex];
                                              return Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          25.0, 0.0, 25.0, 0.0),
                                                  child: Container(
                                                    width: 360.0,
                                                    height: 94.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              _model.usr =
                                                                  await UsersTable()
                                                                      .queryRows(
                                                                queryFn: (q) =>
                                                                    q.eq(
                                                                  'uuid',
                                                                  listViewConexoesAceitasRow
                                                                      .uuid,
                                                                ),
                                                              );
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap: () =>
                                                                          FocusScope.of(context)
                                                                              .unfocus(),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            MediaQuery.viewInsetsOf(context),
                                                                        child:
                                                                            SizedBox(
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 0.95,
                                                                          child:
                                                                              UsuarioConectadoWidget(
                                                                            user:
                                                                                _model.usr!.first,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: 62.0,
                                                                  height: 62.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: const Color(
                                                                        0x00ECECEC),
                                                                    image:
                                                                        DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          listViewConexoesAceitasRow
                                                                              .profilePic,
                                                                          'https://static.vecteezy.com/system/resources/thumbnails/003/337/584/small/default-avatar-photo-placeholder-profile-icon-vector.jpg',
                                                                        ),
                                                                      ).image,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            200.0),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          14.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          listViewConexoesAceitasRow
                                                                              .nome,
                                                                          'Username',
                                                                        ).maybeHandleOverflow(
                                                                          maxChars:
                                                                              15,
                                                                          replacement:
                                                                              '…',
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
                                                                            0.0,
                                                                            2.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            listViewConexoesAceitasRow.empresaNome,
                                                                            'Empresa nome',
                                                                          ).maybeHandleOverflow(
                                                                            maxChars:
                                                                                15,
                                                                            replacement:
                                                                                '…',
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
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                _model.chats =
                                                                    await ChatTable()
                                                                        .queryRows(
                                                                  queryFn: (q) => q
                                                                      .contains(
                                                                        'users',
                                                                        '{${listViewConexoesAceitasRow.id}}',
                                                                      )
                                                                      .contains(
                                                                        'users',
                                                                        '{${FFAppState().currentUser.id}}',
                                                                      ),
                                                                );
                                                                if ((_model.chats !=
                                                                            null &&
                                                                        (_model.chats)!
                                                                            .isNotEmpty) ==
                                                                    true) {
                                                                  context
                                                                      .pushNamed(
                                                                    'chat',
                                                                    queryParameters:
                                                                        {
                                                                      'chat':
                                                                          serializeParam(
                                                                        _model
                                                                            .chats
                                                                            ?.first,
                                                                        ParamType
                                                                            .SupabaseRow,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                } else {
                                                                  _model.chat =
                                                                      await ChatTable()
                                                                          .insert({
                                                                    'users': (int
                                                                                var1,
                                                                            int
                                                                                var2) {
                                                                      return [
                                                                        var1,
                                                                        var2
                                                                      ];
                                                                    }(
                                                                        listViewConexoesAceitasRow
                                                                            .id!,
                                                                        FFAppState()
                                                                            .currentUser
                                                                            .id),
                                                                  });

                                                                  context
                                                                      .pushNamed(
                                                                    'chat',
                                                                    queryParameters:
                                                                        {
                                                                      'chat':
                                                                          serializeParam(
                                                                        _model
                                                                            .chat,
                                                                        ParamType
                                                                            .SupabaseRow,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                }

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Container(
                                                                width: 52.0,
                                                                height: 52.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: const Color(
                                                                      0xFF009C3B),
                                                                  boxShadow: const [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          4.0,
                                                                      color: Color(
                                                                          0x33000000),
                                                                      offset:
                                                                          Offset(
                                                                        0.0,
                                                                        2.0,
                                                                      ),
                                                                      spreadRadius:
                                                                          1.0,
                                                                    )
                                                                  ],
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                                child: const Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              10.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .chat_bubble_outline,
                                                                        color: Color(
                                                                            0xFFF8F9FB),
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ).animateOnActionTrigger(
                                                              animationsMap[
                                                                  'containerOnActionTriggerAnimation']!,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: wrapWithModel(
                        model: _model.navbarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: const NavbarWidget(
                          stateInt: 4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
