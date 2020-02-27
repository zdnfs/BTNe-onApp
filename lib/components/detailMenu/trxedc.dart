import 'package:flutter/material.dart';

import '../../model.dart';
import '../../post_result_model.dart';
import '../layout.dart';

class TrxEdcPage extends StatefulWidget {
  @override
  _TrxEdcPageState createState() => _TrxEdcPageState();
}

class _TrxEdcPageState extends State<TrxEdcPage> {

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
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text("TRX EDC"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('TRX EDC', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[700], fontSize: SizeConfig.blockHorizontal * 5),),
              ),
              Padding(
                padding: EdgeInsets.only(left: SizeConfig.blockHorizontal * 3, bottom: SizeConfig.blockVertical * 5),
                child: Container(
                  height: SizeConfig.blockHorizontal * 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      TrxCard2(
                        title: 'TRX EDC',
                        title2: 'Sucess',
                        value1: isLoading ? 'Loading' : ((getData[0]['EDCyes'] != null) ? double.parse(getData[0]['EDCyes']) : double.parse("0")),
                        //value1: isLoading ? 'Loading' : ((getData[0]['EDCyes'] != null) ? getData[0]['EDCyes'].toString() : "0"),
                        //                  value1: '0',

                        title3: 'Failed',
                        value2: isLoading ? 'Loading' : ((getData[0]['EDCno'] != null) ? double.parse(getData[0]['EDCno']) : double.parse("0")),
                        //value2: isLoading ? 'Loading' : ((getData[0]['EDCno'] != null) ? getData[0]['EDCno'].toString() : "0"),
                        //                  value2: '3',
                        color: Colors.blue[700],
                      ),
                    ],
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}

class TrxCard2 extends StatelessWidget {

  final String title;
  final String title2;
  final double value1;
  final double value2;
  final String title3;
  final Color color;

  TrxCard2({this.title, this.title2, this.title3, this.value1, this.value2, this.color});

  @override
  Widget build(BuildContext){
    double ratio = value1/(value1+value2);
    return Padding(
      padding: EdgeInsets.only(right: SizeConfig.blockHorizontal * 3),
      child: Container(
        width: SizeConfig.blockHorizontal * 94,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockHorizontal * 3, vertical: SizeConfig.blockVertical * 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(),
                  child: Center(
                    child: new Text(title,
                      style: TextStyle(
                          fontSize: SizeConfig.blockHorizontal * 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  )
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    '$value1',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: SizeConfig.blockHorizontal * 5,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    '$value2',
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: SizeConfig.blockHorizontal * 5,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.blockVertical * 3),
              ),
              Stack(
                  children: <Widget>[Container(
                    width: SizeConfig.blockHorizontal * 85,
                    height: SizeConfig.blockVertical * 2,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                  ),
                    Material(
                      borderRadius: BorderRadius.circular(5),
                      child: AnimatedContainer(
                        height: SizeConfig.blockVertical * 2,
                        width: (value1!=0||value2!=0)?(SizeConfig.blockHorizontal * 85)*ratio:155,
                        duration: Duration(milliseconds: 500),
                        decoration: BoxDecoration(color: Colors.amberAccent, borderRadius: BorderRadius.circular(5)),
                      ),
                    ),]
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.blockVertical * 3),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    title2,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: SizeConfig.blockHorizontal * 4,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    title3,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: SizeConfig.blockHorizontal * 4,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}