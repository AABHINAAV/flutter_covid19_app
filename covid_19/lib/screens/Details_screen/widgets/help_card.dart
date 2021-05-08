import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CallingCard extends StatelessWidget {
  const CallingCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 150,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: size.width * 0.1),
            width: double.infinity,
            height: 130,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF60BE93),
                  Color(0xFF1B8D59),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Dial 999 for\nMedical Help',
                    style: Theme.of(context).textTheme.title.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  TextSpan(
                    text: '\nIf any symptoms appear',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 15,
            right: 15,
            child: SvgPicture.asset(
              'assets/icons/virus.svg',
              color: Colors.greenAccent[50],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SvgPicture.asset('assets/icons/nurse.svg'),
          )
        ],
      ),
    );
  }
}
