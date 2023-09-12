import 'package:x_framework/base/base_net_entity.dart';

class XyBaseNetEntity<T> extends BaseNetEntity<T> {
  final PageNumberBean? pageNumberBean;

  XyBaseNetEntity(
      {this.pageNumberBean,
      int? code,
      String? message,
      T? data,
      String? traceId})
      : super(code, message, data);
}

class PageNumberBean {
  final int totalCount;
  final int totalPage;

  PageNumberBean(this.totalCount, this.totalPage);
}
