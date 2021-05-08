import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class InfoBar extends StatefulWidget {
  const InfoBar({
    Key key,
    this.title,
    this.total,
    this.iconColor,
    this.press,
  }) : super(key: key);

  final String title;
  final int total;
  final Color iconColor;
  final Function press;

  @override
  _InfoBarState createState() => _InfoBarState();
}

class _InfoBarState extends State<InfoBar> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 2 - 13,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: widget.iconColor.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  'assets/icons/running.svg',
                  height: 12,
                  width: 12,
                  color: widget.iconColor,
                ),
              ),
              SizedBox(width: 5),
              Text(
                widget.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(color: kTextColor),
              children: [
                TextSpan(
                  text: '${widget.total}\n',
                  style: Theme.of(context).textTheme.title.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                TextSpan(
                  text: 'People',
                  style: TextStyle(
                    fontSize: 12,
                    height: 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
