import 'dart:async';
import 'dart:io';
import 'package:common_lib/index.dart';
import 'package:common_lib/service/upload_file/oss_config_entity.dart';
import 'package:common_lib/service/upload_file/upload_reponsitory.dart';

part 'upload_file_event.dart';

part 'upload_file_state.dart';

class UploadFileBloc extends BaseBloc<UploadFileEvent, UploadFileState> {
  final String _uploadPolicyKey = 'PolicyKey';

  File? _file;

  bool _isNeedProgress = false;

  UploadFileBloc() : super(UploadFileInitial());

  void uploadFile(File file) {
    add(ConfirmUploadFileEvent(file));
  }

  void uploadFileByOssInfo(File file, OssConfigEntity ossInfo) {
    add(ConfirmUploadFileEvent(file, mOssConfigEntity: ossInfo));
  }

  void openProgress() {
    _isNeedProgress = true;
  }

  void setFile(File file) {
    _file = file;
  }

  File? get file => _file;

  void upload() {
    assert(_file != null, '请先配置需要上传的文件');
    add(ConfirmUploadFileEvent(_file!));
  }

  Future<BaseNetEntity<OssConfigEntity>> uploadFileAsync(File file) async {
    final String fileName = MediaUtil.fileName(file.path);
    final baseNetEntity =
        await GetUploadPolicyProvider(fileName: fileName).load();
    return baseNetEntity;
  }
}

class UploadType {
  static const pic = 'pic';
  static const video = 'video';
  static const voice = 'video';
  static const doc = 'video';
  static const file = 'video';

  static String getFileSuffix(String fileName) {
    final int index = fileName.indexOf('.'); // .在第几位
    final String type =
        fileName.substring(index, fileName.length).toLowerCase();
    return type;
  }

  static String getFileType(String fileName) {
    String fileType;
    final String type = getFileSuffix(fileName); // 截断.之前的，得到后缀
    if (type == '.bmp' ||
        type == '.png' ||
        type == '.gif' ||
        type == '.jpg' ||
        type == '.jpeg') {
      // 根据后缀，判断是否符合图片格式
      fileType = 'pic';
    } else if (type == '.mp4' || type == '.ogg' || type == '.webm') {
      fileType = 'video';
    } else if (type == '.wav' ||
        type == '.mp3' ||
        type == '.acc' ||
        type == '.mov') {
      fileType = 'voice';
    } else if (type == '.doc' || type == '.docx' || type == '.xlsx') {
      fileType = 'doc';
    } else {
      fileType = 'file';
    }
    return fileType;
  }
}
