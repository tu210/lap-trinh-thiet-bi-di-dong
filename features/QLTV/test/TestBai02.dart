import '../models/doc-gia.dart';
import '../models/sach.dart';
import '../models/ThuVien.dart';

class TestBai2 {
  void runTests() {
    var thuVien = ThuVien();

    var sach1 = Sach('S001', 'Lap trinh Dart', 'Nguyen Van A', false);
    var sach2 = Sach('S002', 'Lap trinh Flutter', 'Nguyen Van B', false);
    var sach3 = Sach('S003', 'Lap trinh Mobile', 'Nguyen Van C', false);

  
    thuVien.themSach(sach1);
    thuVien.themSach(sach2);
    thuVien.themSach(sach3);

    
    thuVien.hienThiDanhSachSach();
    print('Ma sach ban dau: ${sach1.maSach}');
    sach1.maSach = 'S100';
    print('Ma sach sau khi thay doi: ${sach1.maSach}');

    print('Ten sach ban dau: ${sach2.tenSach}');
    sach2.tenSach = 'Lap trinh Advanced Flutter';
    print('Ten sach sau khi thay doi: ${sach2.tenSach}');

    print('Tac gia ban dau: ${sach3.tacGia}');
    sach3.tacGia = 'Nguyen Van D';
    print('Tac gia sau khi thay doi: ${sach3.tacGia}');

    print('\n--- Test: Quy trình mượn/trả sách ---');
    
    var docGia1 = DocGia('DG001', 'Tran Van C');
    var docGia2 = DocGia('DG002', 'Le Thi D');

    
    thuVien.themDocGia(docGia1);
    thuVien.themDocGia(docGia2);

  
    print('\nDoc gia ${docGia1.hoTen} muon sach "${sach1.tenSach}"');
    docGia1.muonSach(sach1);
    print('Trang thai sach "${sach1.tenSach}": ${sach1.trangThaiMuon ? "Da muon" : "Chua muon"}');

    print('\nDoc gia ${docGia2.hoTen} muon sach "${sach1.tenSach}"');
    docGia2.muonSach(sach1);

    // Kiểm tra trả sách
    print('\nDoc gia ${docGia1.hoTen} tra sach "${sach1.tenSach}"');
    docGia1.traSach(sach1);
    print('Trang thai sach "${sach1.tenSach}": ${sach1.trangThaiMuon ? "Da muon" : "Chua muon"}');

    print('\nDoc gia ${docGia2.hoTen} muon sach "${sach1.tenSach}"');
    docGia2.muonSach(sach1);

    // Kiểm tra mượn sách khác
    print('\nDoc gia ${docGia2.hoTen} muon sach "${sach2.tenSach}"');
    docGia2.muonSach(sach2);

    print('\nDanh sach sach doc gia ${docGia2.hoTen} da muon:');
    for (var sach in docGia2.danhSachMuon) {
      print('- ${sach.tenSach}');
    }
  }
}

void main() {
  var testBai2 = TestBai2();
  testBai2.runTests();
}
