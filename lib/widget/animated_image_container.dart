import 'package:flutter/material.dart';
import 'package:portfolio/responsive_framework/src/extension/context_extension.dart';

import '../const.dart';

class AnimatedImageContainer extends StatefulWidget {
  const AnimatedImageContainer(
      {super.key, this.height = 300, this.width = 250});
  final double? width;
  final double? height;

  @override
  AnimatedImageContainerState createState() => AnimatedImageContainerState();
}

class AnimatedImageContainerState extends State<AnimatedImageContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true); // Repeat the animation loop
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final value = _controller.value;
        return Transform.translate(
          offset: Offset(0, 2 * value), // Move the container up and down
          child: Container(
            height: widget.height!,
            width: widget.width!,
            padding: EdgeInsets.all(defaultPadding / 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(
                colors: [
                  Colors.pinkAccent,
                  Colors.blue,
                ],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.pink,
                  offset: Offset(-2, 0),
                  blurRadius: 20,
                ),
                BoxShadow(
                  color: Colors.blue,
                  offset: Offset(2, 0),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Image.asset(
                'assets/images/image.png',
                height: context.responsive(
                  xs: MediaQuery.sizeOf(context).width *
                      0.14, // For smaller screens
                  sm: MediaQuery.sizeOf(context).width *
                      0.14, // For medium screens
                  md: MediaQuery.sizeOf(context).width *
                      0.2, // For larger screens
                ),
                width: context.responsive(
                  xs: MediaQuery.sizeOf(context).width * 0.14,
                  sm: MediaQuery.sizeOf(context).width * 0.14,
                  md: MediaQuery.sizeOf(context).width * 0.2,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
