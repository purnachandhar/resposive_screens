import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pixel Colors'),
        ),
        body: Center(
          child: Container(
            width: 1200.0, // Width of the container
            height: 200.0, // Height of the container
            child: CustomPaint(
              painter: PixelPainter(),
            ),
          ),
        ),
      ),
    );
  }
}

class PixelPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pixelSize = 2.0; // Size of each pixel
    final rows = size.height ~/ pixelSize;
    final columns = size.width ~/ pixelSize;

    // Define colors for each pixel
    final colors = <Color>[
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.orange,
    ];

    var colorIndex = 0;

    for (var row = 0; row < rows; row++) {
      for (var col = 0; col < columns; col++) {
        final rect = Rect.fromPoints(
          Offset(col * pixelSize, row * pixelSize),
          Offset((col + 1) * pixelSize, (row + 1) * pixelSize),
        );

        final paint = Paint()..color = colors[colorIndex % colors.length];
        canvas.drawRect(rect, paint);

        colorIndex++;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

/*
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Responsive Screen POC'),
        ),
        body: ResponsiveContainer(),
      ),
    );
  }
}

class ResponsiveContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen size
    double screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Define breakpoints for different screen sizes
    const double mobileBreakpoint = 600; // Example: Screen width < 600 is considered mobile
    const double tabletBreakpoint = 1024; // Example: Screen width between 600 and 1024 is considered tablet

    // Calculate the size of the container as a percentage of the screen size
    final containerWidth = screenWidth * 0.5;  // 50% of the screen width
    final containerHeight = screenHeight * 0.2; // 20% of the screen height

    // Determine which layout to use based on screen size
    if (screenWidth < mobileBreakpoint) {
      // Mobile layout
      return Center(child: buildMobileLayout(containerWidth,containerHeight));
    } else if (screenWidth < tabletBreakpoint) {
      // Tablet layout
      return Center(child: buildTabletLayout(containerWidth,containerHeight));
    } else {
      // Desktop layout
      return Center(child: buildDesktopLayout(containerWidth,containerHeight));
    }
  }

  Widget buildMobileLayout(double containerWidth, double containerHeight) {
    return Container(
      color: Colors.blue,
      width: 200,
      height: 200,
      child: Center(
        child: Text(
          'Container Size\n${containerWidth.toStringAsFixed(1)} x ${containerHeight.toStringAsFixed(1)} pixels',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget buildTabletLayout(double containerWidth, double containerHeight) {
    return Container(
      color: Colors.green,
      width: 300,
      height: 300,
      child: Center(
        child: Text(
          'Container Size\n${containerWidth.toStringAsFixed(1)} x ${containerHeight.toStringAsFixed(1)} pixels',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }

  Widget buildDesktopLayout(double containerWidth, double containerHeight) {
    return Container(
      color: Colors.orange,
      width: 400,
      height: 400,
      child: Center(
        child: Text(
          'Container Size\n${containerWidth.toStringAsFixed(1)} x ${containerHeight.toStringAsFixed(1)} pixels',
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),
      ),
    );
  }
}
*/
