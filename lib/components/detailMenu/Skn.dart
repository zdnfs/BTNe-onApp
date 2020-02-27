import 'package:flutter/material.dart';

import 'package:traveloka/components/detailMenu/table/sknin.dart';
import 'package:traveloka/components/detailMenu/table/sknout.dart';

import '../../model.dart';
import '../../post_result_model.dart';
import '../layout.dart';

import 'package:intl/intl.dart';
import 'package:indonesia/indonesia.dart';

class SknPage extends StatefulWidget {
  @override
  _SknPageState createState() => _SknPageState();
}

class _SknPageState extends State<SknPage> {

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
        title: Text("SKN"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockHorizontal * 3, vertical: SizeConfig.blockVertical * 3),
              child: Text(
                'SKN INCOMING',
                style: TextStyle(
                  fontSize: SizeConfig.blockHorizontal * 5,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[700],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: SizeConfig.blockHorizontal * 3, bottom: SizeConfig.blockVertical * 3),
              child: Container(
                height: SizeConfig.blockHorizontal * 55,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Material(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => skninTable(),
                              ),
                            );
                          },
                          child: SknCard2(
                            title: 'Record',
                            value: isLoading ? 'Loading' : ((getData[0]['SKNtotalIn'].toString() != null) ? getData[0]['SKNtotalIn'].toString() : "0"),
//                      value: '4880',
                            color: Colors.yellow[600],
                          ),
                        )
                    ),
                    SknCard(
                      title: 'Amount',
                      value: isLoading ? 'Loading' : ((getData[0]['SKNamountIn'].toString() != null) ? getData[0]['SKNamountIn'].toString() : "0"),
//                      value: '95843',
                      color: Colors.yellow[600],
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockHorizontal * 3, vertical: SizeConfig.blockVertical * 3),
              child: Text(
                'SKN OUTGOING',
                style: TextStyle(
                  fontSize: SizeConfig.blockHorizontal * 5,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[700],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: SizeConfig.blockHorizontal * 3, bottom: SizeConfig.blockVertical * 3),
              child: Container(
                height: SizeConfig.blockHorizontal * 55,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Material(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => sknoutTable(),
                              ),
                            );
                          },
                          child: SknCard2(
                            title: 'Record',
                            value: isLoading ? 'Loading' : ((getData[0]['SKNtotalOut'].toString() != null) ? getData[0]['SKNtotalOut'].toString() : "0"),
//                      value: '4880',
                            color: Colors.yellow[600],
                          ),
                        )
                    ),
                    SknCard(
                      title: 'Amount',
                      value: isLoading ? 'Loading' : ((getData[0]['SKNamountOut'].toString() != null) ? getData[0]['SKNamountOut'].toString() : "0"),
//                      value: '134536',
                      color: Colors.yellow[600],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class SknCard extends StatelessWidget{
  final String title;
  final String value;
  final Color color;

  SknCard({this.title, this.value, this.color});
  @override
  Widget build(BuildContext){
    return Padding(
      padding: EdgeInsets.only(right: SizeConfig.blockHorizontal * 3),
      child: Container(
        width: SizeConfig.blockHorizontal * 56,
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
                          fontSize: SizeConfig.blockHorizontal * 7,
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  )
              ),
              SizedBox(height: SizeConfig.blockHorizontal * 8,),
              Padding(
                  padding: EdgeInsets.only(),
                  child: Center(
                    child: new Text(rupiah('$value', separator: ',',
                        trailing: '.00'),
                      style: TextStyle(
                          fontSize: SizeConfig.blockHorizontal * 7,
                          color: Colors.blue[800],
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

class SknCard2 extends StatelessWidget{
  final String title;
  final String value;
  final Color color;

  SknCard2({this.title, this.value, this.color});
  @override
  Widget build(BuildContext){
    return Padding(
      padding: EdgeInsets.only(right: SizeConfig.blockHorizontal * 3),
      child: Container(
        width: SizeConfig.blockHorizontal * 35,
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
                          fontSize: SizeConfig.blockHorizontal * 7,
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  )
              ),
              SizedBox(height: SizeConfig.blockHorizontal * 8,),
              Padding(
                  padding: EdgeInsets.only(),
                  child: Center(
                    child: new Text('$value',
                      style: TextStyle(
                          fontSize: SizeConfig.blockHorizontal * 7,
                          color: Colors.blue[800],
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
