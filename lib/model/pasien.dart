class Pasien {
  late String? idPasien;
  late String? nama;
  late String? email;
  late String? noHp;
  late String? tglLahir;
  late String? jnsSex;
  late String? nikPasien;

  Pasien(
      {this.idPasien,
      this.nama,
      this.email,
      this.noHp,
      this.tglLahir,
      this.jnsSex,
      this.nikPasien});

  fromMap(Map<String, dynamic> map) {
    idPasien = map['id_pasien']?.toString() ?? '';
    nama = map['nama_pasien']?.toString() ?? '';
    email = map['email']?.toString() ?? '';
    noHp = map['hp']?.toString() ?? '';
    tglLahir = map['tgl_lahir']?.toString() ?? '';
    jnsSex = map['jns_sex']?.toString() ?? '';
    nikPasien = map['nik_pasien']?.toString() ?? '';
  }

  factory Pasien.fromJson(Map<String, dynamic> json) {
    return Pasien(
        idPasien : json['id_pasien']?.toString() ?? '',
        nama : json['nama_pasien']?.toString() ?? '',
        email : json['email']?.toString() ?? '',
        noHp : json['hp']?.toString() ?? '',
        tglLahir : json['tgl_lahir']?.toString() ?? '',
        jnsSex : json['jns_sex']?.toString() ?? '',
        nikPasien : json['nik_pasien']?.toString() ?? '',
    );
  }
}
