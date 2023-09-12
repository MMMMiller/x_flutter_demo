import 'package:flutter/material.dart';

typedef StarChangeCallback = void Function(double star);

class RatingBarWidget extends StatefulWidget {
  ///当前星级
  final double rating;

  ///总星数
  final int ratingNum;

  ///星星大小
  final Size size;

  ///星星间隙
  final double space;

  ///仅展示
  final bool showOnly;

  ///改变回调
  final StarChangeCallback? callback;
  final String defaultImg;
  final String starImg;

  RatingBarWidget(this.defaultImg, this.starImg,
      {Key? key,
      this.rating = 5,
      this.ratingNum = 5,
      this.space = 4,
      this.showOnly = false,
      this.callback,
      this.size = const Size(24, 24)})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RatingBarState();
  }
}

class RatingBarState extends State<RatingBarWidget> {
  late double _rating;

  @override
  void initState() {
    super.initState();
    _rating = _convertRating(widget.rating);
    if (_rating > widget.ratingNum) _rating = widget.ratingNum.toDouble();
  }

  double _convertRating(double rating) {
    double decimal = rating * 10 % 10;
    if (decimal == 5) return rating;
    if (decimal < 5) {
      return rating.floorToDouble();
    } else {
      return rating.floorToDouble() + 0.5;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.deferToChild,
      onPointerDown: (PointerDownEvent event) {
        _onMove(event.localPosition);
      },
      onPointerMove: (PointerMoveEvent event) {
        _onMove(event.localPosition);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: _getStar(widget.defaultImg),
              ),
              _star(),
            ],
          )
        ],
      ),
    );
  }

  Widget _star() {
    return ClipRect(
      clipper: _StarClipper(_rating, widget.size, widget.space),
      child: Row(
        children: _getStar(widget.starImg),
      ),
    );
  }

  List<Widget> _getStar(String img) {
    List<Widget> widgets = [];
    for (int i = 0; i < widget.ratingNum; i++) {
      widgets.add(
        Container(
          width: widget.size.width,
          height: widget.size.height,
          margin: EdgeInsets.only(
              right: i == widget.ratingNum - 1 ? 0.0 : widget.space),
          child: Image.asset(img),
        ),
      );
    }
    return widgets;
  }

  _onMove(Offset offset) {
    if (widget.showOnly) return;
    //总宽度
    double width = widget.ratingNum * widget.size.width +
        (widget.ratingNum - 1) * widget.space;
    //触摸位置占总宽度的百分比
    double percent = offset.dx / width;
    if (percent <= 0) percent = 0;
    if (percent > 1) percent = 1;
    String value = (percent * widget.ratingNum).toStringAsFixed(1);
    double count = double.parse(value);
    setState(() {
      _rating = _calcStars(count);
      widget.callback?.call(_rating);
    });
  }

  double _calcStars(double count) {
    double decimal = count * 10 % 10;
    if (0 < decimal && decimal < 5) {
      return count.floor() + 0.5;
    } else if (decimal > 5) {
      return count.ceilToDouble();
    }
    if (count == 0) {
      return 0.5;
    }
    return count;
  }
}

class _StarClipper extends CustomClipper<Rect> {
  final double _rating;
  final double space;
  final Size size;
  late double clipWidth;

  _StarClipper(this._rating, this.size, this.space) {
    ///再加上间隙
    double spaceWidth = (_rating.ceil() - 1) * space;
    clipWidth = _rating * size.width + spaceWidth;
  }

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, clipWidth, size.height);
  }

  @override
  bool shouldReclip(_StarClipper oldClipper) {
    return clipWidth != oldClipper.clipWidth;
  }
}
