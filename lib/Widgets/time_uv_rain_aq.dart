import 'package:flutter/material.dart';

class TimeUvRainAq extends StatelessWidget {
  final String time;
  final String uv;
  final String rain;
  final String aq;

  const TimeUvRainAq({
    super.key,
    required this.time,
    required this.uv,
    required this.rain,
    required this.aq,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 327,
      // height: 59,
      margin:EdgeInsetsGeometry.directional(start: 20,end: 20),
      padding: EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 16),
      decoration: BoxDecoration(
        color: Color(0xffFDFCFC),
        borderRadius: BorderRadius.circular(11),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _underRow("TIME", time),
          _underRow("UV", uv),
          _underRow("%RAIN", rain),
          _underRow("AQ", aq),
        ],
      ),
    );
  }

  Widget _underRow(String title, String value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xffC4C4C4),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            color: Color(0xff9A9A9A),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
