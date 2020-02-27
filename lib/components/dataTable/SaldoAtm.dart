class SaldoAtm {
  int id;
  String branch;
  String kelola;
  String start;
  String outcash;
  String persentase;

  SaldoAtm({this.id, this.branch, this.kelola, this.start, this.outcash, this.persentase});

  static List<SaldoAtm>getSaldoAtm(){
    return<SaldoAtm>[
      SaldoAtm(id:001, branch:"tes", kelola:"tes", start:"tes", outcash:"tes", persentase:"tes"),
      SaldoAtm(id:002, branch:"tes", kelola:"tes", start:"tes", outcash:"tes", persentase:"tes"),
    ];
  }

}