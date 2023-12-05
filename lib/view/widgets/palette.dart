import 'package:christmas_postcard/styles/app_color_styles.dart';
import 'package:flutter/material.dart';

class Palette extends StatefulWidget {
  final ValueChanged<Color> onChanged;

  const Palette({Key? key, required this.onChanged}) : super(key: key);

  @override
  _PaletteState createState() => _PaletteState();
}

class _PaletteState extends State<Palette> {
  double _hue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 20,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                for (double i = 0; i <= 360; i += 1)
                  HSVColor.fromAHSV(1.0, i, 1.0, 1.0).toColor(),
              ],
              stops: [
                for (double i = 0; i <= 360; i += 1) i / 360,
              ],
            ),
          ),
        ),
        Positioned(
          left: (_hue / 360) *
              (MediaQuery.of(context).size.width - 24), //@tip: 선택된 컬러 위치
          child: const Center(
            child: Icon(
              Icons.circle_outlined,
              color: AppColors.redColor,
              size: 24,
            ),
          ),
        ),
        Opacity(
          opacity: 0,
          child: Slider(
            value: _hue,
            min: 0,
            max: 360,
            onChanged: (value) {
              setState(() {
                _hue = value;
                widget.onChanged(
                    HSVColor.fromAHSV(1.0, _hue, 1.0, 1.0).toColor());
              });
            },
          ),
        ),
      ],
    );
  }
}
