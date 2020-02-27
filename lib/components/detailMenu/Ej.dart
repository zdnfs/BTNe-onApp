import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../model.dart';
import '../../post_result_model.dart';
import '../layout.dart';

class EjPage extends StatefulWidget {
  @override
  _EjPageState createState() => _EjPageState();
}

class _EjPageState extends State<EjPage> {

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

    var data=[
//      AviAtm("Sukses", isLoading ? 'Loading' : ((getData[0]['EJdone'] != null) ? getData[0]['EJdone'] : "0"), Colors.green),
//      AviAtm("Gagal", isLoading ? 'Loading' : ((getData[0]['EJerror'] != null) ? getData[0]['EJerror'] : "0"), Colors.redAccent),
//      AviAtm("Total", isLoading ? 'Loading' : ((getData[0]['EJtotal'] != null) ? getData[0]['EJtotal'] : "0"), Colors.blueAccent),

      AviAtm("Sukses", int.parse(getData[0]['EJdone']), Colors.green),
      AviAtm("Gagal", int.parse(getData[0]['EJerror']), Colors.red),
      AviAtm("Total", int.parse(getData[0]['EJtotal']), Colors.blue),
    ];

    var series=[
      charts.Series(
          domainFn: (AviAtm AviAtm,_)=>AviAtm.status,
          measureFn: (AviAtm AviAtm,_)=>AviAtm.value,
          colorFn: (AviAtm AviAtm,_)=>AviAtm.color,
          id: 'Avi Atm',
          data: data,
          labelAccessorFn: (AviAtm AviAtm,_)=> '${AviAtm.status} : ${AviAtm.value.toString()}'
      )
    ];

    var chart = charts.BarChart(
      series,
      vertical: false,
      barRendererDecorator: charts.BarLabelDecorator<String>(),
      domainAxis: charts.OrdinalAxisSpec(renderSpec: charts.NoneRenderSpec()),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text("Electronic Journal"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Ej Status', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[900], fontSize: SizeConfig.blockHorizontal * 5),),
            ),
            SizedBox(height: 400, child: chart),

            ListTile(
              title: Text('Ej Error', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[900], fontSize: SizeConfig.blockHorizontal * 5),),
            ),
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.blockHorizontal * 3, bottom: SizeConfig.blockVertical * 3),
              child: Container(
                height: SizeConfig.blockHorizontal * 43,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Card(
                      title: 'Active',
                      value: isLoading ? 'Loading' : ((getData[0]['EJnconnect'].toString() != null) ? getData[0]['EJnconnect'].toString() : "0"),
//                      value: '110',
                      color: Colors.blue,
                    ),
                    Card(
                      title: 'In-Active',
                      value: isLoading ? 'Loading' : ((getData[0]['EJnfound'].toString() != null) ? getData[0]['EJnfound'].toString() : "0"),
//                      value: '92',
                      color: Colors.red,
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


class AviAtm{
  final String status;
  final int value;
  final charts.Color color;

  AviAtm(this.status, this.value, Color color)
      :this.color=charts.Color(r: color.red,g: color.green,b: color.blue,a: color.alpha);

}

class Card extends StatelessWidget{

  final String title;
  final String value;
  final Color color;

  Card({this.title, this.value, this.color});
  @override
  // ignore: non_constant_identifier_names
  Widget build(BuildContext){
    return Padding(
      padding: EdgeInsets.only(right: SizeConfig.blockHorizontal * 3),
      child: Container(
        width: SizeConfig.blockHorizontal * 45,
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
                          color: Colors.white,
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
                          fontSize: SizeConfig.blockHorizontal * 8,
                          color: Colors.white,
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

class Card2 extends StatelessWidget{

  final String title;
  final double value;
  final Color color;

  Card2({this.title, this.value, this.color});
  @override
  // ignore: non_constant_identifier_names
  Widget build(BuildContext){
    return Padding(
      padding: EdgeInsets.only(right: SizeConfig.blockHorizontal * 3),
      child: Container(
        width: SizeConfig.blockHorizontal * 45,
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
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  )
              ),
              SizedBox(height: 15.0,),
              Padding(
                  padding: EdgeInsets.only(),
                  child: Center(
                    child: new Text('$value',
                      style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
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