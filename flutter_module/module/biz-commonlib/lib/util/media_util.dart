import 'dart:math';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/rendering.dart';

class MediaUtil {
  Future<Uint8List> getCurrentImageData(RenderRepaintBoundary boundary,
      {pixelRatio}) async {
    ui.Image image = await boundary.toImage(pixelRatio: pixelRatio ?? 2);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    return Future.value(pngBytes);
  }

  static String fileName(String path) {
    final String suffix = path.substring(path.lastIndexOf('.'), path.length);
    final DateTime now = DateTime.now();
    final int code = Random().nextInt(900000) + 100000;
    return '${getMediaType(suffix)?.mediaMode.mediaModeStr}${now.year}${now.month.toString().padLeft(2, '0')}${now.millisecondsSinceEpoch}$code$suffix';
  }

  static MediaType? getMediaType(final String fileExt) {
    switch (fileExt.toLowerCase()) {
      case '.jpg':
      case '.jpeg':
      case '.jpe':
        return MediaType(MediaMode.image, 'jpeg');
      case '.png':
        return MediaType(MediaMode.image, 'png');
      case '.bmp':
        return MediaType(MediaMode.image, 'bmp');
      case '.gif':
        return MediaType(MediaMode.image, 'gif');
      case '.json':
        return MediaType(MediaMode.application, 'json');
      case '.svg':
      case '.svgz':
        return MediaType(MediaMode.image, 'svg+xml');
      case '.mp3':
        return MediaType(MediaMode.audio, 'mpeg');
      case '.wav':
        return MediaType(MediaMode.audio, 'wav');
      case '.mp4':
        return MediaType(MediaMode.video, 'mp4');
      case '.mov':
        return MediaType(MediaMode.video, 'mov');
      case '.htm':
      case '.html':
        return MediaType(MediaMode.text, 'html');
      case '.css':
        return MediaType(MediaMode.text, 'css');
      case '.csv':
        return MediaType(MediaMode.text, 'csv');
      case '.txt':
      case '.text':
      case '.conf':
      case '.def':
      case '.log':
      case '.in':
        return MediaType(MediaMode.text, 'plain');
    }
    return null;
  }
}

class MediaType {
  MediaMode mediaMode;

  MediaType(this.mediaMode, this.type);

  String type;
}

enum MediaMode { image, video, text, audio, application }

extension MediaModeEx on MediaMode {
  String get mediaModeStr => _getStr();

  String _getStr() {
    switch (this) {
      case MediaMode.image:
        return 'image';
      case MediaMode.video:
        return 'video';
      case MediaMode.text:
        return 'text';
      case MediaMode.audio:
        return 'audio';
      case MediaMode.application:
        return 'application';
    }
  }
}
