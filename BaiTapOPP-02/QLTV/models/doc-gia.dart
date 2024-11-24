import '../models/sach.dart';

class DocGia {
  String _maDocGia;
  String _hoTen;
  List<Sach> _danhSachMuon;

  // Constructor
  DocGia(this._maDocGia, this._hoTen)
      : _danhSachMuon = [] {
    this.maDocGia = _maDocGia;
    this.hoTen = _hoTen;
  }

  // Getter và Setter
  String get maDocGia => _maDocGia;

  set maDocGia(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Ma doc gia khong duoc rong');
    }
    _maDocGia = value;
  }

  String get hoTen => _hoTen;

  set hoTen(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Ho ten khong duoc rong');
    }
    _hoTen = value;
  }

  List<Sach> get danhSachMuon => _danhSachMuon;

  void muonSach(Sach sach) {
    if (sach.trangThaiMuon) {
      print('Sach "${sach.tenSach}" da co nguoi muon');
    } else {
      _danhSachMuon.add(sach);
      sach.trangThaiMuon = true;
      print('Muon sach "${sach.tenSach}" thanh cong');
    }
  }

  void traSach(Sach sach) {
    if (_danhSachMuon.contains(sach)) {
      _danhSachMuon.remove(sach);
      sach.trangThaiMuon = false;
      print('Tra sach "${sach.tenSach}" thanh cong');
    } else {
      print('Khong the tra sach "${sach.tenSach}", vi doc gia chua muon');
    }
  }

  void hienThiDanhSachMuon() {
    print('Danh sach sach dang muon cua doc gia $_hoTen:');
    if (_danhSachMuon.isEmpty) {
      print('Khong co sach nao trong danh sach muon');
    } else {
      for (var sach in _danhSachMuon) {
        print('- ${sach.tenSach} (${sach.tacGia})');
      }
    }
  }
}

void main() {
  var sach1 = Sach('S001', 'Lap trinh Dart', 'Nguyen Van A', false);
  var sach2 = Sach('S002', 'Lap trinh Flutter', 'Nguyen Van B', false);
  var docGia = DocGia('DG001', 'Tran Van C');

  docGia.muonSach(sach1);
  docGia.muonSach(sach1); 
  docGia.muonSach(sach2); 

  
  docGia.hienThiDanhSachMuon();
  docGia.traSach(sach1);
  docGia.traSach(sach1); 
  docGia.hienThiDanhSachMuon();
}