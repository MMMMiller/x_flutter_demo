import 'dart:typed_data';

class HexUtil {
  ///
  static Uint8List decode(String? hex) {
    if (hex == null) return Uint8List(0);
    if (hex.startsWith('0x')) {
      return decode(hex.substring(2));
    }
    var result = Uint8List(hex.length ~/ 2);
    for (var i = 0; i < hex.length; i += 2) {
      var num = hex.substring(i, i + 2);
      var byte = int.parse(num, radix: 16);
      result[i ~/ 2] = byte;
    }
    return result;
  }

  static String encode0x(Uint8List? bytes) {
    return '0x${encode(bytes)}';
  }

  static String encode(Uint8List? bytes) {
    if (bytes == null) return '';
    var result = StringBuffer();
    for (var i = 0; i < bytes.lengthInBytes; i++) {
      var part = bytes[i];
      result.write('${part < 16 ? '0' : ''}${part.toRadixString(16)}');
    }
    return result.toString();
  }
}
