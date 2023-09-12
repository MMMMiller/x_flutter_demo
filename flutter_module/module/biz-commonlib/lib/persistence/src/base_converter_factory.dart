import 'package:common_lib/persistence/src/xy_base_net_entity.dart';
import 'package:x_framework/base/base_net_entity.dart';
import 'package:x_framework/provider/x_converter_factory.dart';
import 'package:x_framework/util/index.dart';

abstract class BaseConverterFactory extends XConverterFactory {
  @override
  BaseNetEntity<T> transformData<T>(data) {
    final response = data.data;

    /// TODO 标记：接口数据拦截，断点以获取接口返回数据
    final int code = response['code'];
    final String? message = response['message'] ?? response['error'];
    PageNumberBean? pageNumberBean;
    T? model;
    if (_isSuccess(code) && !isEmpty(response['data'])) {
      var dataInfo = response['data'];
      bool isDynamic = false;
      if (_isLoadList(T)) {
        if (dataInfo is! List) {
          dataInfo = dataInfo['data'];
          final totalCount = response['data']['totalCount'];
          final totalPage = response['data']['totalPage'];
          pageNumberBean = PageNumberBean(totalCount ?? 0, totalPage ?? 0);
        }
        isDynamic = _isDynamic(T);
      }
      if (!isDynamic) {
        model = fromJsonAsT<T>(dataInfo);
      }
      model ??= dataInfo;
    }
    if (pageNumberBean == null) {
      return XyBaseNetEntity(code: code, message: message, data: model);
    }
    return XyBaseNetEntity(
        code: code,
        message: message,
        data: model,
        pageNumberBean: pageNumberBean);
  }

  M? fromJsonAsT<M>(json);

  bool _isLoadList(Type t) {
    return t.toString().contains('List<');
  }

  bool _isSuccess(int code) {
    return code == 200;
  }

  bool _isDynamic(Type t) {
    return t.toString().contains('List<dynamic');
  }
}
