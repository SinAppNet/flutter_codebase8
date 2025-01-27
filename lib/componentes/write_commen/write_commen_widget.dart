import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'write_commen_model.dart';
export 'write_commen_model.dart';

class WriteCommenWidget extends StatefulWidget {
  const WriteCommenWidget({
    super.key,
    this.post,
    this.callback,
  });

  final FeedPostagensRow? post;
  final Future Function()? callback;

  @override
  State<WriteCommenWidget> createState() => _WriteCommenWidgetState();
}

class _WriteCommenWidgetState extends State<WriteCommenWidget> {
  late WriteCommenModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WriteCommenModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x162D3A21),
            offset: Offset(
              0.0,
              3.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: const Color(0xFFE0E3E7),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50.0,
                  height: 50.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    FFAppState().currentUser.profilePic,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textController',
                        const Duration(milliseconds: 0),
                        () => safeSetState(() {}),
                      ),
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Comente alguma coisa',
                        hintStyle:
                            FlutterFlowTheme.of(context).labelSmall.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: const Color(0xFF57636C),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        focusedErrorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0),
                          ),
                        ),
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 4.0, 8.0, 12.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color: const Color(0xFF14181B),
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                      maxLines: 8,
                      minLines: 3,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: const Icon(
                            Icons.photo_outlined,
                            color: Color(0xFF57636C),
                            size: 20.0,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ),
                  ],
                ),
                FFButtonWidget(
                  onPressed: (_model.textController.text == '')
                      ? null
                      : () async {
                          await FeedComentariosTable().insert({
                            'onPost': true,
                            'onComment': false,
                            'post': widget.post?.id,
                            'commenter': FFAppState().currentUser.id,
                            'comment_text': _model.textController.text,
                          });
                          _model.op = await UsersTable().queryRows(
                            queryFn: (q) => q.eqOrNull(
                              'id',
                              widget.post?.poster,
                            ),
                          );
                          await SendPushCall.call(
                            fcmToken: _model.op?.firstOrNull?.fcmToken,
                            pushTitle: 'Novo comentário!',
                            pushMessage:
                                '${FFAppState().currentUser.nome} acabou de comentar no seu post!',
                          );

                          await widget.callback?.call();
                          safeSetState(() {
                            _model.textController?.clear();
                          });
                          Navigator.pop(context);

                          safeSetState(() {});
                        },
                  text: 'Comentar',
                  icon: const Icon(
                    Icons.send_rounded,
                    size: 18.0,
                  ),
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
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
                    disabledColor: const Color(0xFFC7C8C9),
                  ),
                  showLoadingIndicator: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
