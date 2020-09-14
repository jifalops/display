import 'package:meta/meta.dart';
import 'types.dart';

/// Represents a device's screen or other container such as an iframe.
///
/// It includes lazy getters for some derivable properties such as the
/// [Material breakpoints](https://material.io/design/layout/responsive-layout-grid.html#breakpoints)
/// for screen type, columns, and default margins/gutters.
class DisplayArea {
  const DisplayArea({
    @required this.height,
    @required this.width,
    double margins,
    double gutters,
  })  : _margins = margins,
        _gutters = gutters;

  final double height;
  final double width;
  final double _margins;
  final double _gutters;

  double get margins => _margins ?? defaultMarginsAndGutters;
  double get gutters => _gutters ?? defaultMarginsAndGutters;

  double get aspectRatio => width / height;
  bool get isLandscape => width > height;
  bool get isPortrait => !isLandscape;

  /// [width] minus gutters.
  double get contentWidth => width - gutters * 2;

  /// The sum of all the margins between columns.
  double get totalMargins => margins * (columns - 1);

  /// The width of one material column.
  double get columnWidth => (contentWidth - totalMargins) / columns;

  /// The width of two material columns including the margin between them.
  double get doubleColumnWidth => multiColumnWidth(2);

  double multiColumnWidth(int cols) {
    assert(columns >= 0 && cols <= columns);
    return cols * columnWidth + margins * (cols - 1);
  }

  MaterialDisplayType get specificType {
    if (isPortrait) {
      if (width < 360)
        return MaterialDisplayType.smallHandset;
      else if (width < 400)
        return MaterialDisplayType.mediumHandset;
      else if (width < 600)
        return MaterialDisplayType.largeHandset;
      else if (width < 720)
        return MaterialDisplayType.smallTablet;
      else if (width < 960)
        return MaterialDisplayType.largeTablet;
      else if (width < 1024)
        return MaterialDisplayType.smallWindow;
      else if (width < 1440)
        return MaterialDisplayType.mediumWindow;
      else if (width < 1920)
        return MaterialDisplayType.largeWindow;
      else
        return MaterialDisplayType.extraLargeWindow;
    } else {
      if (width < 480)
        return MaterialDisplayType.extraSmallWindow;
      else if (width < 600)
        return MaterialDisplayType.smallHandset;
      else if (width < 720)
        return MaterialDisplayType.mediumHandset;
      else if (width < 960)
        return MaterialDisplayType.largeHandset;
      else if (width < 1024)
        return MaterialDisplayType.smallTablet;
      else if (width < 1440)
        return MaterialDisplayType.largeTablet;
      else if (width < 1920)
        return MaterialDisplayType.largeWindow;
      else
        return MaterialDisplayType.extraLargeWindow;
    }
  }

  DisplayType get type {
    switch (specificType) {
      case MaterialDisplayType.smallHandset:
      case MaterialDisplayType.mediumHandset:
      case MaterialDisplayType.largeHandset:
      case MaterialDisplayType.extraSmallWindow:
        return DisplayType.mobile;
      case MaterialDisplayType.smallTablet:
      case MaterialDisplayType.largeTablet:
      case MaterialDisplayType.smallWindow:
        return DisplayType.tablet;
      default:
        return DisplayType.window;
    }
  }

  int get columns {
    if (width < 600)
      return 4;
    else if (width < 840)
      return 8;
    else
      return 12;
  }

  double get defaultMarginsAndGutters {
    if (width < 720)
      return 16.0;
    else
      return 24.0;
  }

  @override
  operator ==(o) =>
      o is DisplayArea &&
      height == o.height &&
      width == o.width &&
      _margins == o._margins &&
      _gutters == o._gutters;

  @override
  int get hashCode =>
      height.hashCode ^
      width.hashCode ^
      (_margins?.hashCode ?? 0) ^
      (_gutters?.hashCode ?? 0);
}
