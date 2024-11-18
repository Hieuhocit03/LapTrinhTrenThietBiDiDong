class Sach {
  String _maSach;
  String _tenSach;
  String _tacGia;
  bool _trangThai = false;

  // constructor
  Sach(this._maSach, this._tenSach, this._tacGia, this._trangThai);

  // getters
  String get maSach => _maSach;
  String get tenSach => _tenSach;
  String get tacGia => _tacGia;
  bool get trangThai => _trangThai;

  // setters
  set maSach(String maSach) {
    if (maSach.isNotEmpty) {
      _maSach = maSach;
    }
  }

  set tenSach(String tenSach) {
    if (tenSach.isNotEmpty) {
      _tenSach = tenSach;
    }
  }

  set tacGia(String tacGia) {
    if (tacGia.isNotEmpty) {
      _tacGia = tacGia;
    }
  }

  set trangThai(bool trangThai) {
    _trangThai = trangThai;
  }

  void hienThiThongTin() {
    print('Mã sách: $_maSach');
    print('Tên sách: $_tenSach');
    print('Tác giả: $_tacGia');
    print('Trạng thái: $_trangThai');
  }
}
