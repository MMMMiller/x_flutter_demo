import 'dart:typed_data';

class ByteUtil {
  ///ser256(p): serializes the integer p as a 32-byte sequence, most significant
  ///[p] Uint8List
  ///return 32 byte sequence
  static Uint8List ser256(Uint8List? p) {
    int length = 32;
    if (p == null) return Uint8List(length);
    if (p.length == length) {
      return Uint8List.fromList(p);

      ///
    } else if (p.length > length) {
      return p.sublist(p.length - length);

      ///
    } else {
      int diff = length - p.length;
      Uint8List ret = Uint8List(length);
      int pIndex = 0;
      for (int i = diff; i < length; i++) {
        ret[i] = p[pIndex];
        pIndex++;
      }
      return ret;
    }
  }

  static Uint8List ser32(int i) {
    Uint8List ser = Uint8List(4);
    ser[0] = (i >> 24);
    ser[1] = (i >> 16);
    ser[2] = (i >> 8);
    ser[3] = (i);
    return ser;
  }

  static Uint8List merge(List<Uint8List> list) {
    List<int> result = [];
    for (var element in list) {
      result.addAll(element);
    }
    return Uint8List.fromList(result);
  }
}
