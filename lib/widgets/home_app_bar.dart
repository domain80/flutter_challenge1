import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

class HomeAppBar extends StatefulWidget {
  HomeAppBar({
    super.key,
    required this.horizontalPadding,
    required this.scrollPercentage,
  });

  double scrollPercentage;
  final double horizontalPadding;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> with TickerProviderStateMixin {
  late AnimationController _controller;

  double currentHeight = 80;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    ); //..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double maxHeight = 314;
  double minHeight = 80;

  @override
  Widget build(BuildContext context) {
    const double smallLogo = 44;
    const double bigLogo = 160;

    return SliverAppBar(
      centerTitle: false,
      expandedHeight: maxHeight,
      collapsedHeight: minHeight,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor.withAlpha(240),
      flexibleSpace: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 8),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widget.horizontalPadding,
              vertical: 16,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final Size containerSize = constraints.biggest;
                final midx = constraints.constrainWidth() * 0.5;
                final midy = constraints.constrainHeight() * 0.5;

                Size bigTitle = Size(constraints.constrainWidth(), 52);
                Size smallTitle = Size(constraints.constrainWidth() * 0.3, 42);

                _controller.value =
                    (constraints.constrainHeight() - minHeight) /
                        (maxHeight - minHeight);

                return Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    PositionedTransition(
                      rect: RelativeRectTween(
                        begin: RelativeRect.fromSize(
                          Rect.fromLTWH(
                            containerSize.width - smallLogo + 8,
                            containerSize.height - smallLogo,
                            smallLogo,
                            smallLogo,
                          ),
                          containerSize,
                        ),
                        end: RelativeRect.fromSize(
                          Rect.fromLTWH(
                            midx - bigLogo / 2,
                            midy - bigLogo / 2,
                            bigLogo,
                            bigLogo,
                          ),
                          containerSize,
                        ),
                      ).animate(CurvedAnimation(
                        parent: _controller,
                        curve: Curves.easeInOut,
                      )),
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: UserAvatar(),
                      ),
                    ),
                    PositionedTransition(
                      rect: RelativeRectTween(
                        begin: RelativeRect.fromSize(
                          Rect.fromLTWH(
                            -2,
                            containerSize.height * 0.60,
                            bigTitle.width,
                            bigTitle.height,
                          ),
                          containerSize,
                        ),
                        end: RelativeRect.fromSize(
                          Rect.fromLTWH(
                            containerSize.width * 0.35,
                            containerSize.height * 0.78,
                            bigTitle.width,
                            bigTitle.height,
                          ),
                          containerSize,
                        ),
                      ).animate(CurvedAnimation(
                        parent: _controller,
                        curve: Curves.easeInOut,
                      )),
                      
                      child: Text(
                        "Hello Jacky",
                        style: TextStyle(
                          fontSize: 16 + (20 - 16) * _controller.value,
                        ),
                      ),
                    ),
                    PositionedTransition(
                      rect: RelativeRectTween(
                        begin: RelativeRect.fromSize(
                          Rect.fromLTWH(
                            -0,
                            containerSize.height * 0.75,
                            bigTitle.width,
                            bigTitle.height,
                          ),
                          containerSize,
                        ),
                        end: RelativeRect.fromSize(
                          Rect.fromLTWH(
                            midx * 0.34,
                            containerSize.height * 0.85,
                            bigTitle.width,
                            bigTitle.height,
                          ),
                          containerSize,
                        ),
                      ).animate(CurvedAnimation(
                        parent: _controller,
                        curve: Curves.easeInOut,
                      )),
                      child: Text(
                        "Welcome back",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20 + (32 - 20) * _controller.value,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
      pinned: true,
    );
  }
}

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/img/user.png");
  }
}
