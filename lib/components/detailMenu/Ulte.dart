import 'package:flutter/material.dart';

import '../../model.dart';
import '../../post_result_model.dart';
import 'detailUleUtle/DetailUle.dart';
import 'detailUleUtle/DetailUtle.dart';

class UleUltePage extends StatefulWidget {
  @override
  _UleUltePageState createState() => _UleUltePageState();
}

class _UleUltePageState extends State<UleUltePage> {

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text("ULE - UTLE"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Detail', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, bottom: 40.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, //untuk ngatur posisi ke tengah
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                    height: 150,
                    child: Container(
                      child: Material(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8),
                          splashColor: Colors.amber[600],
                          onTap: () {
                            PostResult.connectToAPI("1").then((value){
                              postResult = value;
                              setState((){});
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UtlePage(),
                              ),
                            );
                          },
                          child: Center(
                            child: Text(
                              "Detail UTLE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                              colors: [Color(0xFF3379FF), Color(0xFF3379FF)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, //untuk ngatur posisi ke tengah
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.4,
                    height: 150,
                    child: Container(
                      child: Material(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8),
                          splashColor: Colors.blue[700],
                          onTap: () {
                            PostResult.connectToAPI("1").then((value){
                              postResult = value;
                              setState((){});
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UlePage(),
                              ),
                            );
                          },
                          child: Center(
                            child: Text(
                              "Detail ULE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.amber[600],
                      ),
                    ),
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}

//class Card extends StatelessWidget{
//
//  final String title;
//  final String value;
//  final Color color;
//
//  Card({this.title, this.value, this.color});
//  @override
//  // ignore: non_constant_identifier_names
//  Widget build(BuildContext){
//    return Padding(
//      padding: EdgeInsets.only(right: 15.0),
//      child: Container(
//        width: 190.0,
//        decoration: BoxDecoration(
//          color: color,
//          borderRadius: BorderRadius.all(Radius.circular(8.0)),
//        ),
//
//        child: Padding(
//          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Padding(
//                  padding: EdgeInsets.only(),
//                  child: Center(
//                    child: new Text(title,
//                      style: TextStyle(
//                          fontSize: 18.0,
//                          color: Colors.white,
//                          fontWeight: FontWeight.bold
//                      ),
//                    ),
//                  )
//              ),
//              SizedBox(height: 15.0,),
//              Padding(
//                  padding: EdgeInsets.only(),
//                  child: Center(
//                    child: new Text('$value',
//                      style: TextStyle(
//                          fontSize: 22.0,
//                          color: Colors.white,
//                          fontWeight: FontWeight.bold
//                      ),),
//                  )
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
