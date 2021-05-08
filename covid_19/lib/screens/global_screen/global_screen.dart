import 'package:flutter/material.dart';

import '../../constants.dart';
import 'info_bar.dart';

import '../home_page.dart';

class GlobalScreen extends StatefulWidget {
  @override
  _GlobalScreenState createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  int newConfirmed,
      totalConfirmed,
      newDeaths,
      totalDeaths,
      newRecovered,
      totalRecovered;

  @override
  void initState() {
    super.initState();
    this.showGlobalData();
  }
  void showGlobalData() {
    newConfirmed = data['Global']['NewConfirmed'];
    totalConfirmed = data['Global']['TotalConfirmed'];
    newDeaths = data['Global']['NewDeaths'];
    totalDeaths = data['Global']['TotalDeaths'];
    newRecovered = data['Global']['NewRecovered'];
    totalRecovered = data['Global']['TotalRecovered'];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          numberShowCase(),
          selectCountry(),
        ],
      ),
    );
  }

  Container numberShowCase() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 5,
        left: 10,
        right: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Wrap(
        spacing: 5,
        alignment: WrapAlignment.spaceBetween,
        runSpacing: 5,
        children: [
          InfoBar(
            title: 'New Confirmed',
            total: newConfirmed,
            iconColor: Color(0xFFFF8C00),
            press: () {},
          ),
          InfoBar(
            title: 'Total Confirmed',
            total: totalConfirmed,
            iconColor: Color(0xFFFF8C00),
            press: () {},
          ),
          InfoBar(
            title: 'New Deaths',
            total: newDeaths,
            iconColor: Color(0xFFFF2D55),
            press: () {},
          ),
          InfoBar(
            title: 'Total Deaths',
            total: totalDeaths,
            iconColor: Color(0xFFFF2D55),
            press: () {},
          ),
          InfoBar(
            title: 'New Recovered',
            total: newRecovered,
            iconColor: Color(0xFF50E3C2),
            press: () {},
          ),
          InfoBar(
            title: 'Total Recovered',
            total: totalRecovered,
            iconColor: Color(0xFF50E3C2),
            press: () {},
          ),
        ],
      ),
    );
  }

  Expanded selectCountry() {
    var size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 5),
        padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: 5,
        ),
        decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: data['Countries'].length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  newConfirmed = data['Countries'][index]['NewConfirmed'];
                  totalConfirmed = data['Countries'][index]['TotalConfirmed'];
                  newDeaths = data['Countries'][index]['NewDeaths'];
                  totalDeaths = data['Countries'][index]['TotalDeaths'];
                  newRecovered = data['Countries'][index]['NewRecovered'];
                  totalRecovered = data['Countries'][index]['TotalRecovered'];
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: size.width / 2 - 13,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  data['Countries'][index]['Country'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
