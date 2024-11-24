
class SinhVien {
  // Thuộc tính
  String _hoTen; // Họ tên (private)
  int _tuoi; // Tuổi (private)
  String _maSinhVien; // Mã sinh viên (private)
  double _diemTrungBinh; // Điểm trung bình (private)

  // Constructor
  SinhVien(this._hoTen, this._tuoi, this._maSinhVien, this._diemTrungBinh);

  // Getter và Setter cho họ tên
  String get hoTen => _hoTen;
  set hoTen(String value) {
    if (value.isNotEmpty) {
      _hoTen = value;
  }
  }

  // Getter và Setter cho tuổi
  int get tuoi => _tuoi;
  set tuoi(int value) {
    if (value > 0) {
      _tuoi = value;
    } 
  }

  // Getter và Setter cho mã sinh viên
  String get maSinhVien => _maSinhVien;
  set maSinhVien(String value) {
    if (value.isNotEmpty) {
      _maSinhVien = value;
    }
  }

  // Getter và Setter cho điểm trung bình
  double get diemTrungBinh => _diemTrungBinh;
  set diemTrungBinh(double value) {
    if (value >= 0 && value <= 10) {
      _diemTrungBinh = value;
    } 
  }

  // Phương thức hiển thị thông tin sinh viên
  void hienThiThongTin() {
    print("Thông tin sinh viên:");
    print("Họ tên: $_hoTen");
    print("Tuổi: $_tuoi");
    print("Mã sinh viên: $_maSinhVien");
    print("Điểm trung bình: $_diemTrungBinh");
    print("Xếp loại: ${xepLoai()}");
  }

  // Phương thức xếp loại dựa trên điểm trung bình
  String xepLoai() {
    if (_diemTrungBinh >= 8.0) {
      return "Giỏi";
    } else if (_diemTrungBinh >= 6.5) {
      return "Khá";
    } else if (_diemTrungBinh >= 5.0) {
      return "Trung bình";
    } else {
      return "Yếu";
    }
  }
}
class LopHoc {
  // Thuộc tính
  String _tenLop; // Tên lớp (private)
  List<SinhVien> _danhSachSinhVien = []; // Danh sách sinh viên

  // Constructor
  LopHoc(this._tenLop);

  // Getter và Setter cho tên lớp
  String get tenLop => _tenLop;
  set tenLop(String value) {
    if (value.isNotEmpty) {
      _tenLop = value;
    } else {
      print("Tên lớp không được để trống!");
    }
  }

  // Phương thức thêm sinh viên vào lớp
  void themSinhVien(SinhVien sinhVien) {
    _danhSachSinhVien.add(sinhVien);
    print("Đã thêm sinh viên ${sinhVien.hoTen} vào lớp $_tenLop.");
  }

  // Phương thức hiển thị danh sách sinh viên của lớp
  void hienThiDanhSachSinhVien() {
    print("Danh sách sinh viên của lớp $_tenLop:");
    if (_danhSachSinhVien.isNotEmpty) {
      for (int i = 0; i < _danhSachSinhVien.length; i++) {
        print("\nSinh viên ${i + 1}:");
        _danhSachSinhVien[i].hienThiThongTin();
      }
    } else {
      print("Lớp $_tenLop chưa có sinh viên nào.");
    }
  }
}
