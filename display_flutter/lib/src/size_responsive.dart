import 'package:display/display.dart';
import 'package:flutter/widgets.dart';

typedef DisplayAreaBuilder = DisplayArea Function(BoxConstraints constraints);

typedef SizeResponsiveBuilder = Widget Function(
    BuildContext context, DisplayArea area);

class SizeResponsive extends StatelessWidget {
  const SizeResponsive({
    @required this.builder,
    this.areaBuilder,
  });

  final DisplayAreaBuilder areaBuilder;
  final SizeResponsiveBuilder builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => builder(
        context,
        areaBuilder?.call(constraints) ??
            DisplayArea(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
            ),
      ),
    );
  }
}
