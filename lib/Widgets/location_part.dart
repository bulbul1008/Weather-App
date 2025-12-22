import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LocationPart extends StatelessWidget {
  final String cityName;

  const LocationPart({
    super.key,
    required this.cityName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 30,
      //width: 172,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            cityName,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xff2C2C2C),
            ),
          ),
          const SizedBox(width: 6),
          SvgPicture.asset(
            'lib/MyIcons/location_icon.svg',
            width: 21,
            height: 21,
          ),
        ],
      ),
    );
  }
}
