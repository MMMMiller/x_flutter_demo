import 'package:common_lib/config/color_config.dart';
import 'package:flutter/material.dart';

class TabBarLabelIndicator extends Decoration {
  /// Create an underline style selected tab indicator.
  ///
  /// The [borderSide] and [insets] arguments must not be null.
  const TabBarLabelIndicator({
    this.borderSide = const BorderSide(
      width: 4,
      color: ColorsConfig.ff5e94ff,
    ),
    this.insets = EdgeInsets.zero,
    this.gradient = const LinearGradient(
      colors: [ColorsConfig.ff5e94ff, ColorsConfig.ff1966ff],
    ),
    this.width = 16,
  });

  /// The color and weight of the horizontal line drawn below the selected tab.
  final BorderSide borderSide;
  final LinearGradient gradient;
  final double width;

  /// Locates the selected tab's underline relative to the tab's boundary.
  ///
  /// The [TabBar.indicatorSize] property can be used to define the tab
  /// indicator's bounds in terms of its (centered) tab widget with
  /// [TabBarIndicatorSize.label], or the entire tab with
  /// [TabBarIndicatorSize.tab].
  final EdgeInsetsGeometry insets;

  @override
  Decoration lerpFrom(Decoration? a, double t) {
    if (a is TabBarLabelIndicator) {
      return TabBarLabelIndicator(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        insets: EdgeInsetsGeometry.lerp(a.insets, insets, t)!,
      );
    }
    return super.lerpFrom(a, t)!;
  }

  @override
  Decoration lerpTo(Decoration? b, double t) {
    if (b is TabBarLabelIndicator) {
      return TabBarLabelIndicator(
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
        insets: EdgeInsetsGeometry.lerp(insets, b.insets, t)!,
      );
    }
    return super.lerpTo(b, t)!;
  }

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _UnderlinePainter(this);
  }

  RRect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    final Rect indicator = insets.resolve(textDirection).deflateRect(rect);

    //取中间坐标
    final double cw = (indicator.left + indicator.right) / 2;
    final Rect indicatorRect = Rect.fromLTWH(
      cw - width / 2,
      indicator.bottom - 5,
      width,
      borderSide.width,
    );
    return RRect.fromRectAndRadius(
      indicatorRect,
      Radius.circular(borderSide.width / 2),
    );
  }

  @override
  Path getClipPath(Rect rect, TextDirection textDirection) {
    return Path()..addRRect(_indicatorRectFor(rect, textDirection));
  }
}

class _UnderlinePainter extends BoxPainter {
  final TabBarLabelIndicator decoration;

  _UnderlinePainter(this.decoration);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = offset & configuration.size!;
    final TextDirection textDirection = configuration.textDirection!;
    final RRect indicator = decoration._indicatorRectFor(rect, textDirection);
    final Paint paint = decoration.borderSide.toPaint()
      ..strokeCap = StrokeCap.square
      ..shader = decoration.gradient.createShader(rect);
    canvas.drawRRect(indicator, paint);
  }
}
