import 'package:flutter/material.dart';

import '../../model.dart';
import '../../post_result_model.dart';

import 'package:traveloka/components/layout.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  PostResult postResult = null;
  Getdata getdata = null;

  var getData;
  bool isLoading=false;

  @override
  void initState() {
    super.initState();
    getInit();
  }

  getInit()async{
    setState((){
      isLoading=true;
    });

    getData = await PostResult.connectToAPI('1');
    setState((){});

    setState((){
      isLoading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: SizeConfig.blockHorizontal * 70,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("RTGS Page"),
              background: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTkV2mhZLAG1QeFYmW1o2RdavcBFxxolG7WdyvDqkFUYw4FScX-",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFillRemaining(
            child: new Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'RTGS INCOMING',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, bottom: 25.0),
                    child: Container(
                      height: SizeConfig.blockHorizontal * 40,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          RtgsSknCard(
                            title: 'Record',
                            value: isLoading ? 'Loading' : ((getData[0]['RTGStotalIn'] != null) ? getData[0]['RTGStotalIn'] : "0"),
//                      value: '276',
                            color: Colors.yellow[600],
                          ),
                          RtgsSknCard(
                            title: 'Amount',
                            value: isLoading ? 'Loading' : ((getData[0]['RTGStotalOut'] != null) ? getData[0]['RTGStotalOut'] : "0"),
//                      value: '630',
                            color: Colors.yellow[600],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
                    child: Text(
                      'RTGS OUTGOING',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, bottom: 25.0),
                    child: Container(
                      height: SizeConfig.blockHorizontal * 40,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          RtgsSknCard(
                            title: 'Record',
                            value: isLoading ? 'Loading' : ((getData[0]['RTGSamountOut'].toString() != null) ? getData[0]['RTGSamountOut'].toString() : "0"),
//                      value: '4880',
                            color: Colors.yellow[600],
                          ),
                          RtgsSknCard(
                            title: 'Amount',
                            value: isLoading ? 'Loading' : ((getData[0]['RTGSamountIn'].toString() != null) ? getData[0]['RTGSamountIn'].toString() : "0"),
//                      value: '1150',
                            color: Colors.yellow[600],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }
}

class RtgsSknCard extends StatelessWidget{

  final String title;
  final String value;
  final Color color;

  RtgsSknCard({this.title, this.value, this.color});
  @override
  Widget build(BuildContext context){
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.only(right: 15.0),
      child: Container(
        width: SizeConfig.blockHorizontal * 45,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(),
                  child: Center(
                    child: new Text(title,
                      style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  )
              ),
              SizedBox(height: 30.0,),
              Padding(
                  padding: EdgeInsets.only(),
                  child: Center(
                    child: new Text('$value',
                      style: TextStyle(
                          fontSize: 36.0,
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold
                      ),),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
