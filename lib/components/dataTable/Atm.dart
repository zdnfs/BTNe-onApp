class Atm {
  String id;
  String branch;
  String manage;
  String startcash;
  String cashout;
  String persentation;

  Atm ({this.id, this.branch, this.manage, this.cashout, this.persentation, this.startcash});

  factory Atm.fromJson(Map<String, dynamic>json){
    return Atm(
      id: json['id'] as String,
      branch: json['id'] as String,
      manage: json['id'] as String,
      cashout: json['id'] as String,
      persentation: json['id'] as String,
      startcash: json['id'] as String,
    );
  }
}