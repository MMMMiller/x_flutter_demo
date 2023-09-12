import 'dart:io';
import 'package:common_lib/components/photo_view/video_viewer_widget.dart';
import 'package:common_lib/index.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:extended_image/extended_image.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import '../index.dart';

class PhotoView extends StatefulWidget {
  final List<String> urls;
  final int position;

  const PhotoView(
    this.urls,
    this.position, {
    super.key,
  });

  static Future show(
    BuildContext context,
    List<String> urls, {
    int position = 0,
  }) {
    return Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        pageBuilder: (context, animation, secondaryAnimation) {
          return PhotoView(urls, position);
        },
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return PhotoViewState();
  }
}

class PhotoViewState extends State<PhotoView> {
  late int currPosition;
  late PageController _controller;
  late BuildContext mContext;

  @override
  void initState() {
    super.initState();
    currPosition = widget.position;
    _controller = PageController(initialPage: currPosition);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mContext = context;
    return Material(
      color: Colors.black,
      child: Stack(
        children: [
          CommonClickWidget(
            singleClick: () {
              Navigator.of(context).pop();
            },
            child: PhotoViewGallery.builder(
              itemCount: widget.urls.length,
              scrollPhysics: const BouncingScrollPhysics(),
              pageController: _controller,
              builder: (_, index) {
                return _isVideo(widget.urls[index])
                    ? PhotoViewGalleryPageOptions.customChild(
                        disableGestures: true,
                        child: VideoViewerWidget(widget.urls[index]),
                      )
                    : PhotoViewGalleryPageOptions.customChild(
                        minScale: 1.0,
                        maxScale: 5.0,
                        child: GestureDetector(
                          onLongPress:(){
                            saveImage(context,saveEvent:(){
                              checkPermission((){
                                saveNetworkImg(widget.urls[index]);
                              });
                            });
                          },
                          child:_buildImage(index),
                        ),
                      );
              },
              onPageChanged: (page) {
                setState(() {
                  currPosition = page;
                });
              },
            ),
          ),
          _indicator(),
          if (_isVideo(widget.urls[currPosition]))
            Positioned(
              bottom: 16,
              left: 16,
              child: CommonClickWidget(
                singleClick: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.close,
                  size: 14,
                ),
              ),
            ),
        ],
      ),
    );
  }

  ExtendedImage _buildImage(int index) {
    final GestureConfig config = GestureConfig(
      inPageView: true,
      animationMaxScale: 5,
    );
    final String url = widget.urls[index];
    if (url.startsWith('http')) {
      return _extendedImageNetwork(url, config);
    } else if (url.startsWith('assets')) {
      return _extendedImageAsset(url, config);
    } else {
      return _extendedImageFile(url, config);
    }
  }

  ExtendedImage _extendedImageAsset(String url, GestureConfig config) {
    return ExtendedImage.asset(
      url,
      fit: BoxFit.contain,
      initGestureConfigHandler: (ExtendedImageState state) {
        return config;
      },
    );
  }

  ExtendedImage _extendedImageFile(String url, GestureConfig config) {
    return ExtendedImage.file(
      File(url),
      fit: BoxFit.contain,
      initGestureConfigHandler: (ExtendedImageState state) {
        return config;
      },
    );
  }

  ExtendedImage _extendedImageNetwork(String url, GestureConfig config) {
    return ExtendedImage.network(
      url,
      fit: BoxFit.contain,
      initGestureConfigHandler: (ExtendedImageState state) {
        return config;
      },
    );
  }

  Widget _indicator() {
    return Positioned(
      right: 16,
      bottom: 16,
      child: Text(
        '${currPosition + 1} / ${widget.urls.length}',
        style: const TextStyle(color: Colors.white, fontSize: 10),
      ),
    );
  }

  bool _isVideo(String url) {
    return url.endsWith('.mp4') ||
        url.endsWith('.avi') ||
        url.endsWith('.mov') ||
        url.endsWith('.flv') ||
        url.endsWith('.mpeg') ||
        url.endsWith('.rmvb');
  }

  // 动态申请权限，ios 要在info.plist 上面添加
  Future<bool> _requestPermission() async {
    late PermissionStatus status;
    // 1、读取系统权限的弹框
    if (Platform.isIOS) {
      status = await Permission.photosAddOnly.request();
    } else {
      status = await Permission.storage.request();
    }
    // 2、假如你点拒绝后，下次点击不会在出现系统权限的弹框（系统权限的弹框只会出现一次），
    // 这时候需要你自己写一个弹框，然后去打开app权限的页面
    if (status != PermissionStatus.granted) {
      await BcDialog.showTipConfirmDialog<bool>(
          context,
          content:'请前往手机设置开启存储权限',
          onConfirm: () async {
            Navigator.of(mContext).pop();
            await openAppSettings();
          },onCancel: (){
        Navigator.of(mContext).pop();
      });
      return false;
    } else {
      return true;
    }
  }

  // 保存图片的权限校验
  Future<void> checkPermission(Function() fun) async {
    final bool mark = await _requestPermission();
    if(mark) {
      fun.call();
    }
  }

  // 保存网络图片
  Future saveNetworkImg(String imgUrl) async {
    final response = await Dio()
        .get(imgUrl, options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 100);
    if (result['isSuccess']) {
      Toast.showToast('保存成功');
    } else {
      Toast.showToast('保存失败');
    }
  }

  // 保存gif动画
  saveGif(String imgUrl) async {
    final appDocDir = await getTemporaryDirectory();
    final String savePath = '${appDocDir.path}/temp.gif';
    final String fileUrl = imgUrl;
    await Dio().download(fileUrl, savePath);
    final result = await ImageGallerySaver.saveFile(savePath);
    if (result['isSuccess']) {
      Toast.showToast('保存成功');
    } else {
      Toast.showToast('保存失败');
    }
  }
}
