import 'package:common_lib/index.dart';

abstract class ListRefreshProvider<T> extends BaseRequest<List<T>> {

  final RequestBean mRequestBean;

  ListRefreshProvider(this.mRequestBean);

  @override
  RequestBean get requestBean => mRequestBean;
}
