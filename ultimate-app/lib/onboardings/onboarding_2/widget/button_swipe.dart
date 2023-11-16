import 'package:flutter/material.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/styles.dart';
import 'swipeable_widget.dart';

class SwipeableButtonView extends StatefulWidget {
  const SwipeableButtonView(
      {Key? key,
      required this.onFinish,
      required this.onWaitingProcess,
      required this.activeColor,
      required this.buttonWidget,
      required this.buttonText,
      this.isFinished = false,
      this.isActive = true,
      this.disableColor = Colors.grey,
      this.buttonColor = Colors.white,
      this.buttontextstyle =
          const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      this.indicatorColor = const AlwaysStoppedAnimation<Color>(Colors.white)})
      : super(key: key);
  final VoidCallback onFinish;
  final VoidCallback onWaitingProcess;
  final bool isFinished;
  final bool isActive;
  final Color activeColor;
  final Color? disableColor;
  final Widget buttonWidget;
  final Color? buttonColor;
  final String buttonText;
  final TextStyle? buttontextstyle;
  final Animation<Color?>? indicatorColor;

  @override
  _SwipeableButtonViewState createState() => _SwipeableButtonViewState();
}

class _SwipeableButtonViewState extends State<SwipeableButtonView>
    with TickerProviderStateMixin {
  bool isAccepted = false;
  double opacity = 1;
  bool isFinishValue = false;
  bool isStartRippleEffect = false;
  late AnimationController _controller;

  bool isScaleFinished = false;

  late AnimationController rippleController;
  late AnimationController scaleController;

  late Animation<double> rippleAnimation;
  late Animation<double> scaleAnimation;

  void init() {
    setState(() {
      isAccepted = false;
      opacity = 1;
      isFinishValue = false;
      isStartRippleEffect = false;
    });
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      isFinishValue = widget.isFinished;
    });

    rippleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            isFinishValue = true;
          });
          widget.onFinish();
        }
      });
    rippleAnimation =
        Tween<double>(begin: 60.0, end: 90.0).animate(rippleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              rippleController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              rippleController.forward();
            }
          });
    scaleAnimation =
        Tween<double>(begin: 1.0, end: 30.0).animate(scaleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                isScaleFinished = true;
              });
            }
          });

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {});
  }

  @override
  void dispose() {
    _controller.dispose();
    rippleController.dispose();
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isFinished) {
      setState(() {
        isStartRippleEffect = true;
        isFinishValue = true;
      });
      scaleController.forward();
    } else {
      if (isFinishValue) {
        scaleController.reverse().then((value) {
          init();
        });
      }
    }
    return Container(
      width: isAccepted
          ? (MediaQuery.of(context).size.width -
              ((MediaQuery.of(context).size.width - 60) * _controller.value))
          : double.infinity,
      height: 60,
      decoration: BoxDecoration(
          color: primary, borderRadius: BorderRadius.circular(16)),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Opacity(
              opacity: opacity,
              child: Text(
                widget.buttonText,
                style: title4(color: grey1100),
              ),
            ),
          ),
          !isAccepted
              ? SwipeableWidget(
                  isActive: widget.isActive,
                  height: 60.0,
                  onSwipeValueCallback: (value) {
                    setState(() {
                      opacity = value;
                    });
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 52,
                            height: 52,
                            child: const Icon(
                              Icons.arrow_circle_right_outlined,
                              color: grey1100,
                            ),
                            decoration: BoxDecoration(
                                color: blueLight,
                                borderRadius: BorderRadius.circular(16)),
                          ),
                        ],
                      ),
                    ),
                    height: 60.0,
                  ),
                  onSwipeCallback: () {
                    widget.onWaitingProcess();
                    setState(() {
                      isAccepted = true;
                    });
                    _controller.animateTo(1.0,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.fastOutSlowIn);
                  },
                )
              : AnimatedBuilder(
                  animation: rippleAnimation,
                  builder: (context, child) => Container(
                    width: rippleAnimation.value,
                    height: rippleAnimation.value,
                    child: AnimatedBuilder(
                        animation: scaleAnimation,
                        builder: (context, child) => Transform.scale(
                              scale: scaleAnimation.value,
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: primary,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                      child: Center(
                                        child: !isFinishValue
                                            ? CircularProgressIndicator(
                                                valueColor:
                                                    widget.indicatorColor)
                                            : const SizedBox(),
                                      ),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: primary)),
                                ),
                              ),
                            )),
                  ),
                ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Opacity(
                opacity: opacity,
                child: const Icon(
                  Icons.keyboard_double_arrow_right,
                  size: 32,
                  color: blueLight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
