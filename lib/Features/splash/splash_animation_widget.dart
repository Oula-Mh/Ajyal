import 'package:ajyal/Core/utils/constants/app_images.dart';
import 'package:flutter/material.dart';

class SplashAnimationWidget extends StatefulWidget {
  final VoidCallback onComplete;

  const SplashAnimationWidget({super.key, required this.onComplete});

  @override
  State<SplashAnimationWidget> createState() => _SplashAnimationWidgetState();
}

class _SplashAnimationWidgetState extends State<SplashAnimationWidget>
    with TickerProviderStateMixin {
  late final AnimationController _logoController;
  late final Animation<double> _logoScale;

  late final AnimationController _textController;
  late final Animation<double> _firstTextFade;
  late final Animation<Offset> _firstTextSlide;
  late final Animation<double> _secondTextFade;
  late final Animation<Offset> _secondTextSlide;

  static const _logoAnimDuration = Duration(milliseconds: 1800);
  static const _textAnimDuration = Duration(milliseconds: 1400);

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _startAnimations();
  }

  void _initAnimations() {
    _logoController = AnimationController(
      vsync: this,
      duration: _logoAnimDuration,
    );
    _logoScale = Tween<double>(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeOutBack),
    );

    _textController = AnimationController(
      vsync: this,
      duration: _textAnimDuration,
    );
    _firstTextFade = _createFade(_textController, 0.0, 0.5);
    _firstTextSlide = _createSlide(_textController, 0.0, 0.5, Offset(-0.5, 0));
    _secondTextFade = _createFade(_textController, 0.5, 1.0);
    _secondTextSlide = _createSlide(_textController, 0.5, 1.0, Offset(0.5, 0));
  }

  void _startAnimations() {
    _logoController.forward().then((_) {
      _textController.forward().then((_) {
        Future.delayed(Duration(seconds: 2), widget.onComplete);
      });
    });
  }

  Animation<double> _createFade(
    AnimationController ctrl,
    double start,
    double end,
  ) {
    return Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: ctrl, curve: Interval(start, end)));
  }

  Animation<Offset> _createSlide(
    AnimationController ctrl,
    double start,
    double end,
    Offset from,
  ) {
    return Tween<Offset>(
      begin: from,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: ctrl, curve: Interval(start, end)));
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    super.dispose();
  }

  Widget _buildAnimatedText(
    String text,
    Animation<double> fade,
    Animation<Offset> slide,
    TextStyle style,
  ) {
    return SlideTransition(
      position: slide,
      child: FadeTransition(opacity: fade, child: Text(text, style: style)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _logoController,
          builder:
              (_, child) =>
                  Transform.scale(scale: _logoScale.value, child: child),
          child: Image.asset(AppImages.logo, width: 200),
        ),

        const SizedBox(height: 5),

        _buildAnimatedText(
          "Education Center",
          _firstTextFade,
          _firstTextSlide,
          const TextStyle(fontSize: 14),
        ),

        const SizedBox(height: 6),

        _buildAnimatedText(
          "بالعلم ننمو .. و بالمحبة نرتقي",
          _secondTextFade,
          _secondTextSlide,
          const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
