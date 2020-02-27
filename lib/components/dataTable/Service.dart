import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Atm.dart';

class Services{
  static const ROOT = 'http://localhost/btn_app/cekatm.php';
  static const _CREATE_TABLE_ACTION = 'CREATE_TABLE';
  static const _GET_ALL_ACTION = 'GET_ALL';
  static const _ADD_ACTION = 'ADD';
  static const _UPDATE_ACTION = 'UPDATE';
  static const _DELETE_ACTION = 'DELETE';

  static Future<String> createTable() async {
    try {
      // add the parameters to pass to the request.
      var map = Map<String, dynamic>();
      map['action'] = _CREATE_TABLE_ACTION;
      final response = await http.post(ROOT, body: map);
      print('Create Table Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  static Future<List<Atm>> getAtm() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_ACTION;
      final response = await http.post(ROOT, body: map);
      print('getAtm Response: ${response.body}');
      if (200 == response.statusCode) {
        List<Atm> list = parseResponse(response.body);
        return list;
      } else {
        return List<Atm>();
      }
    } catch (e) {
      return List<Atm>(); // return an empty list on exception/error
    }
  }
  static List<Atm> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Atm>((json) => Atm.fromJson(json)).toList();
  }

//  method add
  static Future<String> addAtm(String branch, String manage, String sartcash, String cashout, String persentation) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _ADD_ACTION;
      map['branch'] = branch;
      map['manage'] = manage;
      map['StartCash'] = sartcash;
      map['CashOut'] = cashout;
      map['Persentation'] = persentation;
      final response = await http.post(ROOT, body: map);
      print('addAtm Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  // Method Update
  static Future<String> updateAtm(String id, String branch, String manage, String sartcash, String cashout, String persentation) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _UPDATE_ACTION;
      map['id'] = id;
      map['branch'] = branch;
      map['kelola'] = manage;
      map['StartCash'] = sartcash;
      map['CashOut'] = cashout;
      map['Persentation'] = persentation;
      final response = await http.post(ROOT, body: map);
      print('updateAtm Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  // Method Delete
  static Future<String> deleteAtm(String atmId) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _DELETE_ACTION;
      map['atm_id'] = atmId;
      final response = await http.post(ROOT, body: map);
      print('deleteAtm Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
}