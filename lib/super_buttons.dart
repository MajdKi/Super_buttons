library amazing_buttons;

import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  Buttons(this.height, this.frontSideWidth, this.backSideWidth,
      this.theSekwedWidth, this.icon, this.fronsSideColor, this.backSideColor,
      {Key? key})
      : super(key: key);
  double height;
  double frontSideWidth;
  double backSideWidth;
  double theSekwedWidth;
  Icon icon;
  Color fronsSideColor;
  Color backSideColor;

  @override
  State<Buttons> createState() => _ButtonsState(height, frontSideWidth,
      backSideWidth, theSekwedWidth, icon, fronsSideColor, backSideColor);
}

class _ButtonsState extends State<Buttons> {
  double height;
  double frontSideWidth;
  double backSideWidth;
  double theSekwedWidth;
  Icon icon;
  Color fronsSideColor;
  Color backSideColor;
  _ButtonsState(this.height, this.frontSideWidth, this.backSideWidth,
      this.theSekwedWidth, this.icon, this.fronsSideColor, this.backSideColor);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: backSideColor,
          height: height,
          width: backSideWidth,
          child: Row(
            children: [
              const Expanded(
                child: SizedBox(),
              ),
              Container(
                width: backSideWidth - frontSideWidth - theSekwedWidth,
                height: height,     
                child: FittedBox(
                  child: icon,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: 5,
              )
            ],
          ),
        ),
        CustomPaint(
          painter:
              Painter(fronsSideColor, frontSideWidth, theSekwedWidth, height),
        )
      ],
    );
  }
}

class Painter extends CustomPainter {
  Painter(this.fronsSideColor, this.frontSideWidth, this.theSekwedWidth,
      this.height);
  Color fronsSideColor;
  double frontSideWidth;
  double theSekwedWidth;
  double height;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = fronsSideColor
      ..style = PaintingStyle.fill;
    Path path = Path();
    path.lineTo(frontSideWidth, 0);
    path.quadraticBezierTo(
        frontSideWidth + theSekwedWidth, height / 2, frontSideWidth, height);
    path.lineTo(0, height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
