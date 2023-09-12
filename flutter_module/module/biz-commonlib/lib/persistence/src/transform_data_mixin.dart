mixin TransformDataMixin {
  String listTransToString(List<int> mList) {
    String s = '';
    for (var value in mList) {
      s = '$s$value,';
    }
    return s.substring(0, s.length - 1);
  }
}
