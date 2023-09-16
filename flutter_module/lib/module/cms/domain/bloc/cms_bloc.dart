
import 'package:flutter_module/common/service/event_extension.dart';
import 'package:flutter_module/module/cms/domain/model/cms_entity.dart';
import 'package:flutter_module/module/cms/domain/request/cms_request.dart';
import 'package:todo_flutter/todo_flutter.dart';


part 'cms_event.dart';

part 'cms_state.dart';

class CmsBloc extends BaseBloc<CmsEvent, CmsState> {
  String? _id;

  CmsBloc() : super( CmsInitialState(null));

  void setId(String id) {
    _id = id;
  }

  void init() {
    add(InitCmsEvent());
  }
}
