///文件名:    desensitization_phone
///创建时间:  2022/10/10 on 15:57
///描述:
///
///@author   xueml

String desensitization(String phone) {
  if (phone.length > 10) {
    return '${phone.substring(0, 3)}****${phone.substring(phone.length - 4, phone.length)}';
  }
  return phone;
}
