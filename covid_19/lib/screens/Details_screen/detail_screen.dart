import 'package:covid_19/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/help_card.dart';
import 'widgets/prevention_list_section.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        width: size.width,
        color: kPrimaryColor.withOpacity(0.1),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                'Preventions',
                style: Theme.of(context).textTheme.title.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              PreventionListSection(),
              CallingCard(),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 21),
                      blurRadius: 54,
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Global Map",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SvgPicture.asset("assets/icons/more.svg")
                      ],
                    ),
                    SizedBox(height: 10),
                    SvgPicture.asset("assets/icons/map.svg"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  RichText buildInfoTextWithPercentage({String percentage, String title}) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$percentage%\n',
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: title,
            style: TextStyle(
              color: kTextMediumColor,
            ),
          ),
        ],
      ),
    );
  }

  Row buildNumbersTile(BuildContext context) {
    return Row(
      children: [
        Text(
          '547 ',
          style: Theme.of(context)
              .textTheme
              .display2
              .copyWith(color: kPrimaryColor),
        ),
        Text(
          '1.34% ',
          style: TextStyle(color: kPrimaryColor),
        ),
        SvgPicture.asset(
          'assets/icons/increase.svg',
          color: kPrimaryColor,
        ),
      ],
    );
  }

  Row buildTitleWithMoreIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'New Cases',
          style: TextStyle(
            color: kTextMediumColor,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        SvgPicture.asset('assets/icons/more.svg'),
      ],
    );
  }
}
