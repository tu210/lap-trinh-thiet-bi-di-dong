import 'DienThoai.dart';

class HoaDon {
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoaiDuocBan;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoaiKhach;

  //constructor
  HoaDon(
      this._maHoaDon,
      this._ngayBan,
      this._dienThoaiDuocBan,
      this._soLuongMua,
      this._giaBanThucTe,
      this._tenKhachHang,
      this._soDienThoaiKhach);

  // Getters
  String get maHoaDon => _maHoaDon;
  DateTime get ngayBan => _ngayBan;
  DienThoai get dienThoaiDuocBan => _dienThoaiDuocBan;
  int get soLuongMua => _soLuongMua;
  double get giaBanThucTe => _giaBanThucTe;
  String get tenKhachHang => _tenKhachHang;
  String get soDienThoaiKhach => _soDienThoaiKhach;

  // Setters
  set maHoaDon(String value) =>
      _maHoaDon = (value.isNotEmpty || RegExp(r'^HD-\d{3}$').hasMatch(value))
          ? value
          : throw ArgumentError(
              "Ma hoa don khong duoc de trong va phai co dinh dang 'HD-XXX");
  set ngayBan(DateTime value) => _ngayBan = (!value.isAfter(DateTime.now()))
      ? value
      : throw ArgumentError("Ngay ban khong duoc sao ngay hien tai");
  set dienThoaiDuocBan(DienThoai value) => _dienThoaiDuocBan = value;
  set soLuongMua(int value) =>
      _soLuongMua = (value > 0 && value <= _dienThoaiDuocBan.soLuongTonKho)
          ? value
          : throw ArgumentError("So luong mua > 0 va <= so luong ton kho");
  set giaBanThucTe(double value) => giaBanThucTe =
      (value > 0) ? value : throw ArgumentError("Gia ban thuc te > 0");
  set tenKhachHang(String value) => _tenKhachHang = (value.isNotEmpty)
      ? value
      : throw ArgumentError("Ten khach hang khong duoc de trong");
  set soDienThoaiKhach(String value) => _soDienThoaiKhach = (value.isNotEmpty &&
          RegExp(r'^0\d{9}$').hasMatch(value))
      ? value
      : throw ArgumentError(
          "So dien thoai khach hang phai co dinh dang '0XXXXXXXXX' va khong duoc de trong");
  
  double tinhTongTien() => _soLuongMua * _giaBanThucTe;

  double tinhLoiNhuanThucTe() => (_giaBanThucTe - _dienThoaiDuocBan.giaNhap) * _soLuongMua;

  void hienThiThongTinHoaDon() {
    print("Ma hoa don: $_maHoaDon");
    print("Ngay ban: ${_ngayBan.toLocal()}");
    print("Dien thoai da ban: ${_dienThoaiDuocBan.maDienThoai}");
    print("So luong mua: $_soLuongMua");
    print("Gia ban thuc te: ${_giaBanThucTe}");
    print("Ten khach hang: $_tenKhachHang");
    print("So dien thoai khach hang: $_soDienThoaiKhach");
    print("Tong tien: ${tinhTongTien()}");
  }
}
