import 'package:common_lib/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

/// createTime: 2022/10/13 on 16:58
/// desc:
///
/// @author azhon
class BannerWidget extends BaseStatelessWidget {
  final double height;
  final bool autoplay;
  final double? scale;
  final double radius;
  final double viewportFraction;
  final SwiperPlugin? pagination;
  final List<BannerItem> item;
  final ValueChanged<int>? itemClick;
  final Duration duration;

  BannerWidget({
    this.height = 200,
    this.autoplay = true,
    this.scale,
    this.radius = 0,
    this.viewportFraction = 1.0,
    this.pagination,
    this.item = const [],
    this.itemClick,
    this.duration = const Duration(seconds: 4),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (isEmpty(item)) {
      return sizedBox();
    }
    return Container(
      height: height,
      width: double.infinity,
      child: item.length <= 1
          ? _buildItem(item.first, 0)
          : Swiper(
              itemCount: item.length,
              autoplay: autoplay,
              viewportFraction: viewportFraction,
              scale: scale,
              pagination: pagination,
              autoplayDelay: duration.inMilliseconds,
              itemBuilder: (_, index) {
                return _buildItem(item[index], index);
              },
            ),
    );
  }

  Widget _buildItem(BannerItem item, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(sRadius(radius)),
      child: CommonClickWidget(
        onTap: () => itemClick?.call(index),
        child: CommonImage(
          network: item.imgUrl ?? '',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class BannerItem {
  String? imgUrl;
  String? linkTarget;
  String? linkType;
  int? productSubType;
  String? title;
  int? shelfEndTime;
  int? shelfStartTime;
  // List<BannerItemList>? list;

  BannerItem.fromJson(Map<String, dynamic> map) {
    imgUrl = map['imgUrl'];
    linkTarget = map['linkTarget'];
    linkType = map['linkType'];
    shelfEndTime = map['shelfEndTime'];
    productSubType = map['productSubType'];
    title = map['title'];
    shelfStartTime = map['shelfStartTime'];
    // list = map['list'];
  }
}
class BannerItemList {
  BannerItemAffiliateJson? affiliateJson;
  BannerItemList.fromJson(Map<String, dynamic> map) {
    affiliateJson =  map['affiliateJson'];
  }
}
class BannerItemAffiliateJson {
  String? coverUrl;
  String? linkExternal;
  String? linkDescribe;
  String? suggest;
  int? isAffix;

  BannerItemAffiliateJson.fromJson(Map<String, dynamic> map) {
    coverUrl = map['coverUrl'];
    linkExternal = map['linkExternal'];
    linkDescribe = map['linkDescribe'];
    suggest = map['suggest'];
    isAffix = map['isAffix'];
  }
}
