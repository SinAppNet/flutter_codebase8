import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'cadastro_model.dart';
export 'cadastro_model.dart';

class CadastroWidget extends StatefulWidget {
  const CadastroWidget({super.key});

  @override
  State<CadastroWidget> createState() => _CadastroWidgetState();
}

class _CadastroWidgetState extends State<CadastroWidget> {
  late CadastroModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CadastroModel());

    _model.usernameTextController ??= TextEditingController();
    _model.usernameFocusNode ??= FocusNode();

    _model.emailTextController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.cpfTextController ??= TextEditingController();
    _model.cpfFocusNode ??= FocusNode();

    _model.wppTextController ??= TextEditingController();
    _model.wppFocusNode ??= FocusNode();

    _model.senha01TextController ??= TextEditingController();
    _model.senha01FocusNode ??= FocusNode();

    _model.nomeEmpresaTextController ??= TextEditingController();
    _model.nomeEmpresaFocusNode ??= FocusNode();

    _model.sobreTextController ??= TextEditingController();
    _model.sobreFocusNode ??= FocusNode();

    _model.tipoConexTextController ??= TextEditingController();
    _model.tipoConexFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            decoration: const BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (_model.step == 1)
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0x00FFFFFF),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.safePop();
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 38.0,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 25.0, 20.0, 25.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 120.0,
                                          height: 120.0,
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: 120.0,
                                                height: 120.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.memory(
                                                  _model.uploadedLocalFile1
                                                          .bytes ??
                                                      Uint8List.fromList([]),
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Image.asset(
                                                    'assets/images/error_image.jpg',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              if ((_model.uploadedLocalFile1
                                                          .bytes?.isEmpty ??
                                                      true))
                                                Container(
                                                  width: 120.0,
                                                  height: 120.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.network(
                                                        'https://static.vecteezy.com/system/resources/thumbnails/003/337/584/small/default-avatar-photo-placeholder-profile-icon-vector.jpg',
                                                      ).image,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            200.0),
                                                  ),
                                                ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    await requestPermission(
                                                        photoLibraryPermission);
                                                    if (await getPermissionStatus(
                                                        photoLibraryPermission)) {
                                                      final selectedMedia =
                                                          await selectMediaWithSourceBottomSheet(
                                                        context: context,
                                                        allowPhoto: true,
                                                      );
                                                      if (selectedMedia !=
                                                              null &&
                                                          selectedMedia.every((m) =>
                                                              validateFileFormat(
                                                                  m.storagePath,
                                                                  context))) {
                                                        safeSetState(() => _model
                                                                .isDataUploading1 =
                                                            true);
                                                        var selectedUploadedFiles =
                                                            <FFUploadedFile>[];

                                                        try {
                                                          selectedUploadedFiles =
                                                              selectedMedia
                                                                  .map((m) =>
                                                                      FFUploadedFile(
                                                                        name: m
                                                                            .storagePath
                                                                            .split('/')
                                                                            .last,
                                                                        bytes: m
                                                                            .bytes,
                                                                        height: m
                                                                            .dimensions
                                                                            ?.height,
                                                                        width: m
                                                                            .dimensions
                                                                            ?.width,
                                                                        blurHash:
                                                                            m.blurHash,
                                                                      ))
                                                                  .toList();
                                                        } finally {
                                                          _model.isDataUploading1 =
                                                              false;
                                                        }
                                                        if (selectedUploadedFiles
                                                                .length ==
                                                            selectedMedia
                                                                .length) {
                                                          safeSetState(() {
                                                            _model.uploadedLocalFile1 =
                                                                selectedUploadedFiles
                                                                    .first;
                                                          });
                                                        } else {
                                                          safeSetState(() {});
                                                          return;
                                                        }
                                                      }
                                                    }
                                                  },
                                                  text: 'Editar',
                                                  options: FFButtonOptions(
                                                    height: 32.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: const Color(0xFF009C3B),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 15.0, 0.0, 0.0),
                                          child: Column(
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
                                                      'connectRecommend');
                                                },
                                                child: Text(
                                                  'Nome',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF344054),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: double.infinity,
                                                child: TextFormField(
                                                  controller: _model
                                                      .usernameTextController,
                                                  focusNode:
                                                      _model.usernameFocusNode,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.usernameTextController',
                                                    const Duration(milliseconds: 0),
                                                    () => safeSetState(() {}),
                                                  ),
                                                  autofocus: false,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    hintText:
                                                        'Nome e sobrenome',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              const Color(0xFF667085),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0xFFD0D5DD),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0xB1009C3B),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    contentPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                15.0,
                                                                20.0,
                                                                15.0,
                                                                20.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF667085),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  validator: _model
                                                      .usernameTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ].divide(const SizedBox(height: 10.0)),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'E-mail',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: const Color(0xFF344054),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            SizedBox(
                                              width: double.infinity,
                                              child: TextFormField(
                                                controller:
                                                    _model.emailTextController,
                                                focusNode:
                                                    _model.emailFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.emailTextController',
                                                  const Duration(milliseconds: 0),
                                                  () => safeSetState(() {}),
                                                ),
                                                autofocus: false,
                                                textInputAction:
                                                    TextInputAction.next,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  hintText:
                                                      'exemplo@sinapp.tech',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF667085),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0xFFD0D5DD),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0xB1009C3B),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  contentPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(15.0, 20.0,
                                                              15.0, 20.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              const Color(0xFF667085),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                validator: _model
                                                    .emailTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ].divide(const SizedBox(height: 10.0)),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'CPF',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: const Color(0xFF344054),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            SizedBox(
                                              width: double.infinity,
                                              child: TextFormField(
                                                controller:
                                                    _model.cpfTextController,
                                                focusNode: _model.cpfFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.cpfTextController',
                                                  const Duration(milliseconds: 0),
                                                  () => safeSetState(() {}),
                                                ),
                                                autofocus: false,
                                                textInputAction:
                                                    TextInputAction.next,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  hintText: '000.000.000-00',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF667085),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0xFFD0D5DD),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0xB1009C3B),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  contentPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(15.0, 20.0,
                                                              15.0, 20.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              const Color(0xFF667085),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                validator: _model
                                                    .cpfTextControllerValidator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  _model.cpfMask
                                                ],
                                              ),
                                            ),
                                          ].divide(const SizedBox(height: 10.0)),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'WhatsApp',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF344054),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .wppTextController,
                                                    focusNode:
                                                        _model.wppFocusNode,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.wppTextController',
                                                      const Duration(milliseconds: 0),
                                                      () => safeSetState(() {}),
                                                    ),
                                                    autofocus: false,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      hintText: 'seu whatsapp',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: const Color(
                                                                    0xFF667085),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                              Color(0xFFD0D5DD),
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                              Color(0xB1009C3B),
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                      contentPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  20.0,
                                                                  15.0,
                                                                  20.0),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              const Color(0xFF667085),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    maxLength: 11,
                                                    validator: _model
                                                        .wppTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(height: 10.0)),
                                            ),
                                            Text(
                                              'Senha',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: const Color(0xFF344054),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            SizedBox(
                                              width: double.infinity,
                                              child: TextFormField(
                                                controller: _model
                                                    .senha01TextController,
                                                focusNode:
                                                    _model.senha01FocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.senha01TextController',
                                                  const Duration(milliseconds: 0),
                                                  () => safeSetState(() {}),
                                                ),
                                                autofocus: false,
                                                textInputAction:
                                                    TextInputAction.next,
                                                obscureText:
                                                    !_model.senha01Visibility,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  hintText: 'Sua senha',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF667085),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0xFFD0D5DD),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0xB1009C3B),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  contentPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(15.0, 20.0,
                                                              15.0, 20.0),
                                                  suffixIcon: InkWell(
                                                    onTap: () => safeSetState(
                                                      () => _model
                                                              .senha01Visibility =
                                                          !_model
                                                              .senha01Visibility,
                                                    ),
                                                    focusNode: FocusNode(
                                                        skipTraversal: true),
                                                    child: Icon(
                                                      _model.senha01Visibility
                                                          ? Icons
                                                              .visibility_outlined
                                                          : Icons
                                                              .visibility_off_outlined,
                                                      size: 23.0,
                                                    ),
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              const Color(0xFF667085),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                validator: _model
                                                    .senha01TextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ].divide(const SizedBox(height: 10.0)),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 15.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Nome da empresa',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              const Color(0xFF344054),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              SizedBox(
                                                width: double.infinity,
                                                child: TextFormField(
                                                  controller: _model
                                                      .nomeEmpresaTextController,
                                                  focusNode: _model
                                                      .nomeEmpresaFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    hintText: 'Sua empresa',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              const Color(0xFF667085),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0xFFD0D5DD),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0xB1009C3B),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    contentPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                15.0,
                                                                20.0,
                                                                15.0,
                                                                20.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF667085),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  validator: _model
                                                      .nomeEmpresaTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ].divide(const SizedBox(height: 10.0)),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Segmento',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: const Color(0xFF344054),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .segmentoEmpresaValueController ??=
                                                  FormFieldController<String>(
                                                      null),
                                              options: const [
                                                'Advocacia',
                                                'Agropecuaria',
                                                'Alementação e gastronomia',
                                                'Arquitetura',
                                                'Beleza e estética',
                                                'Comunicação visual',
                                                'Consultoria e Mentoria',
                                                'Construção Civil',
                                                'Contabilidade',
                                                'E-commerce',
                                                'Educação',
                                                'Energia sustentável',
                                                'Finanças',
                                                'Fitness',
                                                'Industria',
                                                'Investimentos',
                                                'Marketing',
                                                'Moda e vestuário',
                                                'SAAS',
                                                'Seguros',
                                                'Terapias holisticas',
                                                'Tecnologia',
                                                'Transportes',
                                                'Varejo',
                                                'Outros'
                                              ],
                                              onChanged: (val) => safeSetState(
                                                  () => _model
                                                          .segmentoEmpresaValue =
                                                      val),
                                              width: double.infinity,
                                              height: 50.0,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'Segmento',
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 0.0,
                                              borderColor: const Color(0xFFD0D5DD),
                                              borderWidth: 2.0,
                                              borderRadius: 8.0,
                                              margin: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 4.0),
                                              hidesUnderline: true,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            ),
                                          ].divide(const SizedBox(height: 10.0)),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Sobre',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: const Color(0xFF344054),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            SizedBox(
                                              width: double.infinity,
                                              child: TextFormField(
                                                controller:
                                                    _model.sobreTextController,
                                                focusNode:
                                                    _model.sobreFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.sobreTextController',
                                                  const Duration(milliseconds: 0),
                                                  () => safeSetState(() {}),
                                                ),
                                                autofocus: false,
                                                textInputAction:
                                                    TextInputAction.done,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  hintText:
                                                      'Conte um pouco sobre você e suas experiências pessoais...',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF667085),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0xFFD0D5DD),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0xB1009C3B),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  contentPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(15.0, 20.0,
                                                              15.0, 20.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              const Color(0xFF667085),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                maxLines: 5,
                                                maxLength: 200,
                                                validator: _model
                                                    .sobreTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ].divide(const SizedBox(height: 10.0)),
                                        ),
                                        FFButtonWidget(
                                          onPressed: ((_model.usernameTextController
                                                              .text ==
                                                          '') ||
                                                  (_model
                                                              .emailTextController
                                                              .text ==
                                                          '') ||
                                                  (_model.senha01TextController
                                                              .text ==
                                                          '') ||
                                                  (_model.wppTextController
                                                              .text ==
                                                          ''))
                                              ? null
                                              : () async {
                                                  GoRouter.of(context)
                                                      .prepareAuthEvent();
                                                  if (_model
                                                          .senha01TextController
                                                          .text !=
                                                      _model
                                                          .senha01TextController
                                                          .text) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      const SnackBar(
                                                        content: Text(
                                                          'Passwords don\'t match!',
                                                        ),
                                                      ),
                                                    );
                                                    return;
                                                  }

                                                  final user = await authManager
                                                      .createAccountWithEmail(
                                                    context,
                                                    _model.emailTextController
                                                        .text,
                                                    _model.senha01TextController
                                                        .text,
                                                  );
                                                  if (user == null) {
                                                    return;
                                                  }

                                                  _model.createdUser =
                                                      await UsersTable()
                                                          .insert({
                                                    'uuid': currentUserUid,
                                                    'nome': _model
                                                        .usernameTextController
                                                        .text,
                                                    'whatsapp': _model
                                                        .wppTextController.text,
                                                    'segmento_empresa': _model
                                                        .segmentoEmpresaValue,
                                                  });
                                                  _model.createdEmpresa =
                                                      await EmpresasTable()
                                                          .insert({
                                                    'created_by':
                                                        _model.createdUser?.id,
                                                    'nome': _model
                                                        .nomeEmpresaTextController
                                                        .text,
                                                    'segmento': _model
                                                        .segmentoEmpresaValue,
                                                  });
                                                  _model.asaasClient =
                                                      await AddAsaasCustomerCall
                                                          .call(
                                                    name: _model
                                                        .usernameTextController
                                                        .text,
                                                    email: _model
                                                        .emailTextController
                                                        .text,
                                                    phone: _model
                                                        .wppTextController.text,
                                                    cpf: _model
                                                        .cpfTextController.text,
                                                  );

                                                  await UsersTable().update(
                                                    data: {
                                                      'empresa': _model
                                                          .createdEmpresa?.id,
                                                      'empresa_nome': _model
                                                          .nomeEmpresaTextController
                                                          .text,
                                                      'asaas_customer_id':
                                                          AddAsaasCustomerCall
                                                              .cusId(
                                                        (_model.asaasClient
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                    },
                                                    matchingRows: (rows) =>
                                                        rows.eqOrNull(
                                                      'uuid',
                                                      currentUserUid,
                                                    ),
                                                  );
                                                  await ColaboradoresEmpresasTable()
                                                      .insert({
                                                    'empresa': _model
                                                        .createdEmpresa?.id,
                                                    'colaborador':
                                                        _model.createdUser?.id,
                                                  });
                                                  FFAppState().currentUser =
                                                      CurrentUserStruct(
                                                    id: _model.createdUser?.id,
                                                    nome: _model
                                                        .createdUser?.nome,
                                                    email: currentUserEmail,
                                                    profilePic: _model
                                                        .createdUser
                                                        ?.profilePic,
                                                    sobre: _model
                                                        .createdUser?.sobre,
                                                    whatsapp: _model
                                                        .createdUser?.whatsapp,
                                                    instagram: _model
                                                        .createdUser?.instagram,
                                                    linkedin: _model
                                                        .createdUser?.linkedin,
                                                    empresaId: _model
                                                        .createdUser?.empresa,
                                                  );
                                                  safeSetState(() {});
                                                  if ((_model
                                                              .uploadedLocalFile1
                                                              .bytes
                                                              ?.isNotEmpty ??
                                                          false)) {
                                                    {
                                                      safeSetState(() => _model
                                                              .isDataUploading2 =
                                                          true);
                                                      var selectedUploadedFiles =
                                                          <FFUploadedFile>[];
                                                      var selectedFiles =
                                                          <SelectedFile>[];
                                                      var downloadUrls =
                                                          <String>[];
                                                      try {
                                                        selectedUploadedFiles = _model
                                                                .uploadedLocalFile1
                                                                .bytes!
                                                                .isNotEmpty
                                                            ? [
                                                                _model
                                                                    .uploadedLocalFile1
                                                              ]
                                                            : <FFUploadedFile>[];
                                                        selectedFiles =
                                                            selectedFilesFromUploadedFiles(
                                                          selectedUploadedFiles,
                                                          storageFolderPath:
                                                              'profile',
                                                        );
                                                        downloadUrls =
                                                            await uploadSupabaseStorageFiles(
                                                          bucketName: 'users',
                                                          selectedFiles:
                                                              selectedFiles,
                                                        );
                                                      } finally {
                                                        _model.isDataUploading2 =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                                  .length ==
                                                              selectedFiles
                                                                  .length &&
                                                          downloadUrls.length ==
                                                              selectedFiles
                                                                  .length) {
                                                        safeSetState(() {
                                                          _model.uploadedLocalFile2 =
                                                              selectedUploadedFiles
                                                                  .first;
                                                          _model.uploadedFileUrl2 =
                                                              downloadUrls
                                                                  .first;
                                                        });
                                                      } else {
                                                        safeSetState(() {});
                                                        return;
                                                      }
                                                    }

                                                    await UsersTable().update(
                                                      data: {
                                                        'profile_pic': _model
                                                            .uploadedFileUrl2,
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows.eqOrNull(
                                                        'uuid',
                                                        currentUserUid,
                                                      ),
                                                    );
                                                    _model.apiResult4l2de =
                                                        await NnAccCreatedCall
                                                            .call(
                                                      email: currentUserEmail,
                                                    );

                                                    _model.step = 2;
                                                    safeSetState(() {});
                                                  } else {
                                                    _model.apiResult4l2 =
                                                        await NnAccCreatedCall
                                                            .call(
                                                      email: currentUserEmail,
                                                    );

                                                    _model.step = 2;
                                                    safeSetState(() {});
                                                  }

                                                  safeSetState(() {});
                                                },
                                          text: 'Próximo',
                                          icon: const Icon(
                                            Icons.arrow_forward_rounded,
                                            size: 18.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 48.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: const Color(0xFF009C3B),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            disabledColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                          ),
                                        ),
                                      ].divide(const SizedBox(height: 20.0)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (_model.step == 2)
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0x00FFFFFF),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 32.0, 24.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Que tipo de conexão você busca no SinApp?',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: const Color(0xFF344054),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                SizedBox(
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
                                          'Conte que tipo de conexão você busca fazer',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: const Color(0xFF667085),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xFFD0D5DD),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xB1009C3B),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
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
                                    maxLines: 5,
                                    validator: _model
                                        .tipoConexTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 10.0)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 32.0),
                            child: FFButtonWidget(
                              onPressed: (_model.tipoConexTextController.text == '')
                                  ? null
                                  : () async {
                                      await UsersTable().update(
                                        data: {
                                          'tipo_conexao': _model
                                              .tipoConexTextController.text,
                                        },
                                        matchingRows: (rows) => rows.eqOrNull(
                                          'uuid',
                                          currentUserUid,
                                        ),
                                      );

                                      context.goNamed('connectRecommend');
                                    },
                              text: 'Finalizar',
                              options: FFButtonOptions(
                                width: double.infinity,
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
                                disabledTextColor: const Color(0x52000000),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(height: 20.0)),
                      ),
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
