import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'limit_views_model.dart';
export 'limit_views_model.dart';

class LimitViewsWidget extends StatefulWidget {
  const LimitViewsWidget({
    super.key,
    String? type,
  }) : type = type ?? 'recomendacoes';

  final String type;

  @override
  State<LimitViewsWidget> createState() => _LimitViewsWidgetState();
}

class _LimitViewsWidgetState extends State<LimitViewsWidget>
    with TickerProviderStateMixin {
  late LimitViewsModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LimitViewsModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: const BoxDecoration(
        color: Color(0xC0000000),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(200.0),
            child: Image.asset(
              'assets/images/sinapplogo_converted-removebg-preview.png',
              width: 150.0,
              height: 150.0,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
            child: Text(
              () {
                if (widget.type == 'recomendacoes') {
                  return ' Você atingiu o seu limite de recomendações.  Fortaleça as conexões já feitas ou volte amanhã para mais conexões.';
                } else if (widget.type == 'likes') {
                  return 'Você atingiu o seu limite de solicitações.  Fortaleça as conexões já feitas ou volte amanhã para mais conexões.';
                } else if (widget.type == 'completarPerfil') {
                  return 'Seu perfil está incompleto. Finalize seu perfil antes de fazer novas conexões.';
                } else {
                  return 'message';
                }
              }(),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    color: Colors.white,
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          if ((widget.type == 'recomendacoes') || (widget.type == 'likes'))
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 52.0),
              child: FFButtonWidget(
                onPressed: () async {
                  context.goNamed('newConnections');

                  Navigator.pop(context);
                },
                text: 'Ver conexões',
                icon: const Icon(
                  Icons.people_alt_outlined,
                  size: 18.0,
                ),
                options: FFButtonOptions(
                  width: 250.0,
                  height: 48.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: const Color(0xFF009C3B),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
          if (widget.type == 'completarPerfil')
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 52.0),
              child: FFButtonWidget(
                onPressed: () async {
                  _model.user = await UsersTable().queryRows(
                    queryFn: (q) => q.eqOrNull(
                      'uuid',
                      currentUserUid,
                    ),
                  );
                  _model.empresa = await EmpresasTable().queryRows(
                    queryFn: (q) => q.eqOrNull(
                      'id',
                      _model.user?.firstOrNull?.empresa,
                    ),
                  );

                  context.goNamed(
                    'editPersonalInfo',
                    queryParameters: {
                      'user': serializeParam(
                        _model.user?.firstOrNull,
                        ParamType.SupabaseRow,
                      ),
                      'empresa': serializeParam(
                        _model.empresa?.firstOrNull,
                        ParamType.SupabaseRow,
                      ),
                    }.withoutNulls,
                  );

                  Navigator.pop(context);

                  safeSetState(() {});
                },
                text: 'Completar perfil',
                icon: const Icon(
                  Icons.checklist,
                  size: 18.0,
                ),
                options: FFButtonOptions(
                  width: 250.0,
                  height: 48.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: const Color(0xFF009C3B),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
        ].divide(const SizedBox(height: 18.0)),
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
