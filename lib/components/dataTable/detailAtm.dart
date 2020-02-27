//import 'package:flutter/material.dart';
//import 'package:traveloka/components/components/dataTable/Atm.dart';
//import 'package:btn_apps/home/detail/DataTable/Services.dart';
//
//class AtmPage extends StatefulWidget {
//
//  AtmPage() : super();
//
//  final String title = 'Atm Page';
//
//  @override
//  _AtmPageState createState() => _AtmPageState();
//}
//
//class _AtmPageState extends State<AtmPage> {
//  List<Atm> _atm;
//  GlobalKey<ScaffoldState> _scaffoldKey;
//  TextEditingController _branchController;
//  TextEditingController _manageController;
//  TextEditingController _startcashController;
//  TextEditingController _cashoutController;
//  TextEditingController _persentationController;
//
//  Atm _selectedAtm;
//  bool _isUpdating;
//  String _titleProgress;
//
//  @override
//  void initState() {
//    super.initState();
//    _atm = [];
//    _isUpdating = false;
//    _titleProgress = widget.title;
//    _scaffoldKey = GlobalKey(); // key to get the context to show a SnackBar
//    _branchController = TextEditingController();
//    _manageController = TextEditingController();
//    _startcashController = TextEditingController();
//    _cashoutController = TextEditingController();
//    _persentationController = TextEditingController();
//    _getAtm();
//  }
//
//  _showProgress(String message){
//    setState(() {
//      _titleProgress = message;
//    });
//  }
//
//  _showSnackBar(context, message){
//    _scaffoldKey.currentState.showSnackBar(
//      SnackBar(
//        content: (message),
//      ),
//    );
//  }
//
////  membuat tabel di db
//  _createTable(){
//    _showProgress('Creating Table...');
//    Services.createTable().then((result){
//      if ('success' == result) {
//        _showSnackBar(context, result);
//        _showProgress(widget.title);
//      }
//    });
//  }
//
//  _addAtm(){
//    if(_branchController.text.isEmpty){
//      print('Empty Fields');
//      return;
//    }
//    _showProgress('Adding...');
//    Services.addAtm(
//        _branchController.text,
//        _manageController.text,
//        _startcashController.text,
//        _cashoutController.text,
//        _persentationController.text
//    )
//        .then((result) {
//      if ('success' == result) {
//        _getAtm(); // Refresh the List after adding each...
//        _clearValues();
//      }
//    });
//  }
//
//  _getAtm(){
//    _showProgress('Loading...');
//    Services.getAtm().then((atm) {
//      setState(() {
//        _atm = atm;
//      });
//      _showProgress(widget.title); // Reset the title...
//      print("Length ${atm.length}");
//    });
//  }
//
//  _updateAtm(Atm atm)
//  {
//    setState((){
//      _isUpdating = true;
//    });
//    _showProgress('updating');
//    Services.updateAtm(
//        atm.id,
//        _branchController.text,
//        _manageController.text,
//        _startcashController.text,
//        _cashoutController.text,
//        _persentationController.text
//    )
//        .then((result) {
//      if ('success' == result) {
//        _getAtm(); // Refresh the list after update
//        setState(() {
//          _isUpdating = false;
//        });
//        _clearValues();
//      }
//    });
//  }
//
//  _deleteAtm(){
////    _showProgress('Deleting Employee...');
////    Services.deleteAtm(atm.id).then((result) {
////      if ('success' == result) {
////        _getAtm(); // Refresh after delete...
////      }
////    });
//  }
//
//  _clearValues(){
//    _branchController.text = '';
//    _manageController.text = '';
//    _startcashController.text = '';
//    _cashoutController.text = '';
//    _persentationController.text = '';
//  }
//
//  SingleChildScrollView _dataBody(){
//    return SingleChildScrollView(
//      scrollDirection: Axis.vertical,
//      child: SingleChildScrollView(
//        scrollDirection: Axis.horizontal,
//        child:
//        DataTable(
//          columns: [
//            DataColumn(
//              label: Text('ID'),
//            ),
//            DataColumn(
//              label: Text('Branch'),
//            ),
//            DataColumn(
//              label: Text('Manage'),
//            ),
//            DataColumn(
//              label: Text('StartCash'),
//            ),
//            DataColumn(
//              label: Text('CashOut'),
//            ),
//            DataColumn(
//              label: Text('Persentation %'),
//            ),
//          ],
//          rows: _atm.map(
//                  (atm) => DataRow(cells: [
//                DataCell(
//                  Text(atm.id),
//                ),
//                DataCell(
//                  Text(atm.branch.toUpperCase()),
//                ),
//                DataCell(
//                  Text(atm.manage.toUpperCase()),
//                ),
//                DataCell(
//                  Text(atm.startcash),
//                ),
//                DataCell(
//                  Text(atm.cashout),
//                ),
//                DataCell(
//                  Text(atm.persentation),
//                ),
//
//              ])
//          )
//              .toList(),
//        ),
//      ),
//    );
//  }
//
//  //  ui
//  @override
//  Widget build(BuildContext context){
//    return Scaffold(
//      key: _scaffoldKey,
//      appBar: AppBar(
//        title: Text(_titleProgress),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.add),
//            onPressed: (){
//              _createTable();
//            },
//          ),
//          IconButton(
//            icon: Icon(Icons.refresh),
//            onPressed: (){
//              _getAtm();
//            },
//          ),
//        ],
//      ),
//
//      body: Container(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            //            bikin kolom
//            Padding(
//              padding: EdgeInsets.all(20.0),
//              child: TextField(
//                controller: _branchController,
//                decoration: InputDecoration.collapsed(
//                  hintText: 'Search',
//                ),
//              ),
//            ),
//            _isUpdating?
//            Row(
//              children: <Widget>[
//                OutlineButton(
//                  child: Text('Update'),
//                  onPressed: (){
//                    _updateAtm(_selectedAtm);
//                  },
//                ),
//                OutlineButton(
//                  child: Text('Cancel'),
//                  onPressed: (){
//                    setState(() {
//                      _isUpdating = false;
//                    });
//                    _clearValues();
//                  },
//                ),
//              ],
//            )
//                : Container(),
//            Expanded(
//              child: _dataBody(),
//            ),
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: (){
//          _addAtm();
//        },
//        child: Icon(Icons.add),
//      ),
//    );
//  }
//}
//
