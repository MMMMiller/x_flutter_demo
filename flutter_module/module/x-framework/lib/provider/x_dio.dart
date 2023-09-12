/*
 * 项目名:    x_framework
 * 包名       provider
 * 文件名:    x_dio
 * 创建时间:  2020/9/18 on 4:31 PM
 * 描述:
 *
 * @author   xueml
 */

abstract class XDio {
  Future requestGet(String apiAddress, {Map<String, dynamic> requestParams});

  Future requestPost(String apiAddress, {Map<String, dynamic> requestParams});

  Future requestPostJson(String apiAddress, {requestData});

  Future requestDel(String apiAddress, {Map<String, dynamic> requestParams});

  Future requestPut(String apiAddress, {requestData});
}
