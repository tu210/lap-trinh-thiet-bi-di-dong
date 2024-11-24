import '../models/doc-gia.dart';
import '../models/sach.dart';

class ThuVien {
  // Thuộc tính
  List<Sach> _danhSachSach;
  List<DocGia> _danhSachDocGia;

  // Constructor
  ThuVien()
      : _danhSachSach = [],
        _danhSachDocGia = [];

  List<Sach> get danhSachSach => _danhSachSach;

  List<DocGia> get danhSachDocGia => _danhSachDocGia;


  void themSach(Sach sach) {
    _danhSachSach.add(sach);
    print('Them sach "${sach.tenSach}" thanh cong');
  }

  void themDocGia(DocGia docGia) {
    _danhSachDocGia.add(docGia);
    print('Them doc gia "${docGia.hoTen}" thanh cong');
  }

  void hienThiDanhSachSach() {
    print('Danh sach sach trong thu vien:');
    if (_danhSachSach.isEmpty) {
      print('Thu vien chua co sach nao');
    } else {
      for (var sach in _danhSachSach) {
        print('- Ma: ${sach.maSach}, Ten: ${sach.tenSach}, Tac gia: ${sach.tacGia}, Trang thai: ${sach.trangThaiMuon ? "Da muon" : "Chua muon"}');
      }
    }
  }
}

void main() {
  
  var thuVien = ThuVien();
  var sach1 = Sach('S001', 'Lap trinh Dart', 'Nguyen Van A', false);
  var sach2 = Sach('S002', 'Lap trinh Flutter', 'Nguyen Van B', false);

  thuVien.themSach(sach1);
  thuVien.themSach(sach2);

  
  var docGia1 = DocGia('DG001', 'Tran Van C');
  var docGia2 = DocGia('DG002', 'Nguyen Thi D');

  thuVien.themDocGia(docGia1);
  thuVien.themDocGia(docGia2);
  thuVien.hienThiDanhSachSach();
}
