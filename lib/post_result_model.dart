import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class PostResult{
  String ID;
  String RTGStotalOut;
  String RTGSamountOut;
  String RTGStotalIn;
  String RTGSamountIn;

  String SKNtotalOut;
  String SKNamountOut;
  String SKNtotalIn;
  String SKNamountIn;

  double ATMyes;
  double ATMno;

  String EDCyes;

  String CARDyes;
  String CARDno1;
  String CARDno2;

  int ATMon;
  int ATMoff;
  int ATMna;
  int ATMerr;

  String EJtotal;
  String EJdone;
  String EJerror;
  String EJnconnect;
  String EJnfound;

  PostResult({
    this.ID,
    this.RTGStotalOut,
    this.RTGSamountOut,
    this.RTGStotalIn,
    this.RTGSamountIn,

    this.SKNtotalOut,
    this.SKNamountOut,
    this.SKNtotalIn,
    this.SKNamountIn,

    this.ATMyes,
    this.ATMno,

    this.EDCyes,

    this.CARDyes,
    this.CARDno1,
    this.CARDno2,

    this.ATMon,
    this.ATMoff,
    this.ATMna,
    this.ATMerr,

    this.EJtotal,
    this.EJdone,
    this.EJerror,
    this.EJnconnect,
    this.EJnfound,
  });

    factory PostResult.createPostResult(Map <String, dynamic> object)
  {
    return PostResult(
      ID: object['ID'],
      RTGStotalOut: object['RTGStotalOut'],
      RTGSamountOut: object['RTGSamountOut'],
      RTGStotalIn: object['RTGStotalIn'],
      RTGSamountIn: object['RTGSamountIn'],

      SKNtotalOut: object['SKNtotalOut'],
      SKNamountOut: object['SKNamountOut'],
      SKNtotalIn: object['SKNtotalIn'],
      SKNamountIn: object['SKNamountIn'],

      ATMyes: object['ATMyes'],
      ATMno: object['ATMno'],

      EDCyes: object['EDCyes'],

      CARDyes: object['CARDyes'],
      CARDno1: object['CARDno1'],
      CARDno2: object['CARDno2'],

      ATMon: object['ATMon'],
      ATMoff: object['ATMoff'],
      ATMna: object['ATMna'],
      ATMerr: object['ATMerr'],

      EJtotal: object['EJtotal'],
      EJdone: object['EJdone'],
      EJerror: object['EJerror'],
      EJnconnect: object['EJnconnect'],
      EJnfound: object['EJnfound'],
    );
  }
  static Future<dynamic> connectToAPI(String ID) async
  {
    String apiURL = "http://slik.btn.co.id/ws/WebService.asmx/GetDataTest";

    //var apiResult = await http.post(apiURL, body: {"id":id});
   var apiResult = await http.get(apiURL);
    //var apiResult = await http.get(apiURL, body: {"id":id});
    dynamic jsonObject = json.decode(apiResult.body);
    print(jsonObject);
    return jsonObject;
//    return PostResult.createPostResult(jsonObject[0]);
  }
}