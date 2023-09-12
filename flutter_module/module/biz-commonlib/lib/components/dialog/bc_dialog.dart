import 'package:common_lib/components/dialog/bc_add_wechat_widget.dart';
import 'package:common_lib/components/dialog/bc_customer_label_widget.dart';
import 'package:common_lib/components/dialog/bc_dialog_confirm_widget.dart';
import 'package:common_lib/components/dialog/bc_tip_confirm_widget.dart';
import 'package:flutter/material.dart';

import 'bc_dialog_verification_widget.dart';

/// createTime: 2022/9/15 on 16:27
/// desc:
///
/// @author azhon
class BcDialog {
  static Future showCustomDialog(BuildContext context, Widget widget) {
    return showDialog(
      context: context,
      builder: (_) {
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: Dialog(
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: widget,
          ),
        );
      },
    );
  }

  static Future showConfirmDialog(BuildContext context, {Function? onConfirm}) {
    return showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: BcDialogConfirmWidget(
            onConfirm: onConfirm,
          ),
        );
      },
    );
  }

  static Future showVerificationDialog(BuildContext context, {Function? onConfirm}) {
    return showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: BcDialogVerificationWidget(
            title:const Text('开发者选项'),
            onConfirm: onConfirm,
          ),
        );
      },
    );
  }

  static Future<T?> showTipConfirmDialog<T>(
    BuildContext context, {
    String? title,
    String? content,
    Function? onConfirm,
    Function? onCancel,
    String? confirmText,
    String? cancelText, TextAlign? contentTextAlign,
  }) {
    return showDialog<T>(
      context: context,
      builder: (_) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: BcTipConfirmWidget(
            onConfirm: onConfirm,
            contentTextAlign:contentTextAlign,
            onCancel: onCancel,
            confirmText: confirmText,
            cancelText: cancelText,
            title: title,
            content: content,
          ),
        );
      },
    );
  }

  static Future showCustomerLabelDialog(
    BuildContext context, {
    List<CustomerLabelGroupEntity>? list,
    String? title,
    Function? onConfirm,
    String? confirmText,
    String? cancelText,
  }) {
    return showCustomDialog(
      context,
      BcCustomerLabelWidget(
        title: title,
        list: list,
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: onConfirm,
      ),
    );
  }

  static Future showAddWechatDialog(
    BuildContext context, {
    required String phone,
    ValueChanged<String>? onConfirm,
  }) {
    return showCustomDialog(
      context,
      BcAddWechatWidget(
        phone: phone,
        onConfirm: onConfirm,
      ),
    );
  }
  static Future showNoCancelDialog(
      BuildContext context, {
        String? title,
        String? content,
        Function? onConfirm,
        String? confirmText,
      }) {
    return showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: BcTipConfirmWidget(
            onConfirm: onConfirm,
            title: title,
            showCancel: false,
            actionFontSize: 14,
            content: content,
            confirmText: confirmText,
          ),
        );
      },
    );
  }
}
