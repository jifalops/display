import 'package:display/display.dart';

void main(List<String> args) {
  double width = 1024;
  double height = 768;
  if (args.length >= 1) {
    width = double.tryParse(args[0]) ?? width;
  }
  if (args.length >= 2) {
    height = double.tryParse(args[1]) ?? height;
  }
  final area = DisplayArea(height: height, width: width);
  print('''
Display: ${area.width}x${area.height} dp, margins/gutters: ${area.margins} dp
Display type: ${area.type} (${area.specificType})
Aspect ratio: ${(area.aspectRatio * 100).round() / 100}
Content width: ${area.contentWidth} dp
Columns: ${area.columns}
Large tile width: ${area.fourColumnWidth.round()} dp
Single material column width: ${area.columnWidth.round()} dp
  ''');
}
