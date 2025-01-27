import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'ia_recommend_model.dart';
export 'ia_recommend_model.dart';

class IaRecommendWidget extends StatefulWidget {
  const IaRecommendWidget({super.key});

  @override
  State<IaRecommendWidget> createState() => _IaRecommendWidgetState();
}

class _IaRecommendWidgetState extends State<IaRecommendWidget> {
  late IaRecommendModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IaRecommendModel());

    _model.tipoConexTextController ??= TextEditingController();
    _model.tipoConexFocusNode ??= FocusNode();

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
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Container(
            width: double.infinity,
            height: 425.0,
            decoration: BoxDecoration(
              color: const Color(0xFFCEFFD1),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 48.0,
                  decoration: const BoxDecoration(
                    color: Color(0xFF31C71D),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Recomendação por IA',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 32.0, 12.0, 0.0),
                        child: Text(
                          'Como o SinApp pode te ajudar hoje?',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 0.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.tipoConexTextController,
                            focusNode: _model.tipoConexFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.tipoConexTextController',
                              const Duration(milliseconds: 0),
                              () => safeSetState(() {}),
                            ),
                            autofocus: false,
                            textInputAction: TextInputAction.done,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText:
                                  'Quanto mais detalhada for sua resposta, melhores serão as recomendações da nossa IA.',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0xFF667085),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFFD0D5DD),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xB1009C3B),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                  15.0, 20.0, 15.0, 20.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: const Color(0xFF667085),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                            maxLines: 8,
                            validator: _model.tipoConexTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 8.0, 24.0, 0.0),
                        child: Text(
                          '* Responda essa pergunta para que o popup não apareça mais!',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: (_model.tipoConexTextController.text == '')
                              ? null
                              : () async {
                                  _model.user = await UsersTable().queryRows(
                                    queryFn: (q) => q.eqOrNull(
                                      'uuid',
                                      currentUserUid,
                                    ),
                                  );
                                  await RegistroDiarioTable().insert({
                                    'user': _model.user?.firstOrNull?.id,
                                    'data': supaSerialize<DateTime>(
                                        getCurrentTimestamp),
                                    'texto':
                                        _model.tipoConexTextController.text,
                                  });
                                  Navigator.pop(context);

                                  safeSetState(() {});
                                },
                          text: 'Enviar',
                          icon: const Icon(
                            Icons.arrow_forward_rounded,
                            size: 18.0,
                          ),
                          options: FFButtonOptions(
                            width: 200.0,
                            height: 48.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFF009C3B),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
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
                            disabledColor:
                                FlutterFlowTheme.of(context).alternate,
                            disabledTextColor: const Color(0xFF5C5C5C),
                          ),
                          showLoadingIndicator: false,
                        ),
                      ),
                    ],
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
