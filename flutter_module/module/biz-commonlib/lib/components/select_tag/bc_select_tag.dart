///文件名:    bc_select_tag
///创建时间:  2022/9/23 on 15:59
///描述:
///
///@author   xueml

import 'package:common_lib/components/dialog/bc_customer_label_widget.dart';
import 'package:common_lib/service/multi_data_change/view/bc_bloc_multi_check_build.dart';
import 'package:flutter/material.dart';
import 'package:common_lib/index.dart';

typedef SelectTagCallback = void Function(
  List<CustomerLabelLabelList> selectList,
);

class BcSelectTagWidget extends StatefulWidget {
  final List<CustomerLabelGroupEntity> list;
  final SelectTagCallback? selectTagCallback;

  const BcSelectTagWidget({
    required this.list,
    this.selectTagCallback,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => BcSelectTagWidgetState();
}

class BcSelectTagWidgetState extends BaseState<BcSelectTagWidget> {
  BcMultiCheckBloc<CustomerLabelLabelList> selectDataState =
      BcMultiCheckBloc<CustomerLabelLabelList>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.list.map(_dialogItem).toList(),
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
          BcMultiBlocCheckBuild<CustomerLabelLabelList>(
            builder: (_, state) {
              return Wrap(
                spacing: sWidth(16),
                runSpacing: sWidth(10),
                children: (entity.labelList ?? []).map((e) {
                  final indexWhere = state.checkList
                      .indexWhere((element) => element.id == e.id);
                  final bool isCheck = indexWhere != -1;
                  return CommonClickWidget(
                    onTap: () {
                      if (isCheck) {
                        selectDataState
                            .removeValue(state.checkList[indexWhere]);
                      } else {
                        selectDataState.addValue(e);
                      }
                      _changeCallback();
                    },
                    child: Container(
                      padding: symmetric(2, 10),
                      decoration: BoxDecoration(
                        color: isCheck
                            ? ColorsConfig.ff1966ff
                            : ColorsConfig.fff2f3f5,
                        borderRadius: BorderRadius.circular(sRadius(100)),
                      ),
                      child: CommonText(
                        e.name ?? '',
                        color: isCheck ? Colors.white : ColorsConfig.ff4e5969,
                        fontSize: 12,
                      ),
                    ),
                  );
                }).toList(),
              );
            },
            bloc: selectDataState,
          ),
        ],
      ),
    );
  }

  void changeCheck(List<CustomerLabelLabelList> dataList) {
    selectDataState.changeData(dataList);
  }

  void _changeCallback() {
    widget.selectTagCallback?.call(
      selectDataState.state.checkList,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
