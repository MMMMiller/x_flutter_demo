import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

import 'navigation_bar.dart';
import 'search_field.dart';

class SearchNavigationBar extends StatelessWidget {
  final FocusNode focusNode;
  final String placeholder;
  final TextEditingController controller;
  final Function(String query) onSubmitted;
  final Function(String text) onChanged;

  SearchNavigationBar({
    Key? key,
    required this.focusNode,
    required this.placeholder,
    required this.controller,
    required this.onSubmitted,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationBarContainer(
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 15),
              child: SearchField(
                focusNode: focusNode,
                placeholder: placeholder,
                controller: controller,
                onChanged: onChanged,
                onSubmitted: onSubmitted,
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: GestureDetector(
              onTap: () {
                focusNode.unfocus();
                BoostNavigator.instance.pop();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                color: Colors.transparent,
                height: 30,
                alignment: Alignment.center,
                child: Text(
                  '取消',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
