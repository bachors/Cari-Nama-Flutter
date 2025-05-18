class Nama {
  String arti = "";
  String asal = "";
  String kelamin = "";
  String nama = "";

  Nama(this.arti, this.asal, this.kelamin, this.nama);

  Nama.fromJson(Map<String, dynamic> json) {
    arti = json['arti'];
    asal = json['asal'];
    kelamin = json['kelamin'];
    nama = json['nama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['arti'] = arti;
    data['asal'] = asal;
    data['kelamin'] = kelamin;
    data['nama'] = nama;
    return data;
  }
}