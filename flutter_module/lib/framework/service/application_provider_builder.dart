
import 'package:common_lib/generated/json/base/json_convert_content.dart';
import 'package:common_lib/index.dart';

/// 项目名:    gaea
/// 包名
/// 文件名:    application_provider_builder
/// 创建时间:  2022/8/24 on 11:01
/// 描述:
///
/// @author   xueml

class ApplicationProviderBuilder extends CommonBaseProviderBuilder {
  final _applicationConverterFactory = ApplicationConverterFactory();

  @override
  XConverterFactory get converterFactory => _applicationConverterFactory;
}

class ApplicationConverterFactory extends BaseConverterFactory {
  @override
  M? fromJsonAsT<M>(json) => JsonConvert.fromJsonAsT(json);
}
