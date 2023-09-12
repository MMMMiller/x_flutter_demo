/*
 * 项目名:    x-framework
 * 包名
 * 文件名:    request_bean
 * 创建时间:  2020-01-06 on 14:01
 * 描述:
 *
 * @author   xueml
 */

class RequestBean {
  final String requestUrl;
  Map<String, dynamic>? params;
  RequestType requestType;

  /// if [isCacheLocal] is true ，I cache the data requested by the network locally
  final bool isCacheLocal;
  final String cacheTag;

  Map<String, dynamic> get requestParams => params ?? {};

  RequestBean(
    this.requestUrl, {
    this.cacheTag = '',
    this.params,
    this.isCacheLocal = false,
    this.requestType = RequestType.POST_JSON,
  });
}

enum RequestType {
  GET,
  POST_FORM,
  POST_JSON,
  DEL,
  PUT,
}
