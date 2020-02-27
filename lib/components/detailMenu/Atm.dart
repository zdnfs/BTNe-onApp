import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../model.dart';
import '../../post_result_model.dart';

class AtmPage extends StatefulWidget {
  @override
  _AtmPageState createState() => _AtmPageState();
}

class _AtmPageState extends State<AtmPage> {

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

    var data=[
      AviAtm("Online", int.parse(getData[0]['ATMon']), Colors.green),
      AviAtm("Offline", int.parse(getData[0]['ATMoff']), Colors.redAccent),
      AviAtm("N/A", int.parse(getData[0]['ATMna']), Colors.amberAccent[700]),
      AviAtm("Error", int.parse(getData[0]['ATMerr']), Colors.lightBlue)
    ];

    var series=[
      charts.Series<AviAtm, String>(
          domainFn: (AviAtm AviAtm,_)=>AviAtm.status,
          measureFn: (AviAtm AviAtm,_)=>AviAtm.value,
          colorFn: (AviAtm AviAtm,_)=>AviAtm.color,
          id: 'Avi Atm',
          data: data,
      )
    ];

    var chart = charts.PieChart(
      series,
      defaultRenderer: charts.ArcRendererConfig(
//          arcRendererDecorators: [charts.ArcLabelDecorator()],
          arcWidth: 115
      ),
      animate: true,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text("Availibility ATM"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Status ATM', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),),
            ),
            SizedBox(height: 400, child: chart),

            Padding(
              padding: EdgeInsets.only(left: 45.0, bottom: 25.0),
              child: Container(
                height: 30.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Card(
                      color: Colors.green,
                    ),
                    Text('Online : ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),),
                    Text(isLoading ? 'Loading' : ((getData[0]['ATMon'].toString() != null) ? getData[0]['ATMon'].toString() : "0"),
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 45.0, bottom: 25.0),
              child: Container(
                height: 30.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Card(
                      color: Colors.redAccent,
                    ),
                    Text('Offline : ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),),
                    Text(isLoading ? 'Loading' : ((getData[0]['ATMoff'].toString() != null) ? getData[0]['ATMoff'].toString() : "0"),
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 45.0, bottom: 25.0),
              child: Container(
                height: 30.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Card(
                      color: Colors.amberAccent[700],
                    ),
                    Text('N/A : ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),),
                    Text(isLoading ? 'Loading' : ((getData[0]['ATMna'].toString() != null) ? getData[0]['ATMna'].toString() : "0"),
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 45.0, bottom: 25.0),
              child: Container(
                height: 30.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Card(
                      color: Colors.lightBlue,
                    ),
                    Text('Error : ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),),
                    Text(isLoading ? 'Loading' : ((getData[0]['ATMerr'].toString() != null) ? getData[0]['ATMerr'].toString() : "0"),
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),),
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


class AviAtm{
  final String status;
  final int value;
  final charts.Color color;

  AviAtm(this.status, this.value, Color color)
      :this.color=charts.Color(r: color.red,g: color.green,b: color.blue,a: color.alpha);
}

class Card extends StatelessWidget{

  final Color color;

  Card({ this.color});
  @override
  // ignore: non_constant_identifier_names
  Widget build(BuildContext){
    return Padding(
      padding: EdgeInsets.only(right: 15.0),
      child: Container(
        width: 30.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}