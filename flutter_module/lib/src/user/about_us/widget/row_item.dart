import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_module/common/widgets/common_container.dart';
import 'package:flutter_module/config/util/colors_config.dart';
import 'package:todo_flutter/todo_flutter.dart';

Widget renderRowItem({
  required String title,
  String? icon,
  String? desc,
  Widget? rightIcon,
  required Function click,
  bool showBorder = true,
}) {
  return CommonClickWidget(
    onTap: () {
      click.call();
    },
    child: ColoredBox(
      color: Colors.white,
      child: CommonContainer(
        height: 44,
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
        border: Border(
            bottom: BorderSide(
                width: 1,
                color: showBorder ? ColorsConfig.ededed : Colors.white)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null) ...[
              CommonImage(
                asset: icon,
                width: 20,
                height: 24,
              ),
              const SizedBox(width: 14),
            ],
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    title,
                    color: ColorsConfig.ff333333,
                    fontSize: 14,
                  ),
                  if (desc != null)
                    Container(
                      padding: const EdgeInsets.only(right: 8),
                      constraints: const BoxConstraints(maxWidth: 200),
                      child: CommonText(desc,
                          maxLines: 1,
                          fontWeight: FontWeight.w400,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 14, color: ColorsConfig.ff666666),
                    ),
                ],
              ),
            ),
            rightIcon ?? const Icon(
              Icons.arrow_right,
              color: ColorsConfig.ff999999,
              size: 14 ,
            )
          ],
        ),
      ),
    ),
  );
}
