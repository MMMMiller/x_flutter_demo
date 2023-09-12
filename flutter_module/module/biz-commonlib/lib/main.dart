import 'package:common_lib/base/src/base_module_provider.dart';
import 'package:common_lib/common/request.dart';
import 'package:common_lib/common/router/biz_module_route.dart';
import 'package:common_lib/index.dart';
import 'package:common_lib/persistence/src/provider_service.dart';
import 'package:common_lib/service/package_info/package_info_service.dart';

class BizCommonModule extends BaseModule {
  BizCommonModule() {
    init();
  }

  void init() {
    BizModuleRoute.initRoute();
    ProviderService.addProvider(
      BizCommonRequest.key,
      BizCommonProviderBuilder(),
    );
    packInfoService.init();
  }

  @override
  IModuleProvider get iModuleProvider => BizCommonModuleProvider();
}

BizCommonModule userModule = ModuleManager.getM<BizCommonModule>();

BizCommonModuleProvider get bizCommonModuleProvider =>
    userModule.iModuleProvider as BizCommonModuleProvider;

class CommonModuleMessage extends IModuleMessage {
  final Env env;
  CommonModuleMessage(this.env);
}
class ChangeTabIndexMessageV2 extends IModuleMessage {
  final int index;
  ChangeTabIndexMessageV2(this.index);
}
class BizCommonModuleProvider extends IModuleProvider {}


