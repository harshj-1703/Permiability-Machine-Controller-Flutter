class Permiability {
  String id;
  String ID1;
  String time;
  String gas;
  String temp;
  String test;
  String pmax;
  String pmin;
  String pavg;
  String gmax;
  String gmin;
  String gavg;

  Permiability(this.id, this.ID1, this.time, this.gas, this.temp, this.test,
      this.pmax, this.pmin, this.pavg, this.gmax, this.gmin, this.gavg);

  factory Permiability.fromJSON(Map<String, dynamic> json) {
    return Permiability(
      json['id'],
      json['ID1'],
      json['time'],
      json['gas'],
      json['temp'],
      json['test'],
      json['pmax'],
      json['pmin'],
      json['pavg'],
      json['gmax'],
      json['gmin'],
      json['gavg'],
    );
  }
}
