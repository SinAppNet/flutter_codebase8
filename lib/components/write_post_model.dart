import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'write_post_widget.dart' show WritePostWidget;
import 'package:flutter/material.dart';

class WritePostModel extends FlutterFlowModel<WritePostWidget> {
  ///  Local state fields for this component.

  List<FFUploadedFile> images = [];
  void addToImages(FFUploadedFile item) => images.add(item);
  void removeFromImages(FFUploadedFile item) => images.remove(item);
  void removeAtIndexFromImages(int index) => images.removeAt(index);
  void insertAtIndexInImages(int index, FFUploadedFile item) =>
      images.insert(index, item);
  void updateImagesAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      images[index] = updateFn(images[index]);

  bool edit = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for postText widget.
  FocusNode? postTextFocusNode;
  TextEditingController? postTextTextController;
  String? Function(BuildContext, String?)? postTextTextControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading2 = false;
  List<FFUploadedFile> uploadedLocalFiles2 = [];
  List<String> uploadedFileUrls2 = [];

  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<FeedPostagensRow>? apiResultmr9z;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<FeedPostagensRow>? apiResultmr9zxz;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<FeedPostagensRow>? apiResultmr9vvfz;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  FeedPostagensRow? apiResultmr9;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  FeedPostagensRow? apiResultmr9zx;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  FeedPostagensRow? apiResultmr9vvf;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    postTextFocusNode?.dispose();
    postTextTextController?.dispose();
  }
}
