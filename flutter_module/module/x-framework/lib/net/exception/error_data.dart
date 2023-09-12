
class ErrorData {
  int? errCode;

  ErrorData({this.errCode, this.errMsg});

  String? errMsg;

  String toString(){return 'errCode=$errCode; errMsg=$errMsg';}
}
