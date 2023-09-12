import 'package:common_lib/index.dart';
import 'package:flutter/material.dart';

class TextPreView extends StatefulWidget {
  final String text;

  const TextPreView(
    this.text,{
    super.key,
  });

  static Future show(
    BuildContext context,String content,) {
    return Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        pageBuilder: (context, animation, secondaryAnimation) {
          return TextPreView(content);
        },
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return TextPreViewState();
  }
}

class TextPreViewState extends State<TextPreView> {
  late String content;
  late BuildContext mContext;

  @override
  void initState() {
    super.initState();
    content = widget.text;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mContext = context;
    return Material(
      color: Colors.white,
      child:SafeArea(
        child: Stack(
          children: [
            Positioned(
                top:0,
                bottom:0,
                left:0,
                right:0,
                child:CommonClickWidget(
              singleClick: () {
                Navigator.of(context).pop();
              },
              child:Center(
                child:SingleChildScrollView(
                  child:Padding(
                    padding:const EdgeInsets.symmetric(horizontal:24),
                    child:CommonText(
                      content,
                      fontSize: 16,
                      color: ThemeUtil.getBody2(context),
                    ),
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
