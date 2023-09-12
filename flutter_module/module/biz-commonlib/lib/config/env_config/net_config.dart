import 'package:common_lib/index.dart';
abstract class NetConfig {
  Map<Env,NetInfo> get netConfigs;
  NetInfo get currentNetInfo => _getCurrentNetInfo();

  NetInfo _getCurrentNetInfo() {
    if(isNotEmpty(netConfigs) && netConfigs.containsKey(Env.env)){
      return netConfigs[Env.env]!;
    }else{
      throw Exception('请正确配置netConfigs');
    }
  }
}

class NetInfo {
  String baseUrl;
  String h5BaseUrl;
  String? deployUrl; // 部署路径
  bool isProxy;
  String? proxyIp;
  Map<String, String>? multiUrl;

  NetInfo({
    required this.baseUrl,
    required this.h5BaseUrl,
    required this.isProxy,
    this.proxyIp,
    this.deployUrl,
    this.multiUrl,
  });
}
