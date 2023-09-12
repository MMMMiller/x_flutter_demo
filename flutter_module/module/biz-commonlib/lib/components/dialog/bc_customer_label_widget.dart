///文件名:    bc_dialog_confirm_widget
///创建时间:  2022/9/16 on 16:43
///描述:
///
///@author   xueml

import 'package:common_lib/index.dart';
import 'package:common_lib/service/router/router_util.dart';
import 'package:flutter/material.dart';

class BcCustomerLabelWidget extends StatefulWidget {
  final String? title;
  final List<CustomerLabelGroupEntity>? list;
  final Function? onCancel;
  final Function? onConfirm;
  final String? confirmText;
  final String? cancelText;

  const BcCustomerLabelWidget({
    this.list,
    this.title,
    this.confirmText,
    this.cancelText,
    this.onCancel,
    this.onConfirm,
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return BcCustomerLabelWidgetState();
  }
}

class BcCustomerLabelWidgetState extends BaseState<BcCustomerLabelWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth - sWidth(32),
      constraints: BoxConstraints(
        maxHeight: sWidth(380),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(sRadius(8)),
          topRight: Radius.circular(sRadius(8)),
        ),
      ),
      child: Column(
        children: [
          sizedBox(height: 24),
          CommonText(
            widget.title ?? '客户标签',
            fontSize: 14,
            color: Colors.black,
          ),
          sizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: (widget.list ?? []).map(_dialogItem).toList(),
              ),
            ),
          ),
          Divider(
            color: Colors.black.withOpacity(0.1),
            height: sWidth(1),
          ),
          SizedBox(
            height: sWidth(56),
            child: Row(
              children: [
                Expanded(
                  child: CommonClickWidget(
                    onTap: () => RouterUtil.instance.pop(),
                    child: Center(
                      child: CommonText(
                        widget.cancelText ?? '取消',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: ColorsConfig.ff4e5969,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: sWidth(1),
                  height: double.infinity,
                  color: Colors.black.withOpacity(0.1),
                ),
                Expanded(
                  child: CommonClickWidget(
                    onTap: () => widget.onConfirm?.call(),
                    child: Center(
                      child: CommonText(
                        widget.confirmText ?? '确定',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: ColorsConfig.ff1966ff,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dialogItem(CustomerLabelGroupEntity entity) {
    return Padding(
      padding: only(left: 12, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: sWidth(2),
                height: sWidth(14),
                color: ColorsConfig.ff1966ff,
                margin: only(right: 8),
              ),
              CommonText(
                entity.name ?? '',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ColorsConfig.ff1d2129,
              ),
            ],
          ),
          sizedBox(height: 12),
          Wrap(
            spacing: sWidth(16),
            runSpacing: sWidth(10),
            children: (entity.labelList ?? []).map((e) {
              return CommonClickWidget(
                onTap: () {
                  setState(() {
                    e.check = !(e.check ?? false);
                  });
                },
                child: Container(
                  padding: symmetric(2, 10),
                  decoration: BoxDecoration(
                    color: (e.check ?? false)
                        ? ColorsConfig.ff1966ff
                        : ColorsConfig.fff2f3f5,
                    borderRadius: BorderRadius.circular(sRadius(100)),
                  ),
                  child: CommonText(
                    e.name ?? '',
                    color: (e.check ?? false)
                        ? Colors.white
                        : ColorsConfig.ff4e5969,
                    fontSize: 12,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class CustomerLabelGroupEntity {
  double? customerSum;
  String? id;
  List<CustomerLabelLabelList>? labelList;
  String? name;

  CustomerLabelGroupEntity({
    this.customerSum,
    this.id,
    this.labelList,
    this.name,
  });

  CustomerLabelGroupEntity.fromJson(dynamic map) {
    customerSum = map['customerSum'];
    id = map['id'];
    name = map['name'];
    labelList = (map['labelList'] as List<dynamic>)
        .map(CustomerLabelLabelList.fromJson)
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customerSum'] = customerSum;
    data['id'] = id;
    data['name'] = name;
    data['labelList'] = labelList?.map((v) => v.toJson()).toList();
    return data;
  }
}

class CustomerLabelLabelList {
  double? customerCount;
  String? groupId;
  String? id;
  String? name;
  bool? check;

  CustomerLabelLabelList({
    this.customerCount,
    this.groupId,
    this.id,
    this.name,
  });

  CustomerLabelLabelList.fromJson(dynamic map) {
    customerCount = map['customerCount'];
    groupId = map['groupId'];
    id = map['id'];
    name = map['name'];
    check = map['check'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customerCount'] = customerCount;
    data['groupId'] = groupId;
    data['id'] = id;
    data['name'] = name;
    data['check'] = check;
    return data;
  }
}
