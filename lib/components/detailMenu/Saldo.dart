import 'package:flutter/material.dart';


class DataTableDemo extends StatefulWidget {
  DataTableDemo() : super();

  final String title = "Saldo Cash";

  @override
  DataTableDemoState createState() => DataTableDemoState();
}

class DataTableDemoState extends State<DataTableDemo> {
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
        users.sort((a, b) => a.branch.compareTo(b.branch));
      } else {
        users.sort((a, b) => b.branch.compareTo(a.branch));
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
              label: Text("Id"),
              numeric: false,
              tooltip: "Id",
              onSort: (columnIndex, ascending) {
                setState(() {
                  sort = !sort;
                });
                onSortColum(columnIndex, ascending);
              }),
          DataColumn(
            label: Text("Branch"),
            numeric: false,
            tooltip: "Branch",
              onSort: (columnIndex, ascending) {
                setState(() {
                  sort = !sort;
                });
                onSortColum(columnIndex, ascending);
              }
          ),
          DataColumn(
              label: Text("Kelola"),
              numeric: false,
              tooltip: "Kelola",
              onSort: (columnIndex, ascending) {
                setState(() {
                  sort = !sort;
                });
                onSortColum(columnIndex, ascending);
              }
          ),
          DataColumn(
              label: Text("Start Cash"),
              numeric: false,
              tooltip: "Start Cash",
              onSort: (columnIndex, ascending) {
                setState(() {
                  sort = !sort;
                });
                onSortColum(columnIndex, ascending);
              }
          ),
          DataColumn(
              label: Text("Cash Out"),
              numeric: false,
              tooltip: "Cash Out",
              onSort: (columnIndex, ascending) {
                setState(() {
                  sort = !sort;
                });
                onSortColum(columnIndex, ascending);
              }
          ),
          DataColumn(
              label: Text("%"),
              numeric: false,
              tooltip: "Persentase",
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
                  Text(user.id),
                  onTap: () {
                    print('Selected ${user.id}');
                  },
                ),
                DataCell(
                  Text(user.branch),
                  onTap: () {
                    print('Selected ${user.branch}');
                  },
                ),
                DataCell(
                  Text(user.kelola),
                  onTap: () {
                    print('Selected ${user.kelola}');
                  },
                ),
                DataCell(
                  Text(user.startcash),
                  onTap: () {
                    print('Selected ${user.startcash}');
                  },
                ),
                DataCell(
                  Text(user.cashout),
                  onTap: () {
                    print('Selected ${user.cashout}');
                  },
                ),

                DataCell(
                  Text(user.persentase),
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
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('SELECTED ${selectedUsers.length}'),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
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
  String id;
  String branch;
  String kelola;
  String startcash;
  String cashout;
  String persentase;

  User({this.id, this.branch, this.kelola,  this.startcash, this.cashout, this.persentase});

  static List<User> getUsers() {
    return <User>[
      User(id: "001", branch: "NIK XXX", kelola: "XXX", startcash: "Rp 6.000.000", cashout: "Rp 6.000.000", persentase: "87%"),

    ];
  }
}