import 'package:flutter/material.dart';
import '../components/cardAccount.dart';
import '../components/promotion.dart';
import '../components/AppBarr/AppBar.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget appBarTitle = new Text("Home");
  Icon actionIcon = new Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[700],
          title: appBarTitle,
          actions: <Widget>
          [
            new IconButton(
              icon: actionIcon,
              onPressed:()
              {
                setState(() {
                  if(this.actionIcon.icon == Icons.search)
                  {
                    this.actionIcon = new Icon(Icons.close);
                    this.appBarTitle = TextField(
                      style: new TextStyle(
                        color: Colors.white,
                      ),
                      decoration: new InputDecoration(
                        prefixIcon: new Icon(Icons.search, color: Colors.white),
                        hintText: " Search . . .",
                        hintStyle: new TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  else{
                    this.actionIcon = new Icon(Icons.search);
                    this.appBarTitle = new Text("Home");
                  }
                });
              },
            )
          ],
        ),

      body: ListView(
        children: <Widget>[
//          Bar(),
          CardAccount(),
          Divider(),
          Promotion()
        ],
      )
    );
  }
}

