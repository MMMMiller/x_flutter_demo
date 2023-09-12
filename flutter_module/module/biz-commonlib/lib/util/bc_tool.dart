import 'dart:io';

class BCTool {

  String getFileType({
    required String filePath,
  }){
  if(filePath.length  > 5){
    final filePathSub = filePath.substring(filePath.length - 5,filePath.length);
    final arr = filePathSub.split('.');
    if(arr.length > 1){
      return arr[1];
    } else {
      return '';
    }
  }
    return '';
  }

  bool canOpenFile({
    required String filePath,
  }) {
    final fileType = getFileType(filePath: filePath);
    if(fileType == ''
        || fileType == 'rar'
        || fileType == 'zip'
        || fileType == 'ppt'
        || fileType == 'pptx'){
      return false;
    }
    if(Platform.isIOS && (fileType == 'doc' || fileType == 'xls')){
      return false;
    }
    return true;
  }
}