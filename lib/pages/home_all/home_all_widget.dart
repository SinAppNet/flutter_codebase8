import '/backend/supabase/supabase.dart';
import '/componentes/app_bar/app_bar_widget.dart';
import '/componentes/complete_perfil/complete_perfil_widget.dart';
import '/componentes/drawer_content/drawer_content_widget.dart';
import '/componentes/empty/empty_widget.dart';
import '/componentes/filtros/filtros_widget.dart';
import '/componentes/navbar/navbar_widget.dart';
import '/componentes/usser_card/usser_card_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'home_all_model.dart';
export 'home_all_model.dart';

class HomeAllWidget extends StatefulWidget {
  const HomeAllWidget({
    super.key,
    bool? all,
  }) : all = all ?? false;

  final bool all;

  @override
  State<HomeAllWidget> createState() => _HomeAllWidgetState();
}

class _HomeAllWidgetState extends State<HomeAllWidget> {
  late HomeAllModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool pesquisaNomeFocusListenerRegistered = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeAllModel());

    _model.pesquisaNomeTextController ??= TextEditingController();
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
          child: wrapWithModel(
            model: _model.drawerContentModel,
            updateCallback: () => safeSetState(() {}),
            child: const DrawerContentWidget(),
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
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(32.0),
                          topRight: Radius.circular(32.0),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
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
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 75.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (FFAppState().currentUser.perfilCompleto ==
                                    false)
                                  InkWell(
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
                                          return GestureDetector(
                                            onTap: () => FocusScope.of(context)
                                                .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: SizedBox(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.8,
                                                child: const CompletePerfilWidget(),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 42.0,
                                      decoration: BoxDecoration(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Complete seu perfil para fazer conexões valiosas!',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(25.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Recomendações',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: const Color(0xFF2F2E41),
                                                  fontSize: 22.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'home',
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          const TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                        duration: Duration(
                                                            milliseconds: 0),
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: Text(
                                                  'Mostrar menos',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF2F2E41),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          19.0, 0.0, 19.0, 18.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: FutureBuilder<
                                                List<
                                                    UsuariosSemConexaoAceitaRow>>(
                                              future:
                                                  UsuariosSemConexaoAceitaTable()
                                                      .queryRows(
                                                queryFn: (q) => q.eq(
                                                  'perfil_completo',
                                                  true,
                                                ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return const Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child: SpinKitWave(
                                                        color:
                                                            Color(0xFF009C3B),
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<UsuariosSemConexaoAceitaRow>
                                                    containerUsuariosSemConexaoAceitaRowList =
                                                    snapshot.data!;

                                                return Container(
                                                  width: 100.0,
                                                  height: 40.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                    border: Border.all(
                                                      color: (_model
                                                                  .pesquisaNomeFocusNode
                                                                  ?.hasFocus ??
                                                              false)
                                                          ? const Color(0xFF6CEB57)
                                                          : const Color(0xFFD0D5DD),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 0.0,
                                                                15.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/search-lg.png',
                                                            width: 20.0,
                                                            height: 20.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Autocomplete<
                                                              String>(
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
                                                              return containerUsuariosSemConexaoAceitaRowList
                                                                  .map((e) =>
                                                                      e.nome)
                                                                  .withoutNulls
                                                                  .toList()
                                                                  .where(
                                                                      (option) {
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
                                                                    .pesquisaNomeKey,
                                                                textController:
                                                                    _model
                                                                        .pesquisaNomeTextController!,
                                                                options: options
                                                                    .toList(),
                                                                onSelected:
                                                                    onSelected,
                                                                textStyle: FlutterFlowTheme.of(
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
                                                                maxHeight:
                                                                    200.0,
                                                              );
                                                            },
                                                            onSelected: (String
                                                                selection) {
                                                              safeSetState(() =>
                                                                  _model.pesquisaNomeSelectedOption =
                                                                      selection);
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus();
                                                            },
                                                            fieldViewBuilder: (
                                                              context,
                                                              textEditingController,
                                                              focusNode,
                                                              onEditingComplete,
                                                            ) {
                                                              _model.pesquisaNomeFocusNode =
                                                                  focusNode;
                                                              if (!pesquisaNomeFocusListenerRegistered) {
                                                                pesquisaNomeFocusListenerRegistered =
                                                                    true;
                                                                _model
                                                                    .pesquisaNomeFocusNode!
                                                                    .addListener(
                                                                  () async {
                                                                    _model.usr =
                                                                        await UsersTable()
                                                                            .queryRows(
                                                                      queryFn:
                                                                          (q) =>
                                                                              q.eq(
                                                                        'nome',
                                                                        _model
                                                                            .pesquisaNomeTextController
                                                                            .text,
                                                                      ),
                                                                    );
                                                                    if ((_model.usr !=
                                                                                null &&
                                                                            (_model.usr)!.isNotEmpty) ==
                                                                        false) {
                                                                      safeSetState(
                                                                          () {
                                                                        _model
                                                                            .pesquisaNomeTextController
                                                                            ?.clear();
                                                                      });
                                                                      FFAppState()
                                                                              .filtroOn =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                    } else {
                                                                      FFAppState()
                                                                              .filtroOn =
                                                                          true;
                                                                      safeSetState(
                                                                          () {});
                                                                    }

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                );
                                                              }
                                                              _model.pesquisaNomeTextController =
                                                                  textEditingController;
                                                              return TextFormField(
                                                                key: _model
                                                                    .pesquisaNomeKey,
                                                                controller:
                                                                    textEditingController,
                                                                focusNode:
                                                                    focusNode,
                                                                onEditingComplete:
                                                                    onEditingComplete,
                                                                autofocus:
                                                                    false,
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .done,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  isDense: true,
                                                                  hintText:
                                                                      'Busque pelo nome da conexão',
                                                                  hintStyle: FlutterFlowTheme.of(
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
                                                                      width:
                                                                          0.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Color(
                                                                          0x004B39EF),
                                                                      width:
                                                                          0.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Color(
                                                                          0x00FF5963),
                                                                      width:
                                                                          0.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Color(
                                                                          0x00FF5963),
                                                                      width:
                                                                          0.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  contentPadding:
                                                                      const EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          20.0,
                                                                          10.0,
                                                                          0.0),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                validator: _model
                                                                    .pesquisaNomeTextControllerValidator
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
                                          if (FFAppState().filtroOn == false)
                                            FlutterFlowIconButton(
                                              borderRadius: 100.0,
                                              buttonSize: 40.0,
                                              fillColor: const Color(0xFF6CEB57),
                                              icon: Icon(
                                                Icons.filter_alt,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () =>
                                                          FocusScope.of(context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: SizedBox(
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.6,
                                                          child:
                                                              const FiltrosWidget(),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                            ),
                                          if (FFAppState().filtroOn == true)
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 100.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              icon: Icon(
                                                Icons.close_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: const Text(
                                                                  'Desativar filtros'),
                                                              content: const Text(
                                                                  'Clique em confirmar para desativar os filtros'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: const Text(
                                                                      'Cancelar'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: const Text(
                                                                      'Confirmar'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  FFAppState().filtroOn = false;
                                                  safeSetState(() {});
                                                  safeSetState(() {
                                                    _model
                                                        .pesquisaNomeTextController
                                                        ?.clear();
                                                  });
                                                }
                                              },
                                            ),
                                        ].divide(const SizedBox(width: 12.0)),
                                      ),
                                    ),
                                  ],
                                ),
                                if ((FFAppState().filtroOn == true) &&
                                    (_model.pesquisaNomeTextController
                                                .text !=
                                            ''))
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        14.0, 0.0, 14.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: FutureBuilder<
                                              List<
                                                  UsuariosSemConexaoAceitaRow>>(
                                            future:
                                                UsuariosSemConexaoAceitaTable()
                                                    .querySingleRow(
                                              queryFn: (q) => q.eq(
                                                'nome',
                                                _model
                                                    .pesquisaNomeTextController
                                                    .text,
                                              ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return const Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child: SpinKitWave(
                                                      color: Color(0xFF009C3B),
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<UsuariosSemConexaoAceitaRow>
                                                  usserCardUsuariosSemConexaoAceitaRowList =
                                                  snapshot.data!;

                                              final usserCardUsuariosSemConexaoAceitaRow =
                                                  usserCardUsuariosSemConexaoAceitaRowList
                                                          .isNotEmpty
                                                      ? usserCardUsuariosSemConexaoAceitaRowList
                                                          .first
                                                      : null;

                                              return wrapWithModel(
                                                model: _model.usserCardModel1,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: UsserCardWidget(
                                                  user:
                                                      usserCardUsuariosSemConexaoAceitaRow!,
                                                  action: () async {},
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
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (!FFAppState().filtroOn)
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 15.0, 25.0),
                                              child: FutureBuilder<
                                                  List<
                                                      UsuariosSemConexaoAceitaRow>>(
                                                future: (_model
                                                            .requestCompleter2 ??=
                                                        Completer<
                                                            List<
                                                                UsuariosSemConexaoAceitaRow>>()
                                                          ..complete(
                                                              UsuariosSemConexaoAceitaTable()
                                                                  .queryRows(
                                                            queryFn: (q) =>
                                                                q.eq(
                                                              'perfil_completo',
                                                              true,
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
                                                        child: SpinKitWave(
                                                          color:
                                                              Color(0xFF009C3B),
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<UsuariosSemConexaoAceitaRow>
                                                      listViewUsuariosSemConexaoAceitaRowList =
                                                      snapshot.data!;

                                                  if (listViewUsuariosSemConexaoAceitaRowList
                                                      .isEmpty) {
                                                    return const EmptyWidget();
                                                  }

                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewUsuariosSemConexaoAceitaRowList
                                                            .length,
                                                    separatorBuilder: (_, __) =>
                                                        const SizedBox(height: 24.0),
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewUsuariosSemConexaoAceitaRow =
                                                          listViewUsuariosSemConexaoAceitaRowList[
                                                              listViewIndex];
                                                      return UsserCardWidget(
                                                        key: Key(
                                                            'Keydut_${listViewIndex}_of_${listViewUsuariosSemConexaoAceitaRowList.length}'),
                                                        user:
                                                            listViewUsuariosSemConexaoAceitaRow,
                                                        action: () async {
                                                          safeSetState(() =>
                                                              _model.requestCompleter2 =
                                                                  null);
                                                          await _model
                                                              .waitForRequestCompleted2();
                                                        },
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          if ((FFAppState().filtroOn == true) &&
                                              (_model.pesquisaNomeTextController
                                                          .text ==
                                                      ''))
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 15.0, 25.0),
                                              child: FutureBuilder<
                                                  List<
                                                      UsuariosSemConexaoAceitaRow>>(
                                                future: (_model
                                                            .requestCompleter1 ??=
                                                        Completer<
                                                            List<
                                                                UsuariosSemConexaoAceitaRow>>()
                                                          ..complete(
                                                              UsuariosSemConexaoAceitaTable()
                                                                  .queryRows(
                                                            queryFn: (q) => q
                                                                .eq(
                                                                  'perfil_completo',
                                                                  true,
                                                                )
                                                                .overlaps(
                                                                  'interesses',
                                                                  FFAppState()
                                                                      .filtroAplied
                                                                      .interesses,
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
                                                        child: SpinKitWave(
                                                          color:
                                                              Color(0xFF009C3B),
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<UsuariosSemConexaoAceitaRow>
                                                      listViewUsuariosSemConexaoAceitaRowList =
                                                      snapshot.data!;

                                                  if (listViewUsuariosSemConexaoAceitaRowList
                                                      .isEmpty) {
                                                    return const EmptyWidget();
                                                  }

                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewUsuariosSemConexaoAceitaRowList
                                                            .length,
                                                    separatorBuilder: (_, __) =>
                                                        const SizedBox(height: 24.0),
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewUsuariosSemConexaoAceitaRow =
                                                          listViewUsuariosSemConexaoAceitaRowList[
                                                              listViewIndex];
                                                      return UsserCardWidget(
                                                        key: Key(
                                                            'Key7ih_${listViewIndex}_of_${listViewUsuariosSemConexaoAceitaRowList.length}'),
                                                        user:
                                                            listViewUsuariosSemConexaoAceitaRow,
                                                        action: () async {
                                                          safeSetState(() =>
                                                              _model.requestCompleter1 =
                                                                  null);
                                                          await _model
                                                              .waitForRequestCompleted1();
                                                        },
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                        ],
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
                          stateInt: 3,
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
