import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'trial_ended_message_model.dart';
export 'trial_ended_message_model.dart';

class TrialEndedMessageWidget extends StatefulWidget {
  const TrialEndedMessageWidget({super.key});

  @override
  State<TrialEndedMessageWidget> createState() =>
      _TrialEndedMessageWidgetState();
}

class _TrialEndedMessageWidgetState extends State<TrialEndedMessageWidget> {
  late TrialEndedMessageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrialEndedMessageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(0.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/Prancheta_2.png',
                        width: 253.0,
                        height: 134.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
                child: Text(
                  'Gostou da Sinapp? Ótimo, assine o plano anual para continuar fazendo conexões e ter todos os benefícios do primeiro aplicativo de networking empresarial do Brasil!',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(32.0, 32.0, 32.0, 0.0),
                child: StreamBuilder<List<PlanosAssinaturaRow>>(
                  stream: _model.containerSupabaseStream ??= SupaFlow.client
                      .from("planos_assinatura")
                      .stream(primaryKey: ['id'])
                      .eqOrNull(
                        'id',
                        2,
                      )
                      .map((list) => list
                          .map((item) => PlanosAssinaturaRow(item))
                          .toList()),
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
                    List<PlanosAssinaturaRow> containerPlanosAssinaturaRowList =
                        snapshot.data!;

                    final containerPlanosAssinaturaRow =
                        containerPlanosAssinaturaRowList.isNotEmpty
                            ? containerPlanosAssinaturaRowList.first
                            : null;

                    return Material(
                      color: Colors.transparent,
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFF009C3B),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 24.0, 24.0, 24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  containerPlanosAssinaturaRow?.title,
                                  'Plano',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Text(
                                'Desbloqueie o melhor networking do Brasil!',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: const Color(0xFFE0E0E0),
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Text(
                                'R\$ 99/mês',
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Builder(
                                builder: (context) {
                                  final bens = containerPlanosAssinaturaRow
                                          ?.benefits
                                          ?.toList() ??
                                      [];

                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children:
                                        List.generate(bens.length, (bensIndex) {
                                      final bensItem = bens[bensIndex];
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (true ==
                                              getJsonField(
                                                bensItem,
                                                r'''$.enabled''',
                                              ))
                                            const Icon(
                                              Icons.check_circle_outline,
                                              color: Color(0xFFFFDF00),
                                              size: 24.0,
                                            ),
                                          if (false ==
                                              getJsonField(
                                                bensItem,
                                                r'''$.enabled''',
                                              ))
                                            const FaIcon(
                                              FontAwesomeIcons.solidTimesCircle,
                                              color: Colors.white,
                                              size: 24.0,
                                            ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  getJsonField(
                                                    bensItem,
                                                    r'''$.benefit''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 8.0)),
                                      );
                                    }).divide(const SizedBox(height: 12.0)),
                                  );
                                },
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  _model.user = await UsersTable().queryRows(
                                    queryFn: (q) => q.eqOrNull(
                                      'uuid',
                                      currentUserUid,
                                    ),
                                  );
                                  await launchURL(
                                      'https://sinapp.tech/payment?emb=${_model.user?.firstOrNull?.referredCode}');

                                  safeSetState(() {});
                                },
                                text: 'Assinar Plano',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 48.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: const Color(0xFFFFDF00),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: const Color(0xFF009C3B),
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ].divide(const SizedBox(height: 16.0)),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
