import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';


class PreventionListSection extends StatelessWidget {
  const PreventionListSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: PreventionCard(
            svgSrc: 'assets/icons/hand_wash.svg',
            title: 'Clean Hands',
          ),
        ),
        Container(
          child: PreventionCard(
            svgSrc: 'assets/icons/use_mask.svg',
            title: 'Use Mask',
          ),
        ),
        Container(
          child: PreventionCard(
            svgSrc: 'assets/icons/Clean_Disinfect.svg',
            title: 'Clean Disinfect',
          ),
        ),
      ],
    );
  }
}

class PreventionCard extends StatelessWidget {
  final String title;
  final String svgSrc;
  const PreventionCard({
    Key key,
    this.title,
    this.svgSrc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(svgSrc),
        Text(
          title,
          style:
              Theme.of(context).textTheme.body2.copyWith(color: kPrimaryColor),
        ),
      ],
    );
  }
}
