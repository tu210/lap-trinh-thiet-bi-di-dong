class DienThoai {
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuongTonKho;
  bool _coKinhDoanh;

  //construct
  DienThoai(this._maDienThoai, this._tenDienThoai, this._hangSanXuat,
      this._giaNhap, this._giaBan, this._soLuongTonKho, this._coKinhDoanh);

  // Getters
  String get maDienThoai => _maDienThoai;
  String get tenDienThoai => _tenDienThoai;
  String get hangSanXuat => _hangSanXuat;
  double get giaNhap => _giaNhap;
  double get giaBan => _giaBan;
  int get soLuongTonKho => _soLuongTonKho;
  bool get coKinhDoanh => _coKinhDoanh;

  // Setters
  set maDienThoai(String maDienThoai) => _maDienThoai =
      (maDienThoai.isEmpty || !RegExp(r'^DT-\d{3}$').hasMatch(maDienThoai))
          ? throw ArgumentError("Ma dien thoai phai co dinh dang 'DT-XXX'.")
          : maDienThoai;
  set tenDienThoai(String tenDienThoai) =>
      _tenDienThoai = (tenDienThoai.isNotEmpty)
          ? tenDienThoai
          : throw ArgumentError("Ten dien thoai khong duoc de trong");
  set hangSanXuat(String hangSanXuat) => _hangSanXuat = (hangSanXuat.isNotEmpty)
      ? hangSanXuat
      : throw ArgumentError("Ten hang khong duoc de trong");
  set giaNhap(double giaNhap) =>
      _giaNhap = (giaNhap > 0) ? giaNhap : throw ArgumentError("Gia nhap > 0");
  set giaBan(double giaBan) => _giaBan = (giaBan > 0 && giaBan > _giaNhap)
      ? giaBan
      : throw ArgumentError("Gia ban phai lon hon 0 va lon hon gia nhap.");
  set soLuongTonKho(int soLuongTonKho) => _soLuongTonKho = (soLuongTonKho >= 0)
      ? soLuongTonKho
      : throw ArgumentError("So luong ton kho >= 0");
  set coKinhDoanh(bool coKinhDoanh) => _coKinhDoanh = coKinhDoanh;

  double tinhLoiNhuan() => _giaBan - _giaNhap;

  void hienThiThongTin() {
    print('Ma dien thoai: $_maDienThoai');
    print('Ten dien thoai: $_tenDienThoai');
    print('Hang san xuat: $_hangSanXuat');
    print('Gia nhap: $_giaNhap');
    print('Gia ban: $_giaBan');
    print('So luong ton kho: $_soLuongTonKho');
    print(
        'Kinh doanh: ${_coKinhDoanh ? 'Con kinh doanh' : 'Ngung kinh doanh'}');
    // print('Loi nhuan: ${tinhLoiNhuan()}');
  }

  bool kiemTraCoTheBanKhong() {
    if (_soLuongTonKho <= 0 || !_coKinhDoanh) return false;
    return true;
  }
}
