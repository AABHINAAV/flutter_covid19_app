import 'package:covid_19/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'global_screen/global_screen.dart';
import 'Details_screen/detail_screen.dart';

Map data;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // UI & UX:-
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Widget bodyScreen = GlobalScreen();
  int tileNmbr = 1;
  int tileIndex = 1;
  //

  // Data fetching
  final String apiURL = 'https://api.covid19api.com/summary';

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await http.get(apiURL);
    var jsonFormatData = jsonDecode(response.body);
    setState(() {
      data = jsonFormatData;
    });
    return 'done';
  }
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: buildDrawer(),
      appBar: buildAppBar(),
      body: data == null ? buildWorkingWidget() : bodyScreen,
    );
  }

  Drawer buildDrawer() {
    var size = MediaQuery.of(context).size;
    return Drawer(
      child: ListView(
        children: [
          buildUserAccountsDrawerHeader(),
          data == null
              ? Column(
                  children: [
                    SizedBox(height: size.height / 3.5),
                    buildWorkingWidget(),
                  ],
                )
              : Column(
                  children: [
                    drawerTile(
                      tileIndex: 1,
                      tileName: 'Global & Country',
                      icon: 'assets/icons/globe.svg',
                      bodyWidget: GlobalScreen(),
                    ),
                    SizedBox(height: 10),
                    drawerTile(
                      tileIndex: 2,
                      tileName: 'Preventions',
                      icon: 'assets/icons/prevention.svg',
                      bodyWidget: DetailsPage(),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Drawer notBuildDrawer() {
    var size = MediaQuery.of(context).size;
    return Drawer(
      child: ListView(
        children: [
          buildUserAccountsDrawerHeader(),
          SizedBox(height: size.height / 3.5),
          buildWorkingWidget(),
        ],
      ),
    );
  }

  UserAccountsDrawerHeader buildUserAccountsDrawerHeader() {
    return UserAccountsDrawerHeader(
      currentAccountPicture: SvgPicture.asset(
        'assets/icons/virus.svg',
        color: Colors.redAccent[700],
      ),
      accountName: Text(
        "Let's break the chain",
        style: TextStyle(
          fontSize: 20,
          letterSpacing: 0.5,
          color: Colors.black,
        ),
      ),
      accountEmail: Text(
        'Stay Home, Stay Safe',
        style: TextStyle(
          fontSize: 16,
          letterSpacing: 0.4,
          color: Colors.black,
        ),
      ),
      decoration: BoxDecoration(color: kPrimaryColor.withOpacity(0.3)),
    );
  }

  ListTile drawerTile({
    int tileIndex,
    String tileName,
    String icon,
    Widget bodyWidget,
  }) {
    return ListTile(
      onTap: () {
        setState(() {
          tileNmbr = tileIndex;
          bodyScreen = bodyWidget;
        });
      },
      tileColor: tileNmbr == tileIndex
          ? Colors.teal[400]
          : kPrimaryColor.withOpacity(0.3),
      leading: Text(
        tileName,
        style: TextStyle(
          color: tileNmbr == tileIndex ? Colors.white : Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: SvgPicture.asset(
        icon,
        color: tileNmbr == tileIndex ? Colors.white : Colors.black,
        height: 35,
        width: 35,
      ),
    );
  }

  Center buildWorkingWidget() {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: size.width * 0.2,
        width: size.width * 0.2,
        child: CircularProgressIndicator(
          strokeWidth: 5,
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor.withOpacity(0.2),
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/menu.svg'),
        onPressed: () {
          scaffoldKey.currentState.openDrawer();
        },
      ),
      actions: [
        SvgPicture.asset(
          'assets/icons/virus.svg',
          color: Colors.green[800],
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
