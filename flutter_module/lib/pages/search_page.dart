import 'package:common_lib/components/index.dart';
import 'package:common_lib/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_module/domain/bloc/cms_bloc.dart';
import 'package:flutter_module/domain/model/cms_entity_delegate.dart';
import 'package:flutter_module/pages/widgets/navigation_bar.dart';
import 'package:flutter_module/pages/widgets/search_navigation_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends BaseState<SearchPage>  with CmsWidgets{
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  CmsBloc get _bloc => getBc<CmsBloc>();

  @override
  void initState() {
    /// 延迟弹出键盘，避免Flutter渲染异常抖动
    Future.delayed(Duration(milliseconds: 800), (){
      if (mounted) {
        focusNode.requestFocus();
      }
    });

    injectBloc(
      CmsBloc(this)
        ..setId( '')
        ..init(),);

    super.initState();
  }

  @override
  void dispose() {
    print('搜索页已释放');

    focusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          ControllerView(
            child: Container(
              color: Colors.transparent,
              child: GestureDetector(
                onTap: (){
                  BoostNavigator.instance
                      .push("SearchResultPage", arguments: {"a": "a", "b": "a"});
                },
                child: SizedBox(
                  width: 100,
                  height: 40,
                  child: Container(
                    color: Colors.purple,
                  ),
                ),
              ),
            ),
          ),
          SearchNavigationBar(
            focusNode: focusNode,
            controller: controller,
            placeholder: "输入你想搜索的东东或者西西",
            onSubmitted: (query) {
              print('搜索 :${query.trim()}');
            },
            onChanged: (text) {
              print('输入文字 :$text');
            },
          ),
          CmsBlocBuilder(
            cmsBloc: _bloc,
            builder: (_, state) {
              return BlocLoadContainer(
                loadBloc: _bloc.loadBloc,
                reload: _bloc.init,
                child: Container(
                  height: double.infinity,
                  color: ColorUtil.fromHex(state.backgroundColor),
                  child: SingleChildScrollView(
                    child: createWidget(state),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class CmsBlocBuilder extends BaseStatelessWidget {
  final CmsBloc cmsBloc;
  final BlocWidgetBuilder<CmsState> builder;

  CmsBlocBuilder({
    required this.cmsBloc,
    required this.builder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CmsBloc, CmsState>(
      bloc: cmsBloc,
      builder: builder,
    );
  }
}

mixin CmsWidgets {
  Widget createWidget(CmsState state) {
    if (isEmptyList(state.components)) {
      return const SizedBox.shrink();
    }
    return Column(
      children: state.components!.map(_renderComponent).toList().cast<Widget>(),
    );
  }

  Widget _renderComponent(dynamic data) {
    final CmsEntityDelegate delegate = CmsEntityDelegate.create(data);
    switch (delegate.componentType) {
      case CmsComponentType.banner:
        return Text('CmsComponentType.banner');
      case CmsComponentType.imageNavi:
        return Text('CmsComponentType.banner');
      case CmsComponentType.iconNavi:
        return Text('CmsComponentType.banner');
      case CmsComponentType.hotArea:
        return Text('CmsComponentType.banner');
      case CmsComponentType.blank:
        return Text('CmsComponentType.banner');
      case CmsComponentType.productRecommend:
        return Text('CmsComponentType.banner');
      case CmsComponentType.servicePack:
        return Text('CmsComponentType.banner');
    }
    return const SizedBox.shrink();
  }
}

