import 'package:flutter/material.dart';
import 'package:ui_components/base/ui_adapter.dart';
import 'package:ui_components/base/ui_widget.dart';

abstract class BaseUIState<T extends StatefulWidget> extends State<T>
    with UIAdapter, UIWidget {}
