import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'input_diario_model.dart';
export 'input_diario_model.dart';

class InputDiarioWidget extends StatefulWidget {
  const InputDiarioWidget({super.key});

  @override
  State<InputDiarioWidget> createState() => _InputDiarioWidgetState();
}

class _InputDiarioWidgetState extends State<InputDiarioWidget> {
  late InputDiarioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InputDiarioModel());

    _model.postTextTextController ??= TextEditingController();
    _model.postTextFocusNode ??= FocusNode();

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
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1.0,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: FaIcon(
                  FontAwesomeIcons.questionCircle,
                  color: Color(0x0014181B),
                  size: 24.0,
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: Container(
                    width: 65.0,
                    height: 5.0,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE2E2E2),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(1.0, -1.0),
                child: AlignedTooltip(
                  content: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'Quanto mais detalhada for sua resposta, melhores serao os resultados que a nossa IA apresentara a você.',
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  offset: 4.0,
                  preferredDirection: AxisDirection.down,
                  borderRadius: BorderRadius.circular(8.0),
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  elevation: 4.0,
                  tailBaseWidth: 24.0,
                  tailLength: 12.0,
                  waitDuration: const Duration(milliseconds: 100),
                  showDuration: const Duration(milliseconds: 1500),
                  triggerMode: TooltipTriggerMode.tap,
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 24.0, 0.0),
                    child: FaIcon(
                      FontAwesomeIcons.questionCircle,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
              child: TextFormField(
                controller: _model.postTextTextController,
                focusNode: _model.postTextFocusNode,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.postTextTextController',
                  const Duration(milliseconds: 0),
                  () => safeSetState(() {}),
                ),
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Como o Sinapp pode te ajudar hoje?',
                  hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Inter',
                      letterSpacing: 0.0,
                    ),
                maxLines: null,
                validator:
                    _model.postTextTextControllerValidator.asValidator(context),
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            elevation: 3.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xFFE2E2E2),
                  width: 2.0,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[].divide(const SizedBox(width: 16.0)),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            _model.user = await UsersTable().queryRows(
                              queryFn: (q) => q.eqOrNull(
                                'uuid',
                                currentUserUid,
                              ),
                            );
                            await RegistroDiarioTable().insert({
                              'user': _model.user?.firstOrNull?.id,
                              'data':
                                  supaSerialize<DateTime>(getCurrentTimestamp),
                              'texto': _model.postTextTextController.text,
                            });
                            Navigator.pop(context);

                            safeSetState(() {});
                          },
                          text: 'Enviar',
                          icon: const Icon(
                            Icons.send_rounded,
                            size: 18.0,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
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
                          ),
                          showLoadingIndicator: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ].divide(const SizedBox(height: 16.0)),
      ),
    );
  }
}
