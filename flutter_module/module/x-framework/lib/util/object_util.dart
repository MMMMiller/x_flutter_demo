import 'dart:convert';

/// Returns true if the string is null or 0-length.
bool isEmptyString(String? str) {
  return str == null || str.isEmpty;
}

/// Returns true if the list is null or 0-length.
bool isEmptyList(List? list) {
  return list == null || list.isEmpty;
}

/// Returns true if there is no key/value pair in the map.
bool isEmptyMap(Map? map) {
  return map == null || map.isEmpty;
}

/// Returns true  String or List or Map is empty.
bool isEmpty(Object? object) {
  if (object == null) return true;
  if (object is String && object.isEmpty) {
    return true;
  } else if (object is List && object.isEmpty) {
    return true;
  } else if (object is Map && object.isEmpty) {
    return true;
  }
  return false;
}

/// Returns true String or List or Map is not empty.
bool isNotEmpty(Object? object) {
  return !isEmpty(object);
}

class ObjectUtil {
  /// Returns true Two List Is Equal.
  static bool twoListIsEqual(List? listA, List? listB) {
    if (listA == listB) return true;
    if (listA == null || listB == null) return false;
    int length = listA.length;
    if (length != listB.length) return false;
    for (int i = 0; i < length; i++) {
      if (!listA.contains(listB[i])) {
        return false;
      }
    }
    return true;
  }

  /*
  * Base64加密
  */
  static String encodeBase64(String data) {
    var content = utf8.encode(data);
    var digest = base64Encode(content);
    return digest;
  }

  /*
  * Base64解密
  */
  static String decodeBase64(String data) {
    return String.fromCharCodes(base64Decode(data));
  }
}
