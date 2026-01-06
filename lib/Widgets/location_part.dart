import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LocationPart extends StatelessWidget {
  final String location;

  const LocationPart({
    super.key,
    required this.location,
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
            location,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xff2C2C2C),
            ),
          ),
          const SizedBox(width: 6),
          SvgPicture.asset(
            'lib/MyIcons/location_icon.svg',
          ),
        ],
      ),
    );
  }
}
