
import 'package:common_lib/index.dart';
import 'package:flutter_module/module/cms/domain/model/cms_entity.dart';
import 'package:flutter_module/module/cms/domain/request/get_cms_request.dart';


part 'cms_event.dart';

part 'cms_state.dart';

class CmsBloc extends BaseLoadBloc<CmsEvent, CmsState> {
  String? _id;

  CmsBloc(ViewToBloc view) : super(view, CmsInitialState(null));

  void setId(String id) {
    _id = id;
  }

  void init() {
    add(InitCmsEvent());
  }

  void refresh() {
    add(RefreshCmsEvent());
  }
}
