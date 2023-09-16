

/// createTime: 2022/10/13 on 14:39
/// desc:
///
/// @author xueml
class CmsEntityDelegate {
  ///源数据
  final Map<String, dynamic> data;

  ///数据源标识
  late int sourceHashCode;

  CmsEntityDelegate.create(this.data) {
    sourceHashCode = data.hashCode;
  }

  String get componentType => data['componentType'];

}

class CmsComponentType {
  static const banner = '1';
  static const imageNavi = '2';
  static const iconNavi = '3';
  static const hotArea = '4';
  static const floatIcon = '5';
  static const blank = '6';
  static const search = '7';
  static const productRecommend = '20';
  static const servicePack = '21';
  static const categoryNavi = '22';
}

class CmsLinkType {
  static const product = 'product';
  static const package = 'package';
  static const web = 'web';
  static const productGroup = 'productGroup';
  static const productSendRecord = 'productSendRecord';
  static const preSales = 'preSales';
  static const page = 'page';
  static const afterSales = 'afterSales';
}
