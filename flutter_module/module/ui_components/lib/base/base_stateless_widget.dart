import 'package:flutter/material.dart';
import 'package:ui_components/base/ui_adapter.dart';
import 'package:ui_components/base/ui_widget.dart';

abstract class BaseStatelessWidget extends StatelessWidget
    with UIAdapter, UIWidget {
  BaseStatelessWidget({Key? key}) : super(key: key);
}
