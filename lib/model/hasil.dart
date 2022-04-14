class Hasil {
  late String? idHasil;
  late String? idPasien;
  late String? idBayar;
  late String? email;
  late String? NIK;
  late String? tglTest;
  late String? waktuTest;
  late String? keterangan;
  late String? namaPetugas;
  late String? informasiTambahan;


  Hasil(
      {this.idHasil,
      this.idPasien,
      this.idBayar,
      this.email,
      this.NIK,
      this.tglTest,
      this.waktuTest,
      this.keterangan,
      this.namaPetugas,
      this.informasiTambahan});
  

  fromMap(Map<String, dynamic> map) {
    idHasil = map['id_hasil']?.toString() ?? '';
    idPasien = map['id_pasien']?.toString() ?? '';
    idBayar = map['id_bayar']?.toString() ?? '';
    email = map['email']?.toString() ?? '';
    NIK = map['NIK']?.toString() ?? '';
    tglTest = map['tanggal_test']?.toString() ?? '';
    waktuTest = map['waktu_test']?.toString() ?? '';
    keterangan = map['keterangan']?.toString() ?? '';
    namaPetugas = map['nama_petugas']?.toString() ?? '';
    informasiTambahan = map['informasi_tambahan']?.toString() ?? '';
  }

  factory Hasil.fromJson(Map<String, dynamic> json) {
    return Hasil(
        idHasil : json['id_hasil']?.toString() ?? '',
        idPasien : json['id_pasien']?.toString() ?? '',
        idBayar: json['id_bayar']?.toString() ?? '',
        email : json['email']?.toString() ?? '',
        NIK : json['NIK']?.toString() ?? '',
        tglTest : json['tanggal_test']?.toString() ?? '',
        waktuTest : json['waktu_test']?.toString() ?? '',
        keterangan: json['keterangan']?.toString() ?? '',
        namaPetugas: json['nama_petugas']?.toString() ?? '',
        informasiTambahan: json['informasi_tambahan']?.toString() ?? '',
    );
  }
}