/*
 * 项目名:    x-framework
 * 包名
 * 文件名:    base_net_entity
 * 创建时间:  2020-01-18 on 15:09
 * 描述:
 *
 * @author   xueml
 */



abstract class BaseNetEntity<T> {
  int? code;
  String? message;

  BaseNetEntity(this.code, this.message, this.data);

  T? data;
}
