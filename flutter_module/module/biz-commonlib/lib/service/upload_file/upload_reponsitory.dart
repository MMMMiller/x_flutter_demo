import 'package:common_lib/config/config.dart';
import 'package:common_lib/index.dart';
import 'package:common_lib/service/upload_file/oss_config_entity.dart';
import 'package:common_lib/service/upload_file/upload_file_bloc.dart';

class GetUploadPolicyProvider extends BaseRequest<OssConfigEntity> {
  final String fileName;

  GetUploadPolicyProvider({
    required this.fileName,
  });

  @override
  RequestBean get requestBean => RequestBean(
        BcBaseApiAddress.getUploadPolicy,
        params: {
          'fileType': UploadType.getFileType(fileName),
          'fileName': fileName,
          'originalName': _getOriginalName(),
          'useObj': 1,
          'domainType': 1,
        },
        requestType: RequestType.GET,
      );

  String _getOriginalName() {
    final String resetName = MediaUtil.fileName(fileName);
    return resetName;
  }
}
