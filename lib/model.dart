import 'dart:convert';
import 'package:http/http.dart' as http;

class Getdata
{
  String id;
  String rtgstotalout;
  String rtgsamountout;
  String rtgstotalin;
//  String rtgsamountin;

  Getdata({this.id, this.rtgstotalout, this.rtgsamountout, this.rtgstotalin});

  factory Getdata.createGetdata(Map<String, dynamic> object)
  {
    return Getdata(
      id: object['id'].toString(),
      rtgstotalout: object['RTGStotalOUT'].toString(),
      rtgsamountout: object['RTGSamountOut'].toString(),
      rtgstotalin: object['RTGStotalIn'].toString(),
//      rtgsamountin: object['RTGSamountIn'].toString()
    );
  }

  static Future<Getdata> connectToAPI(String id) async
  {
    String apiURL = "http://10.0.2.2:8000/sqlsrv/getdata.php" + id;
    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
//    var Data = (jsonObject as Map<String, dynamic>)['value'];

    return Getdata.createGetdata(jsonObject);
//    return response()->json($yourData, 200, ['Content-Type' => 'application/json;charset=UTF-8', 'Charset' => 'utf-8'],
//    JSON_UNESCAPED_UNICODE
  }
}