class Sach {
  String _maSach;
  String _tenSach;
  String _tacGia;
  bool _trangThaiMuon;

  // Constructor
  Sach(String maSach, String tenSach, String tacGia, bool trangThaiMuon)
      : _maSach = '',
        _tenSach = '',
        _tacGia = '',
        _trangThaiMuon = trangThaiMuon {
    this.maSach = maSach;
    this.tenSach = tenSach;
    this.tacGia = tacGia;
  }

  // Getter và Setter
  String get maSach => _maSach;

  set maSach(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Ma sach khong duoc rong');
    }
    _maSach = value;
  }

  String get tenSach => _tenSach;

  set tenSach(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Ten sach khong duoc rong');
    }
    _tenSach = value;
  }

  String get tacGia => _tacGia;

  set tacGia(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Tac gia khong duoc rong');
    }
    _tacGia = value;
  }

  bool get trangThaiMuon => _trangThaiMuon;

  set trangThaiMuon(bool value) {
    _trangThaiMuon = value;
  }

  void hienThiThongTin() {
    print('Ma sach: $_maSach');
    print('Ten sach: $_tenSach');
    print('Tac gia: $_tacGia');
    print('Trang thai muon: ${_trangThaiMuon ? 'Da muon' : 'Chua muon'}');
  }
}

void main() {
  try {
    var sach = Sach('S001', 'Lap trinh Dart', 'Nguyen Van A', false);
    sach.hienThiThongTin();
    sach.maSach = '';
  } catch (e) {
    print('Loi: $e');
  }
}
