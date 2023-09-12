part of 'upload_file_bloc.dart';

abstract class UploadFileState {
  const UploadFileState();
}

class UploadFileInitial extends UploadFileState {}

class UploadingSuccessState extends UploadFileState {
  final String url;
  final String filePath;

  UploadingSuccessState(this.url, this.filePath);

  @override
  String toString() {
    return '上传成功：$url';
  }
}

class UploadingErrorState extends UploadFileState {
  final String errorMsg;
  final String localFilePath;

  UploadingErrorState(this.errorMsg, this.localFilePath);

  @override
  String toString() {
    return '上传失败：$errorMsg';
  }
}

class UploadingState extends UploadFileState {
  final double progress;
  final String localFilePath;

  UploadingState(this.progress, this.localFilePath);

  @override
  String toString() {
    return '上传进度：$progress';
  }
}
