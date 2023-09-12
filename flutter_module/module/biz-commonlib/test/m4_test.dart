import 'package:sm_crypto/sm_crypto.dart';

///文件名:    m4_test
///创建时间:  2022/10/8 on 18:22
///描述:
///
///@author   xueml


void main(){
  String key = SM4.createHexKey(key: '33353832616665303634636666643533');
  String data = '15372009096';
  print('👇 ECB Encrypt Mode:');
  //String ebcDecryptData = SM4.decrypt(data: data, key: key);
  String encryptData = SM4.encrypt(data: data, key: '33353832616665303634636666643533');
  String deData = SM4.decrypt(data: '6e605e6dbecef40961b0155ca12056b1', key: '33353832616665303634636666643533');
  print('🔑 EBC DecryptData:\n $deData');
}