import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../components/detailMenu/Atm.dart';
import '../components/detailMenu/Ej.dart';
import '../components/detailMenu/Rtgs.dart';
import '../components/detailMenu/Saldo.dart';
import '../components/detailMenu/Skn.dart';
import '../components/detailMenu/Ulte.dart';
import '../components/detailMenu/Trx.dart';

import '../model.dart';
import '../post_result_model.dart';
import 'detailMenu/tes.dart';
import 'detailMenu/trxedc.dart';

class Promotion extends StatefulWidget {
  @override
  _PromotionState createState() => _PromotionState();
}

class _PromotionState extends State<Promotion> {

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
    return Column(
      children: <Widget>[

        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 40.0, vertical: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Material(
                      child: InkWell(
                        onTap: () {
                          PostResult.connectToAPI("1").then((value){
                            postResult = value;
                            setState((){});
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RtgsPage(),
                            ),
                          );
                        },
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset('assets/img/rtgs3.png',
                                width: 80.0, height: 80.0),
                          ),),
                      )
                  ),
                  SizedBox(height: 8.0),
                  Text('RTGS',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                children: <Widget>[
                  Material(
                      child: InkWell(
                        onTap: () {
                          PostResult.connectToAPI("1").then((value){
                            postResult = value;
                            setState((){});
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SknPage(),
                            ),
                          );
                        },
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset('assets/img/skn3.png',
                                width: 80.0, height: 80.0),
                          ),),
                      )
                  ),
                  SizedBox(height: 8.0),
                  Text('SKN',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                children: <Widget>[
                  Material(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AtmPage(),
                            ),
                          );
                        },
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset('assets/img/atm3.png',
                                width: 80.0, height: 80.0),
                          ),),
                      )
                  ),
                  SizedBox(height: 8.0),
                  Text('Availibility ATM',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 40.0, vertical: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Material(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EjPage(),
                            ),
                          );
                        },
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset('assets/img/atm2.png',
                                width: 80.0, height: 80.0),
                          ),),
                      )
                  ),
                  SizedBox(height: 8.0),
                  Text('EJ Pooling',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                children: <Widget>[
                  Material(
                      child: InkWell(
                        onTap: () {
                          PostResult.connectToAPI("1").then((value){
                            postResult = value;
                            setState((){});
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TrxEdcPage(),
                            ),
                          );
                        },
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image.asset('assets/img/edc2.png',
                                width: 80.0, height: 80.0),
                          ),),
                      )
                  ),
                  SizedBox(height: 8.0),
                  Text('TRX EDC',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                children: <Widget>[
                  Material(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TrxPage(),
                            ),
                          );
                        },
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset('assets/img/cash2.png',
                                width: 80.0, height: 80.0),
                          ),),
                      )
                  ),
                  SizedBox(height: 8.0),
                  Text('TRX ATM',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold)),
                ],
              ),
//              Column(
//                children: <Widget>[
//                  Material(
//                    borderRadius: BorderRadius.circular(100.0),
//                    color: Colors.blueGrey[200],
//                    child: IconButton(
//                      padding: EdgeInsets.all(15.0),
//                      icon: Icon(Icons.account_balance),
//                      color: Colors.white,
//                      iconSize: 50.0,
//                      onPressed: () {
//                        Navigator.push(context, MaterialPageRoute(builder: (context) => UleUltePage()),);
//                      },
//                    ),
//                  ),
//                  SizedBox(height: 8.0),
//                  Text('ULE - UTLE',
//                      style: TextStyle(
//                          color: Colors.black54,
//                          fontWeight: FontWeight.bold))
//                ],
//              ),
            ],
          ),
        ),
//        ListTile(
//          title: Text('TRX', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),),
//        ),
//        Padding(
//          padding: EdgeInsets.only(left: 15.0, bottom: 25.0),
//          child: Container(
//            height: 150.0,
//            child: ListView(
//              scrollDirection: Axis.horizontal,
//              children: <Widget>[
//                TrxCard(
//                  title: 'TRX ATM',
//                  title2: 'Sucess',
//                  //value1: double.parse(getData[0]['ATMyes']),
//                  value1: isLoading ? 'Loading' : ((getData[0]['ATMyes'] != null) ? double.parse(getData[0]['ATMyes']) :double.parse("0")),
//                  //value1: isLoading ? 'Loading' : ((getData[0]['ATMyes'] != null) ? 4 : "0"),
////                  value1: '335909',
//                //value1: double.parse(getData[0]['ATMyes']),
//
//                  title3: 'Failed',
//                  //value2: double.parse(getData[0]['ATMno']),
//                  value2: isLoading ? 'Loading' : ((getData[0]['ATMno'] != null) ? double.parse(getData[0]['ATMno']) : double.parse("0")),
//                  //value2: isLoading ? 'Loading' : ((getData[0]['ATMno'] != null) ? 12 : "0"),
////                  value2: '31043',
//
//                  color: Colors.blue[700],
//                ),
//
//
//                TrxCard2(
//                  title: 'TRX EDC',
//                  title2: 'Sucess',
//                  value1: isLoading ? 'Loading' : ((getData[0]['EDCyes'] != null) ? double.parse(getData[0]['EDCyes']) : double.parse("0")),
//                  //value1: isLoading ? 'Loading' : ((getData[0]['EDCyes'] != null) ? getData[0]['EDCyes'].toString() : "0"),
////                  value1: '0',
//
//                  title3: 'Failed',
//                  value2: isLoading ? 'Loading' : ((getData[0]['EDCno'] != null) ? double.parse(getData[0]['EDCno']) : double.parse("0")),
//                  //value2: isLoading ? 'Loading' : ((getData[0]['EDCno'] != null) ? getData[0]['EDCno'].toString() : "0"),
////                  value2: '3',
//                  color: Colors.blue[700],
//                ),
//              ],
//            ),
//          ),
//        ),
      ],
    );
  }
}
