import 'DienThoai.dart';
import 'HoaDon.dart';

class CuaHang {
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _dienThoais = [];
  List<HoaDon> _hoaDons = [];

  //constructor
  CuaHang(this._tenCuaHang, this._diaChi);

  // Getters
  String get tenCuaHang => _tenCuaHang;
  String get diaChi => _diaChi;

  // Setters
  set tenCuaHang(String value) => _tenCuaHang = (value.isNotEmpty)
      ? value
      : throw ArgumentError("Ten cua hang khong de trong");
  set diaChi(String value) => _diaChi = (value.isNotEmpty)
      ? value
      : throw ArgumentError("Dia chi cua hang khong de trong");

  void themDienThoai(DienThoai dienThoai) {
    if (dienThoai.kiemTraCoTheBanKhong()) {
      _dienThoais.add(dienThoai);
      print('Dien thoai ${dienThoai.tenDienThoai} da them thanh cong');
    } else {
      throw Exception(
          'Khong the them dien thoai ${dienThoai.tenDienThoai}: Khong hop le hoac khong the ban');
    }
  }

  void capNhatThongTinDienThoai(DienThoai dienThoai) {
    int index = _dienThoais.indexOf(dienThoai);
    if (index != -1) {
      _dienThoais[index] = dienThoai;
      print(
          'Thong tin dien thoai cua ${dienThoai.tenDienThoai} da cap nhat thanh cong');
    } else {
      print('Khong tim thay dien thoai de cap nhat');
    }
  }

  void ngungKinhDoanhDienThoai(DienThoai dienThoai) {
    int index = _dienThoais.indexOf(dienThoai);
    if (index != -1) {
      _dienThoais[index].coKinhDoanh = false;
      print('Dien thoai ${dienThoai.tenDienThoai} da ngung kinh doanh thanh cong');
    } else {
      print('Khong tim thay dien thoai de ngung kinh doanh');
    }
  }

  List<DienThoai> timKiemDienThoaiTheoMa(String ma) {
    return _dienThoais
        .where((dt) => dt.maDienThoai.toLowerCase().contains(ma.toLowerCase()))
        .toList();
  }

  List<DienThoai> timKiemDienThoaiTheoTen(String ten) {
    return _dienThoais
        .where(
            (dt) => dt.tenDienThoai.toLowerCase().contains(ten.toLowerCase()))
        .toList();
  }

  List<DienThoai> timKiemDienThoaiTheoHang(String hang) {
    return _dienThoais
        .where(
            (dt) => dt.hangSanXuat.toLowerCase().contains(hang.toLowerCase()))
        .toList();
  }

  void hienThiDanhSachDienThoai() {
    print('Danh sach dien thoai cua hang:');
    for (var dienThoai in _dienThoais) {
      dienThoai.hienThiThongTin();
    }
  }

  void taoHoaDon(HoaDon hoadon) {
    _hoaDons.add(hoadon);
    hoadon.dienThoaiDuocBan.soLuongTonKho -= hoadon.soLuongMua;
    print('Hoa don moi da tao thanh cong');
  }

  List<HoaDon> timKiemHoaDonTheoMa(String ma) {
    return _hoaDons
        .where((hd) => hd.maHoaDon.toLowerCase().contains(ma.toLowerCase()))
        .toList();
  }

  List<HoaDon> timKiemHoaDonTheoTenKhachHang(String ten) {
    return _hoaDons
        .where(
            (hd) => hd.tenKhachHang.toLowerCase().contains(ten.toLowerCase()))
        .toList();
  }

  List<HoaDon> timKiemHoaDonTheoNgayBan(DateTime ngayBan) {
    return _hoaDons
        .where((hd) => hd.ngayBan.isAtSameMomentAs(ngayBan))
        .toList();
  }

  // Hien thi danh sach hoa don
  void hienThiDanhSachHoaDon() {
    print('Danh sach hoa don cua hang:');
    for (var hoaDon in _hoaDons) {
      hoaDon.hienThiThongTinHoaDon();
    }
  }

  double tinhTongDoanhThu(DateTime ngayBatDau, DateTime ngayKetThuc) {
    return _hoaDons
        .where((hd) =>
            hd.ngayBan.isAfter(ngayBatDau) && hd.ngayBan.isBefore(ngayKetThuc))
        .fold(0, (tong, hd) => tong + hd.tinhTongTien());
  }

  double tinhTongLoiNhuan(DateTime ngayBatDau, DateTime ngayKetThuc) {
    return _hoaDons
        .where((hd) =>
            hd.ngayBan.isAfter(ngayBatDau) && hd.ngayBan.isBefore(ngayKetThuc))
        .fold(0, (tong, hd) => tong + hd.tinhLoiNhuanThucTe());
  }

  Map<String, int> thongKeBanChay() {
    Map<String, int> thongKe = {};

    for (var hd in _hoaDons) {
      String maDienThoai = hd.dienThoaiDuocBan.maDienThoai;
      thongKe[maDienThoai] = (thongKe[maDienThoai] ?? 0) + hd.soLuongMua;
    }

    var topBanChay = thongKe.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Map.fromEntries(topBanChay);
  }

  Map<String, int> thongKeTonKho() {
    return _dienThoais
        .asMap()
        .map((_, dt) => MapEntry(dt.maDienThoai, dt.soLuongTonKho));
  }
}
