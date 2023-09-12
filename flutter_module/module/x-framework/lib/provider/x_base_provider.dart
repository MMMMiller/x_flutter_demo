/*
 * 项目名:    x_framework
 * 包名       provider
 * 文件名:    x_base_provider
 * 创建时间:  2020/9/21 on 3:35 PM
 * 描述:
 *
 * @author   xueml
 */

import 'package:x_framework/index.dart';

abstract class XBaseProvider<T> {
  XBaseProviderBuilder get xBaseProviderBuilder;

  Future<BaseNetEntity<T>> load();

  Future<T?> loadLocal();

  RequestBean get requestBean;

  bool get isLocalCache => requestBean.isCacheLocal;

  String get cacheTag => requestBean.cacheTag;

  XLocalStorage get localStorage => xBaseProviderBuilder.localStorage;

  String get localCacheKey => _createKey();

  String _createKey() {
    return isEmptyString(requestBean.cacheTag)
        ? T.toString()
        : '${T.runtimeType.toString()}?${requestBean.cacheTag}';
  }
}
