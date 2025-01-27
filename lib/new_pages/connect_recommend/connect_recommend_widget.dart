import '/backend/supabase/supabase.dart';
import '/componentes/usser_card/usser_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'connect_recommend_model.dart';
export 'connect_recommend_model.dart';

class ConnectRecommendWidget extends StatefulWidget {
  const ConnectRecommendWidget({super.key});

  @override
  State<ConnectRecommendWidget> createState() => _ConnectRecommendWidgetState();
}

class _ConnectRecommendWidgetState extends State<ConnectRecommendWidget> {
  late ConnectRecommendModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConnectRecommendModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0x01FFFFFF),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 24.0, 0.0, 0.0),
                        child: Text(
                          'Sua primeira conexão!',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 0.0),
                        child: Text(
                          'Para começar com o pé direito, realize no minimo uma conexão que pode agregar na sua rede de contatos!',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                        child: FutureBuilder<List<UsuariosSemConexaoAceitaRow>>(
                          future: (_model.requestCompleter ??=
                                  Completer<List<UsuariosSemConexaoAceitaRow>>()
                                    ..complete(UsuariosSemConexaoAceitaTable()
                                        .queryRows(
                                      queryFn: (q) => q.eqOrNull(
                                        'init_recommend',
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
                                  child: SpinKitPulse(
                                    color: Color(0xFF009C3B),
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            List<UsuariosSemConexaoAceitaRow>
                                rowUsuariosSemConexaoAceitaRowList =
                                snapshot.data!;

                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                        rowUsuariosSemConexaoAceitaRowList
                                            .length, (rowIndex) {
                                  final rowUsuariosSemConexaoAceitaRow =
                                      rowUsuariosSemConexaoAceitaRowList[
                                          rowIndex];
                                  return UsserCardWidget(
                                    key: Key(
                                        'Keyhor_${rowIndex}_of_${rowUsuariosSemConexaoAceitaRowList.length}'),
                                    idx: 1,
                                    user: rowUsuariosSemConexaoAceitaRow,
                                    temp: 1,
                                    action: () async {
                                      safeSetState(
                                          () => _model.requestCompleter = null);
                                      await _model.waitForRequestCompleted();
                                      _model.continar = true;
                                      safeSetState(() {});
                                    },
                                  );
                                })
                                    .divide(const SizedBox(width: 24.0))
                                    .addToStart(const SizedBox(width: 24.0))
                                    .addToEnd(const SizedBox(width: 24.0)),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
                  child: FFButtonWidget(
                    onPressed: (FFAppState().initAvance == false)
                        ? null
                        : () async {
                            context.pushNamed('home');
                          },
                    text: 'Continuar',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 52.0,
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
                      disabledColor: FlutterFlowTheme.of(context).alternate,
                      disabledTextColor: const Color(0x51000000),
                    ),
                    showLoadingIndicator: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
