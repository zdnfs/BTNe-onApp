import 'package:flutter/material.dart';

import '../pages/allProduct.dart';
import '../pages/screen.dart';

List<MainMenuItem> mainMenuItem = [
  MainMenuItem(
    title:'RTGS',
    icon: Icons.dock ,
    colorBox: Colors.blue[900],
    iconColor: Colors.white,
    screenTitle: 'RTGS',
    screenContent: 'RTGS PAGE',
  ),
  MainMenuItem(
    title:'SKN',
    icon: Icons.local_atm,
    colorBox: Colors.blue[900],
    iconColor: Colors.white,
    screenTitle: 'SKN',
    screenContent: 'SKN PAGE'
  ),
  MainMenuItem(
    title:'ATM',
    icon: Icons.atm,
    colorBox: Colors.blue[900],
    iconColor: Colors.white,
    screenTitle: 'ATM',
    screenContent: 'SKN PAGE'
  ),
  MainMenuItem(
    title:'ELECTRONIC JOURNAL',
    icon: Icons.important_devices,
    colorBox: Colors.blue[900],
    iconColor: Colors.white,
    screenTitle: 'ELECTRONIC JOURNAL',
    screenContent: 'ELECTRONIC JOURNAL PAGE'
  ),
  MainMenuItem(
      title:'CASH SALDO',
      icon: Icons.credit_card,
      colorBox: Colors.blue[900],
      iconColor: Colors.white,
      screenTitle: 'CASH SALDO',
      screenContent: 'CASH SALDO'
  ),
];

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      children: mainMenuItem,
    );
  }
}

class MainMenuItem extends StatelessWidget {
  final String title, screenTitle, screenContent;
  final IconData icon;
  final Color colorBox, iconColor;
  final Widget screenWidget;

  MainMenuItem({this.title, this.icon, this.colorBox, this.iconColor, this.screenTitle, this.screenContent, this.screenWidget});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
            color: colorBox,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(icon, color: iconColor),
            onPressed: (){
              Route route = MaterialPageRoute(
                builder: (context){
                  if(screenWidget == null){
                    return ScreenGeneral(
                      title: screenTitle,
                      content: screenContent,
                    );
                  }
                  return screenWidget;
                }
              );
              Navigator.of(context).push(route);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0.3,),
          child: Text(title, style: TextStyle(fontSize: 12.0), textAlign: TextAlign.center,),
        )
      ],
    );
  }
}