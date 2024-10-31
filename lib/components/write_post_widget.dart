import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'write_post_model.dart';
export 'write_post_model.dart';

class WritePostWidget extends StatefulWidget {
  const WritePostWidget({
    super.key,
    this.callback,
    bool? edit,
    this.postEdit,
  }) : edit = edit ?? false;

  final Future Function()? callback;
  final bool edit;
  final FeedPostagensRow? postEdit;

  @override
  State<WritePostWidget> createState() => _WritePostWidgetState();
}

class _WritePostWidgetState extends State<WritePostWidget> {
  late WritePostModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WritePostModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.edit == true) {
        safeSetState(() {
          _model.postTextTextController?.text = widget.postEdit!.postText!;
          _model.postTextTextController?.selection =
              const TextSelection.collapsed(offset: 0);
        });
        _model.edit = true;
        safeSetState(() {});
        if (widget.postEdit?.hasImage == true) {
          return;
        }

        return;
      } else {
        return;
      }
    });

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
    context.watch<FFAppState>();

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
                      'Estamos aqui para fazer conexões genuínas entre empresários. Então compartilhe aqui que tipo de conexão / indicação você está buscando, quanto mais específico melhor.\n',
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
                  hintText: 'Escreva o que está acontecendo',
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
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final imgs = _model.images.toList();

                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(imgs.length, (imgsIndex) {
                                final imgsItem = imgs[imgsIndex];
                                return SizedBox(
                                  width: 100.0,
                                  height: 100.0,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.memory(
                                          imgsItem.bytes ??
                                              Uint8List.fromList([]),
                                          width: 200.0,
                                          height: 200.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(1.0, -1.0),
                                        child: FlutterFlowIconButton(
                                          borderRadius: 200.0,
                                          buttonSize: 40.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                          icon: Icon(
                                            Icons.close,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            _model.removeFromImages(imgsItem);
                                            safeSetState(() {});
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              })
                                  .divide(const SizedBox(width: 12.0))
                                  .addToStart(const SizedBox(width: 18.0))
                                  .addToEnd(const SizedBox(width: 18.0)),
                            ),
                          );
                        },
                      ),
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
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              icon: const Icon(
                                Icons.image,
                                color: Color(0xFF009C3B),
                                size: 24.0,
                              ),
                              onPressed: () async {
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  allowPhoto: true,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  safeSetState(
                                      () => _model.isDataUploading1 = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                  try {
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                              blurHash: m.blurHash,
                                            ))
                                        .toList();
                                  } finally {
                                    _model.isDataUploading1 = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                      selectedMedia.length) {
                                    safeSetState(() {
                                      _model.uploadedLocalFile1 =
                                          selectedUploadedFiles.first;
                                    });
                                  } else {
                                    safeSetState(() {});
                                    return;
                                  }
                                }

                                if ((_model.uploadedLocalFile1.bytes
                                            ?.isNotEmpty ??
                                        false)) {
                                  _model.addToImages(_model.uploadedLocalFile1);
                                  safeSetState(() {});
                                }
                              },
                            ),
                          ].divide(const SizedBox(width: 16.0)),
                        ),
                        FFButtonWidget(
                          onPressed: (_model.postTextTextController.text == '')
                              ? null
                              : () async {
                                  var shouldSetState = false;
                                  {
                                    safeSetState(
                                        () => _model.isDataUploading2 = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];
                                    var selectedMedia = <SelectedFile>[];
                                    var downloadUrls = <String>[];
                                    try {
                                      selectedUploadedFiles = _model.images;
                                      selectedMedia =
                                          selectedFilesFromUploadedFiles(
                                        selectedUploadedFiles,
                                        storageFolderPath: 'posts',
                                        isMultiData: true,
                                      );
                                      downloadUrls =
                                          await uploadSupabaseStorageFiles(
                                        bucketName: 'users',
                                        selectedFiles: selectedMedia,
                                      );
                                    } finally {
                                      _model.isDataUploading2 = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                            selectedMedia.length &&
                                        downloadUrls.length ==
                                            selectedMedia.length) {
                                      safeSetState(() {
                                        _model.uploadedLocalFiles2 =
                                            selectedUploadedFiles;
                                        _model.uploadedFileUrls2 = downloadUrls;
                                      });
                                    } else {
                                      safeSetState(() {});
                                      return;
                                    }
                                  }

                                  if (widget.edit == true) {
                                    if ((_model.images.isNotEmpty) == true) {
                                      if (_model.images.length == 1) {
                                        await FeedPostagensTable().update(
                                          data: {
                                            'poster':
                                                FFAppState().currentUser.id,
                                            'post_text': _model
                                                .postTextTextController.text,
                                            'hasImage': true,
                                            'post_image':
                                                _model.uploadedFileUrls2.first,
                                            'isSingleImage': true,
                                          },
                                          matchingRows: (rows) => rows.eq(
                                            'id',
                                            widget.postEdit?.id,
                                          ),
                                        );
                                        shouldSetState = true;
                                      } else {
                                        await FeedPostagensTable().update(
                                          data: {
                                            'poster':
                                                FFAppState().currentUser.id,
                                            'post_text': _model
                                                .postTextTextController.text,
                                            'hasImage': true,
                                            'isSingleImage': false,
                                            'post_images':
                                                _model.uploadedFileUrls2,
                                          },
                                          matchingRows: (rows) => rows.eq(
                                            'id',
                                            widget.postEdit?.id,
                                          ),
                                        );
                                        shouldSetState = true;
                                      }

                                      await widget.callback?.call();
                                      Navigator.pop(context);
                                      if (shouldSetState) safeSetState(() {});
                                      return;
                                    } else {
                                      await FeedPostagensTable().update(
                                        data: {
                                          'poster': FFAppState().currentUser.id,
                                          'post_text': _model
                                              .postTextTextController.text,
                                        },
                                        matchingRows: (rows) => rows.eq(
                                          'id',
                                          widget.postEdit?.id,
                                        ),
                                      );
                                      shouldSetState = true;
                                      await widget.callback?.call();
                                      Navigator.pop(context);
                                      if (shouldSetState) safeSetState(() {});
                                      return;
                                    }
                                  } else {
                                    if ((_model.images.isNotEmpty) == true) {
                                      if (_model.images.length == 1) {
                                        _model.apiResultmr9 =
                                            await FeedPostagensTable().insert({
                                          'poster': FFAppState().currentUser.id,
                                          'post_text': _model
                                              .postTextTextController.text,
                                          'hasImage': true,
                                          'post_image':
                                              _model.uploadedFileUrls2.first,
                                          'isSingleImage': true,
                                        });
                                        shouldSetState = true;
                                      } else {
                                        _model.apiResultmr9zx =
                                            await FeedPostagensTable().insert({
                                          'poster': FFAppState().currentUser.id,
                                          'post_text': _model
                                              .postTextTextController.text,
                                          'hasImage': true,
                                          'isSingleImage': false,
                                          'post_images':
                                              _model.uploadedFileUrls2,
                                        });
                                        shouldSetState = true;
                                      }

                                      await widget.callback?.call();
                                      Navigator.pop(context);
                                      if (shouldSetState) safeSetState(() {});
                                      return;
                                    } else {
                                      _model.apiResultmr9vvf =
                                          await FeedPostagensTable().insert({
                                        'poster': FFAppState().currentUser.id,
                                        'post_text':
                                            _model.postTextTextController.text,
                                      });
                                      shouldSetState = true;
                                      await widget.callback?.call();
                                      Navigator.pop(context);
                                      if (shouldSetState) safeSetState(() {});
                                      return;
                                    }
                                  }

                                  if (shouldSetState) safeSetState(() {});
                                },
                          text: 'Postar',
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
                            disabledColor: const Color(0xFFC7C8C9),
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
