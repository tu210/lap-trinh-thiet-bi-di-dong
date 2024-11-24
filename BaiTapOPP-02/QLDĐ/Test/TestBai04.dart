import '../models/CuaHang.dart';
import '../models/DienThoai.dart';
import '../models/HoaDon.dart';

class Test {
  // Thuoc tinh luu tru cua hang
  final CuaHang cuaHang = CuaHang("CellPhoneS", "Tp.HCM");

  // Kiem tra chuc nang quan ly dien thoai
  void testQuanLyDienThoai() {
    print("\n---  Quan ly Dien Thoai ---");

    // Them dien thoai moi
    try {
      cuaHang.themDienThoai(DienThoai("DT-001", "iPhone 15", "Apple", 20000, 25000, 10, true));
      cuaHang.themDienThoai(DienThoai("DT-002", "Galaxy S24", "Samsung", 15000, 18000, 5, true));
      cuaHang.themDienThoai(DienThoai("DT-003", "Xiaomi 14", "Xiaomi", 10000, 12000, 8, true));
      print("Them dien thoai thanh cong!");
    } catch (e) {
      print("Loi khi them dien thoai: $e");
    }

    // Cap nhat thong tin dien thoai
    try {
      var dtCanSua = cuaHang.timKiemDienThoaiTheoMa("DT-001").first;
      dtCanSua.tenDienThoai = "iPhone 15 Pro";
      dtCanSua.giaNhap = 22000; // Gia nhap moi
      print("Cap nhat thong tin thanh cong!");
    } catch (e) {
      print("Loi khi cap nhat thong tin dien thoai: $e");
    }

    // Kiem tra validation
    try {
      cuaHang.themDienThoai(DienThoai("", "Invalid", "Unknown", -1000, 500, -10, false));
    } catch (e) {
      print("Validation hoat dong: $e");
    }
  }

  // Kiem tra chuc nang quan ly hoa don
  void testQuanLyHoaDon() {
    print("\n---  Quan ly Hoa Don ---");

    // Tao hoa don hop le
    try {
      var dt1 = cuaHang.timKiemDienThoaiTheoMa("DT-001").first;
      cuaHang.taoHoaDon(HoaDon("HD-001", DateTime(2024, 11, 15), dt1, 2, 25000, "Nguyen Van A", "0123456789"));
      print("Hoa don hop le duoc them thanh cong!");
    } catch (e) {
      print("Loi khi them hoa don: $e");
    }

    // Tao hoa don khong hop le (ton kho khong du)
    try {
      var dt2 = cuaHang.timKiemDienThoaiTheoMa("DT-002").first;
      cuaHang.taoHoaDon(HoaDon("HD-002", DateTime(2024, 11, 16), dt2, 10, 18000, "Nguyen Van B", "0987654321"));
    } catch (e) {
      print("Validation ton kho hoat dong: $e");
    }

    // Tinh toan tien va loi nhuan
    try {
      var tongTien = cuaHang.tinhTongDoanhThu(DateTime(2024, 11, 14), DateTime(2024, 11, 16));
      var loiNhuan = cuaHang.tinhTongLoiNhuan(DateTime(2024, 11, 14), DateTime(2024, 11, 16));
      print("Tong doanh thu: $tongTien");
      print("Tong loi nhuan: $loiNhuan");
    } catch (e) {
      print("Loi khi tinh toan: $e");
    }
  }

  // Kiem tra chuc nang thong ke bao cao
  void testThongKeBaoCao() {
    print("\n--- Test Thong Ke Bao Cao ---");

    // Doanh thu theo thoi gian
    var doanhThu = cuaHang.tinhTongDoanhThu(DateTime(2024, 11, 14), DateTime(2024, 11, 16));
    print("Doanh thu tu 14/11/2024 den 16/11/2024: $doanhThu");

    var loiNhuan = cuaHang.tinhTongLoiNhuan(DateTime(2024, 11, 14), DateTime(2024, 11, 16));
    print("Loi nhuan tu 14/11/2024 den 16/11/2024: $loiNhuan");

    var topBanChay = cuaHang.thongKeBanChay();
    print("Top dien thoai ban chay:");
    topBanChay.forEach((ma, sl) {
      print("Ma dien thoai: $ma, So luong: $sl");
    });

    var tonKho = cuaHang.thongKeTonKho();
    print("Bao cao ton kho:");
    tonKho.forEach((ma, sl) {
      print("Ma dien thoai: $ma, So luong ton kho: $sl");
    });
  }
}

void main() {
  print("\n=== BAT DAU KIEM THU ===");
  Test test = Test();

  test.testQuanLyDienThoai();
  test.testQuanLyHoaDon();
  test.testThongKeBaoCao();

  print("\n=== KET THUC KIEM THU ===");
}
