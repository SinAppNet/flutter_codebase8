import '/backend/supabase/supabase.dart';
import '/componentes/app_bar/app_bar_widget.dart';
import '/componentes/init_chat_messages/init_chat_messages_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'chat_widget.dart' show ChatWidget;
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class ChatModel extends FlutterFlowModel<ChatWidget> {
  ///  Local state fields for this page.

  bool all = false;

  int? num = 0;

  bool isRecording = false;

  String? currentAudio;

  ///  State fields for stateful widgets in this page.

  // Model for appBar component.
  late AppBarModel appBarModel;
  Stream<List<MensagensRow>>? containerSupabaseStream;
  // State field(s) for Mensagens widget.
  ScrollController? mensagens;
  // Model for initChatMessages component.
  late InitChatMessagesModel initChatMessagesModel;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<MensagensRow>? msgsCopy;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Icon widget.
  List<MensagensRow>? msgs;
  AudioRecorder? audioRecorder;
  String? stopped;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    mensagens = ScrollController();
    initChatMessagesModel = createModel(context, () => InitChatMessagesModel());
  }

  @override
  void dispose() {
    appBarModel.dispose();
    mensagens?.dispose();
    initChatMessagesModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
