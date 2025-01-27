import '/backend/supabase/supabase.dart';
import '/componentes/app_bar/app_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'premium_plans_model.dart';
export 'premium_plans_model.dart';

class PremiumPlansWidget extends StatefulWidget {
  /// create a subscription plans page
  const PremiumPlansWidget({super.key});

  @override
  State<PremiumPlansWidget> createState() => _PremiumPlansWidgetState();
}

class _PremiumPlansWidgetState extends State<PremiumPlansWidget> {
  late PremiumPlansModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PremiumPlansModel());

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
        backgroundColor: const Color(0xFFFFDF00),
        body: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(1.0, -1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(100.0, 0.0, 0.0, 300.0),
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
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                wrapWithModel(
                  model: _model.appBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: const AppBarWidget(
                    back: true,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(32.0),
                        topRight: Radius.circular(32.0),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(32.0),
                            topRight: Radius.circular(32.0),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 24.0),
                                child: FutureBuilder<List<PlanosAssinaturaRow>>(
                                  future: PlanosAssinaturaTable().queryRows(
                                    queryFn: (q) => q.eqOrNull(
                                      'ativo',
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
                                          child: SpinKitPulse(
                                            color: Color(0xFF009C3B),
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<PlanosAssinaturaRow>
                                        columnPlanosAssinaturaRowList =
                                        snapshot.data!;

                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: List.generate(
                                          columnPlanosAssinaturaRowList.length,
                                          (columnIndex) {
                                        final columnPlanosAssinaturaRow =
                                            columnPlanosAssinaturaRowList[
                                                columnIndex];
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (columnPlanosAssinaturaRow
                                                    .mostWanted ==
                                                false)
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        32.0, 0.0, 32.0, 0.0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 3.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  24.0,
                                                                  24.0,
                                                                  24.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              columnPlanosAssinaturaRow
                                                                  .title,
                                                              'Plano',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: const Color(
                                                                      0xFF009C3B),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                          Text(
                                                            'Networking de qualidade e mais',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: const Color(
                                                                      0xFF667085),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          Text(
                                                            'R\$ ${columnPlanosAssinaturaRow.value?.toString()}/mês',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: const Color(
                                                                      0xFF101828),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          Builder(
                                                            builder: (context) {
                                                              final bens =
                                                                  columnPlanosAssinaturaRow
                                                                          .benefits
                                                                          ?.toList() ??
                                                                      [];

                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: List.generate(
                                                                    bens.length,
                                                                    (bensIndex) {
                                                                  final bensItem =
                                                                      bens[
                                                                          bensIndex];
                                                                  return Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      if (true ==
                                                                          getJsonField(
                                                                            bensItem,
                                                                            r'''$.enabled''',
                                                                          ))
                                                                        const Icon(
                                                                          Icons
                                                                              .check_circle_outline,
                                                                          color:
                                                                              Color(0xFF009C3B),
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      if (false ==
                                                                          getJsonField(
                                                                            bensItem,
                                                                            r'''$.enabled''',
                                                                          ))
                                                                        FaIcon(
                                                                          FontAwesomeIcons
                                                                              .solidTimesCircle,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      Expanded(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              getJsonField(
                                                                                bensItem,
                                                                                r'''$.benefit''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: const Color(0xFF344054),
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ].divide(const SizedBox(
                                                                        width:
                                                                            8.0)),
                                                                  );
                                                                }).divide(const SizedBox(
                                                                    height:
                                                                        12.0)),
                                                              );
                                                            },
                                                          ),
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              await launchURL(
                                                                  'https://sinappnetwork.bubbleapps.io/version-test/payment?plano=${columnPlanosAssinaturaRow.id.toString()}&user=${FFAppState().currentUser.id.toString()}');
                                                            },
                                                            text:
                                                                'Assinar Plano',
                                                            options:
                                                                FFButtonOptions(
                                                              width: double
                                                                  .infinity,
                                                              height: 48.0,
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color:
                                                                  Colors.white,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: const Color(
                                                                            0xFF009C3B),
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Color(
                                                                    0xFF009C3B),
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            height: 16.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (columnPlanosAssinaturaRow
                                                    .mostWanted ==
                                                true)
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        32.0, 0.0, 32.0, 0.0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 3.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: const Color(0xFF009C3B),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  24.0,
                                                                  24.0,
                                                                  24.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              columnPlanosAssinaturaRow
                                                                  .title,
                                                              'Plano',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                          Text(
                                                            'Para usuários avançados',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: const Color(
                                                                      0xFFE0E0E0),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          Text(
                                                            'R\$ ${columnPlanosAssinaturaRow.value?.toString()}/mês',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          Builder(
                                                            builder: (context) {
                                                              final bens =
                                                                  columnPlanosAssinaturaRow
                                                                          .benefits
                                                                          ?.toList() ??
                                                                      [];

                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: List.generate(
                                                                    bens.length,
                                                                    (bensIndex) {
                                                                  final bensItem =
                                                                      bens[
                                                                          bensIndex];
                                                                  return Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      if (true ==
                                                                          getJsonField(
                                                                            bensItem,
                                                                            r'''$.enabled''',
                                                                          ))
                                                                        const Icon(
                                                                          Icons
                                                                              .check_circle_outline,
                                                                          color:
                                                                              Color(0xFFFFDF00),
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      if (false ==
                                                                          getJsonField(
                                                                            bensItem,
                                                                            r'''$.enabled''',
                                                                          ))
                                                                        const FaIcon(
                                                                          FontAwesomeIcons
                                                                              .solidTimesCircle,
                                                                          color:
                                                                              Colors.white,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      Expanded(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              getJsonField(
                                                                                bensItem,
                                                                                r'''$.benefit''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: Colors.white,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ].divide(const SizedBox(
                                                                        width:
                                                                            8.0)),
                                                                  );
                                                                }).divide(const SizedBox(
                                                                    height:
                                                                        12.0)),
                                                              );
                                                            },
                                                          ),
                                                          FFButtonWidget(
                                                            onPressed: () {
                                                              print(
                                                                  'Button pressed ...');
                                                            },
                                                            text:
                                                                'Assinar Plano',
                                                            options:
                                                                FFButtonOptions(
                                                              width: double
                                                                  .infinity,
                                                              height: 48.0,
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: const Color(
                                                                  0xFFFFDF00),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: const Color(
                                                                            0xFF009C3B),
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            height: 16.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ].divide(const SizedBox(height: 24.0)),
                                        );
                                      }).divide(const SizedBox(height: 24.0)),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    32.0, 32.0, 32.0, 24.0),
                                child: Text(
                                  'Você será redirecionado(a) para uma página de pagamento segura.',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: const Color(0xFF667085),
                                        letterSpacing: 0.0,
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
          ],
        ),
      ),
    );
  }
}
