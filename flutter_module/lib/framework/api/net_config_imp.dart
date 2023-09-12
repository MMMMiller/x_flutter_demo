import 'package:common_lib/index.dart';

class NetConfigImp extends NetConfig {
  final bool isProxy;
  final String proxyIp;

  NetConfigImp({this.isProxy = false, this.proxyIp = ''});

  @override
  Map<Env, NetInfo> get netConfigs => {
        Env.dev: NetInfo(
          baseUrl: 'http://demo.dev.beicaizs.com',
          h5BaseUrl: 'https://demo.dev.beicaizs.com',
          isProxy: isProxy,
          deployUrl: '/toc',
          proxyIp: proxyIp,
        ),
        Env.pre: NetInfo(
          baseUrl: 'https://demo.beta.beicaizs.com',
          h5BaseUrl: 'https://demo.beta.beicaizs.com',
          deployUrl: '/toc',
          isProxy: isProxy,
          proxyIp: proxyIp,
        ),
        Env.release: NetInfo(
          baseUrl: 'https://ss.beicaizs.com',
          h5BaseUrl: 'https://ss.beicaizs.com',
          isProxy: isProxy,
          deployUrl: '/toc',
          proxyIp: proxyIp,
        ),
        Env.test: NetInfo(
          baseUrl: 'http://demo.test.beicaizs.com',
          h5BaseUrl: 'https://demo.test.beicaizs.com',
          deployUrl: '/toc',
          isProxy: isProxy,
          proxyIp: proxyIp,
        ),
      };
}
