import 'package:flutter/material.dart';


class rtgsinTable extends StatefulWidget {
  rtgsinTable() : super();

  final String title = "Detail RTGS Incomming";

  @override
  rtgsinTableState createState() => rtgsinTableState();
}

class rtgsinTableState extends State<rtgsinTable> {
  List<User> users;
  List<User> selectedUsers;
  bool sort;

  @override
  void initState() {
    sort = false;
    selectedUsers = [];
    users = User.getUsers();
    super.initState();
  }

  onSortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        users.sort((a, b) => a.relref.compareTo(b.relref));
      } else {
        users.sort((a, b) => b.relref.compareTo(a.relref));
      }
    }
  }

  onSelectedRow(bool selected, User user) async {
    setState(() {
      if (selected) {
        selectedUsers.add(user);
      } else {
        selectedUsers.remove(user);
      }
    });
  }

  deleteSelected() async {
    setState(() {
      if (selectedUsers.isNotEmpty) {
        List<User> temp = [];
        temp.addAll(selectedUsers);
        for (User user in temp) {
          users.remove(user);
          selectedUsers.remove(user);
        }
      }
    });
  }

  SingleChildScrollView dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        sortAscending: sort,
        sortColumnIndex: 0,
        columns: [
          DataColumn(
              label: Text("TRN"),
              numeric: false,
              tooltip: "TRN",
              onSort: (columnIndex, ascending) {
                setState(() {
                  sort = !sort;
                });
                onSortColum(columnIndex, ascending);
              }),
          DataColumn(
              label: Text("REL-REF"),
              numeric: false,
              tooltip: "REL-REF",
              onSort: (columnIndex, ascending) {
                setState(() {
                  sort = !sort;
                });
                onSortColum(columnIndex, ascending);
              }
          ),
          DataColumn(
              label: Text("FR-MEMBER"),
              numeric: false,
              tooltip: "FR-MEMBER",
              onSort: (columnIndex, ascending) {
                setState(() {
                  sort = !sort;
                });
                onSortColum(columnIndex, ascending);
              }
          ),
          DataColumn(
              label: Text("JITU"),
              numeric: false,
              tooltip: "JITU",
              onSort: (columnIndex, ascending) {
                setState(() {
                  sort = !sort;
                });
                onSortColum(columnIndex, ascending);
              }
          ),
          DataColumn(
              label: Text("CCY"),
              numeric: false,
              tooltip: "CCY",
              onSort: (columnIndex, ascending) {
                setState(() {
                  sort = !sort;
                });
                onSortColum(columnIndex, ascending);
              }
          ),
          DataColumn(
              label: Text("AMOUNT"),
              numeric: false,
              tooltip: "AMOUNT",
              onSort: (columnIndex, ascending) {
                setState(() {
                  sort = !sort;
                });
                onSortColum(columnIndex, ascending);
              }
          ),
          DataColumn(
              label: Text("STATUS"),
              numeric: false,
              tooltip: "STATUS",
              onSort: (columnIndex, ascending) {
                setState(() {
                  sort = !sort;
                });
                onSortColum(columnIndex, ascending);
              }
          ),
          DataColumn(
              label: Text("REASON"),
              numeric: false,
              tooltip: "REASON",
              onSort: (columnIndex, ascending) {
                setState(() {
                  sort = !sort;
                });
                onSortColum(columnIndex, ascending);
              }
          ),
          DataColumn(
              label: Text("DESCRIPTION"),
              numeric: false,
              tooltip: "DESCRIPTION",
              onSort: (columnIndex, ascending) {
                setState(() {
                  sort = !sort;
                });
                onSortColum(columnIndex, ascending);
              }
          ),
        ],
        rows: users
            .map(
              (user) => DataRow(
              selected: selectedUsers.contains(user),
              onSelectChanged: (b) {
                print("Onselect");
                onSelectedRow(b, user);
              },
              cells: [
                DataCell(
                  Text(user.trn),
                  onTap: () {
                    print('Selected ${user.trn}');
                  },
                ),
                DataCell(
                  Text(user.relref),
                  onTap: () {
                    print('Selected ${user.relref}');
                  },
                ),
                DataCell(
                  Text(user.frmember),
                  onTap: () {
                    print('Selected ${user.frmember}');
                  },
                ),
                DataCell(
                  Text(user.jitu),
                  onTap: () {
                    print('Selected ${user.jitu}');
                  },
                ),
                DataCell(
                  Text(user.jitu),
                  onTap: () {
                    print('Selected ${user.ccy}');
                  },
                ),
                DataCell(
                  Text(user.amount),
                  onTap: () {
                    print('Selected ${user.amount}');
                  },
                ),
                DataCell(
                  Text(user.status),
                  onTap: () {
                    print('Selected ${user.status}');
                  },
                ),
                DataCell(
                  Text(user.reason),
                  onTap: () {
                    print('Selected ${user.reason}');
                  },
                ),
                DataCell(
                  Text(user.description),
                  onTap: () {
                    print('Selected ${user.description}');
                  },
                ),
              ]),
        )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Expanded(
            child: dataBody(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(30.0),
                child: OutlineButton(
                  child: Text('SELECTED ${selectedUsers.length}'),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: OutlineButton(
                  child: Text('DELETE SELECTED'),
                  onPressed: selectedUsers.isEmpty
                      ? null
                      : () {
                    deleteSelected();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class User {
  String trn;
  String relref;
  String frmember;
  String jitu;
  String ccy;
  String amount;
  String status;
  String reason;
  String description;

  User({this.trn, this.relref, this.frmember, this.jitu, this.ccy, this.amount,  this.status, this.reason, this.description});

  static List<User> getUsers() {
    return <User>[
      User(trn: "000006", relref: "R152372698/991", frmember: "BTANIDJA", jitu: "10:42:40", ccy: "IDR", amount: "5519000,00", status: "Rp CPT", reason: "IF08", description: " "),

    ];
  }
}