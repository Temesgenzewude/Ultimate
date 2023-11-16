import 'package:flutter/rendering.dart';

import '../../../common/constant/colors.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Path path_0 = Path();
    path_0.moveTo(size.width * 0.5885177, size.height * 0.2284205);
    path_0.cubicTo(
        size.width * 0.5871362,
        size.height * 0.4360048,
        size.width * 0.5486431,
        size.height * 0.7024096,
        size.width * 0.5013624,
        size.height * 0.7024096);
    path_0.cubicTo(
        size.width * 0.4540817,
        size.height * 0.7024096,
        size.width * 0.4155886,
        size.height * 0.4360048,
        size.width * 0.4142071,
        size.height * 0.2284181);
    path_0.lineTo(size.width * 0.4141689, size.height * 0.2289145);
    path_0.cubicTo(
        size.width * 0.4141689,
        size.height * 0.2289145,
        size.width * 0.4128065,
        size.height * 0.1686735,
        size.width * 0.3952125,
        size.height * 0.08381349);
    path_0.cubicTo(
        size.width * 0.3782561,
        size.height * 0.002018470,
        size.width * 0.3609700,
        size.height * 0.00003645807,
        size.width * 0.3597411,
        0);
    path_0.lineTo(size.width * 0.3596730, 0);
    path_0.lineTo(size.width * 0.2500000, 0);
    path_0.lineTo(size.width * 0.06539510, 0);
    path_0.cubicTo(size.width * 0.02927847, 0, 0, size.height * 0.1294602, 0,
        size.height * 0.2891566);
    path_0.lineTo(0, size.height);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width, size.height * 0.2891566);
    path_0.cubicTo(size.width, size.height * 0.1294602, size.width * 0.9707221,
        0, size.width * 0.9346049, 0);
    path_0.cubicTo(
        size.width * 0.6417548,
        size.height * 0.00003706506,
        size.width * 0.6244687,
        size.height * 0.002019072,
        size.width * 0.6075123,
        size.height * 0.08381410);
    path_0.cubicTo(
        size.width * 0.5899183,
        size.height * 0.1686747,
        size.width * 0.5885559,
        size.height * 0.2289157,
        size.width * 0.5885559,
        size.height * 0.2289157);
    path_0.lineTo(size.width * 0.5885177, size.height * 0.2284205);
    path_0.close();

    final Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = grey100;
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
