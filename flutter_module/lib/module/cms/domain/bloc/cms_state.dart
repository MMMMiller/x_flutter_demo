part of 'cms_bloc.dart';

abstract class CmsState {
  final CmsEntity? entity;

  CmsState(this.entity);

  String? get id => entity?.pageComponent?.id;

  String? get name => entity?.name;

  String? get backgroundColor =>
      entity?.pageComponent?.pageSetting?.backgroundColor;

  List<dynamic>? get components => entity?.pageComponent?.data;

  bool get needLogin => entity?.isLogin == 1;

  ///查找组件
  dynamic _findComponent(String component) {
    final list = components
        ?.where(
          (element) => element['componentType'] == component,
        )
        .toList();
    if (isEmpty(list)) {
      return null;
    }
    return list!.first;
  }
}

class CmsInitialState extends CmsState {
  CmsInitialState(super.entity);
}
