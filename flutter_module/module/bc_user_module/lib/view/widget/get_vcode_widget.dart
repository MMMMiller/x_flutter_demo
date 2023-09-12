import 'package:bc_user_module/domain/bloc/vcode/vcode_bloc.dart';
import 'package:common_lib/index.dart';
import 'package:flutter/widgets.dart';

class VcodeWidget extends BaseStatelessWidget {
  final VcodeBloc vcodeBloc;
  final Function getVcodeFunction;

  VcodeWidget(
    this.vcodeBloc, {
    Key? key,
    required this.getVcodeFunction,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VcodeBloc, VcodeState>(
      builder: (BuildContext context, VcodeState state) {
        print('object');
        print(state);
        if (state is InVocdeState) {
          return SmsCountDown(
            vcodeBloc: vcodeBloc,
          );
        }
        return DataChangeWidget(
            dataChangeBloc: this.vcodeBloc.vCodeBtnValidBloc,
            child: (BuildContext context, DataChangeState btnState) {
              return CommonClickWidget(
                child: CommonText(
                  state is UnVcodeState ? '重新获取':'获取验证码',
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: btnState.data ? ColorsConfig.primaryColor : ColorsConfig.c8c8c8,
                ),
                singleClick: () {
                  print('点击点击');
                  getVcodeFunction();
                },
              );
            });
      },
      bloc: vcodeBloc,
    );
  }
}

/// SMS
class SmsCountDown extends StatefulWidget {
  final VcodeBloc vcodeBloc;

  SmsCountDown({Key? key, required this.vcodeBloc}) : super(key: key);

  @override
  _SmsCountDownState createState() => _SmsCountDownState();
}

class _SmsCountDownState extends State<SmsCountDown>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedCountdown(
      animation: StepTween(begin: kCountdownNum, end: 1).animate(_controller),
      callback: () => widget.vcodeBloc.resetVcode(),
    );
  }

  static const int kCountdownNum = 60;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(seconds: kCountdownNum));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AnimatedCountdown extends AnimatedWidget {
  final Animation<int> animation;
  final VoidCallback callback;

  AnimatedCountdown({required this.callback, key, required this.animation})
      : super(key: key, listenable: animation) {
    this.animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (callback != null) callback();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonText(
      '重新获取${animation.value}秒',
      fontSize: 13,
      color: ColorsConfig.c8c8c8,
      // S.of(context).splashSkip,
    );
  }
}
