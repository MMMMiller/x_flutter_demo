enum CompressType { Fhd, HalfFhd, OneThirdFhd, QuarterFhd, Thumbnail, Null }


extension CompressTypeEx on String {
  String  get fhd {
    return '${this}?x-oss-process=style/fhd';
  }
  String  get hFhd {
    return '${this}?x-oss-process=style/half_fhd';
  }
  String  get oFhd {
    return '${this}?x-oss-process=style/one_third_fhd';
  }
  String  get qFhd {
    return '${this}?x-oss-process=style/quarter_fhd';
  }
  String  get thumb {
    return '${this}?x-oss-process=style/thumbnail';
  }
}
