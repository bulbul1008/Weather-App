import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WarningWidget extends StatelessWidget {
  final String rain;
  final String expTime;
  final String warningTitle;

  const WarningWidget({
    super.key,
    required this.rain,
    required this.expTime,
    required this.warningTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsGeometry.directional(start: 20,end: 20),
      color: Color(0xffFDFCFC),
      padding: EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'lib/MyIcons/warning_icon.svg',
                    width: 21,
                    height: 21,
                  ),
                  Text(
                    "WARNING",
                    style: TextStyle(
                      color: Color(0xffFFD600),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SvgPicture.asset(
                    'lib/MyIcons/cloud_icon.svg',
                    // width: 95,
                    // height: 51,
                  ),
                ],
              ),
            ],
          ),
          Row(
           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_xyz("% RAIN", rain), _xyz("EXP. TIME", expTime)],
          ),
          Row(
          children: [
            Text(warningTitle,
            style: TextStyle(
              color: Color(0xffFFD600),
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
            ),
          ],
          )
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     padding: const EdgeInsets.all(15),
  //      height: 163,
  //    width: 327,
  //     color: Color(0xffFDFCFC),
  //     child: Column(
  //       children: [
  //         Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //
  //           children: [
  //             Row(
  //             children: [
  //               Column(
  //                 children: [
  //                   SvgPicture.asset(
  //                     'lib/MyIcons/warning_icon.svg',
  //                     width: 21,
  //                     height: 21,
  //                   ),
  //                 ],
  //               ),
  //               SizedBox(width: 20,),
  //               Column(
  //                 children: [
  //                   Text("WARNING",
  //                   style: TextStyle(
  //                     color: Color(0xffFFD600),
  //                     fontWeight: FontWeight.w400,
  //                   ),)
  //                 ],
  //               ),
  //              // SizedBox(width: 95,),
  //             ],
  //                     ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: [
  //                 _xyz("% RAIN", rain),
  //                 _xyz("EXP. TIME", expTime),
  //
  //               ],
  //             ),
  //
  //
  //
  //           ],
  //         ),
  //         Column(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: [
  //             SvgPicture.asset(
  //               'lib/MyIcons/cloud_icon.svg',
  //               // width: 95,
  //               // height: 51,
  //             )
  //           ],
  //
  //         ),
  //
  //
  //       ],
  //     ),
  //
  //
  //
  //
  //
  //   );
  //
  // }

  Widget _xyz(String title, String value) {
    return Column(
      //mainAxisSize: MainAxisSize.min,
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
