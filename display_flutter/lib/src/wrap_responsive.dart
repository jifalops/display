import 'package:display/display.dart';
import 'package:flutter/widgets.dart';
import 'size_responsive.dart';

/// A [Wrap] that constrains its children according to the width available.
///
/// The default behavior will place content in one, two, or three columns,
/// depending on the material design breakpoints.
///
/// See [DisplayArea] and [SizeResponsive].
class WrapResponsive extends StatelessWidget {
  WrapResponsive({
    Key key,
    @required this.children,
    this.columnsPerChild,
    this.areaBuilder,
    this.direction = Axis.horizontal,
    this.splitVerticalSpacing = true,
  }) : super(key: key);

  final DisplayAreaBuilder areaBuilder;

  /// Defaults to four material columns per child.
  final int Function(DisplayArea area) columnsPerChild;

  final List<Widget> children;
  final Axis direction;

  /// If true, half the [DisplayArea.gutters] will be used to pad the top and
  /// bottom of the internal [Wrap].
  final bool splitVerticalSpacing;

  @override
  Widget build(BuildContext context) {
    return SizeResponsive(
      areaBuilder: areaBuilder,
      builder: (context, area) {
        final width = area.multiColumnWidth(columnsPerChild?.call(area) ?? 4);
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: area.gutters,
            vertical: splitVerticalSpacing ? area.gutters / 2 : area.gutters,
          ),
          child: Wrap(
            direction: direction,
            spacing: area.margins,
            runSpacing: area.margins,
            children: <Widget>[
              ...children.map(
                (child) => Container(
                  width: width,
                  child: child,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
