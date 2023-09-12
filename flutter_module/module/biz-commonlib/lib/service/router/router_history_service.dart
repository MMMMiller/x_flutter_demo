import 'dart:collection';

/// createTime: 2022/8/30 on 11:41
/// desc:
///
/// @author azhon
class RouterHistoryService {
  final Queue<String> _queue = Queue();

  factory RouterHistoryService() => _getInstance();

  RouterHistoryService._internal();

  static RouterHistoryService get instance => _getInstance();
  static RouterHistoryService? _instance;

  static RouterHistoryService _getInstance() {
    _instance ??= RouterHistoryService._internal();
    return _instance!;
  }

  void push(String route) {
    _queue.add(route);
  }

  void replace(String newRoute, String oldRoute) {
    pop(oldRoute);
    push(newRoute);
  }

  void pop(String route) {
    _queue.removeLast();
  }

  ///获取栈底路由
  String get firstRoute => _queue.first;

  ///获取栈顶路由
  String get lastRoute => _queue.last;

  ///栈中是否存在当前[route]路由
  bool exist(String route) => _queue.contains(route);

  ///获取当前[route]路由存在多少个
  int count(String route) {
    return _queue.where((element) => element == route).length;
  }

  @override
  String toString() {
    return _queue.join(' -> ');
  }
}
