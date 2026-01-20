import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LocationBar extends StatelessWidget {
  final String location;
  final String temperature;
  final String iconPath;
  final String? warningTitle;

  const LocationBar({
    super.key,
    required this.location,
    required this.temperature,
    required this.iconPath,
    this.warningTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsGeometry.directional(start: 20, end: 20),
      padding: EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: Color(0xffFDFCFC),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                location,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff2C2C2C),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    temperature.replaceAll("C", ""),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 60,
                      color: Color(0xff2C2C2C),
                    ),
                  ),
                ],
              ),
              Column(
                children: [Text(iconPath, style: TextStyle(fontSize: 60))],
              ),
            ],
          ),
          if (warningTitle != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'lib/MyIcons/warning_icon.svg',
                        width: 21,
                        height: 21,
                      ),
                      SizedBox(width: 4),

                      Text(
                        'WARNING',
                        style: TextStyle(
                          color: Color(0xffFFD600),
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Text(
                   warningTitle!,
                    style: TextStyle(
                      color: Color(0xffFFD600),
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),

                //  SizedBox(width: 100,),
              ],
            ),
        ],
      ),
    );
  }
}
