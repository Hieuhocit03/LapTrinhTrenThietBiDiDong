// Lớp SinhVien
class SinhVien {
  String _hoTen;
  int _tuoi;
  String _maSV;
  double _diemTB;

  // constructor
  SinhVien(this._hoTen, this._tuoi, this._maSV, this._diemTB);

  // getters
  String get hoTen => _hoTen;
  int get tuoi => _tuoi;
  String get masv => _maSV;
  double get diemTB => _diemTB;

  // setters
  set hoTen(String hoTen) {
    if (hoTen.isNotEmpty) {
      _hoTen = hoTen;
    }
  }

  set tuoi(int tuoi) {
    // if (tuoi > 0) {
    //   _tuoi = tuoi;
    // }
    _tuoi = (tuoi > 0) ? tuoi : _tuoi;
  }

  set masv(String masv) {
    if (masv.isNotEmpty) {
      _maSV = masv;
    }
  }

  set diemTB(double diemTB) {
    if (diemTB >= 0 && diemTB <= 10) {
      _diemTB = diemTB;
    }
  }

  void hienThiThongTin() {
    print('Họ tên: $_hoTen');
    print('Tuổi: $_tuoi');
    print('Mã số sinh viên: $_maSV');
    print('Điểm TB: $_diemTB');
  }

  String xepLoai() {
    if (_diemTB >= 8.0) return "Giỏi";
    if (_diemTB >= 6.5) return "Khá";
    if (_diemTB >= 5.0) return "Trung bình";
    return "Yếu";
  }
}

// Lớp LopHoc
class LopHoc {
  String _tenLop;
  List<SinhVien> _danhSachSV = [];

  // constructor
  LopHoc(this._tenLop);

  // getters
  String get tenLop => _tenLop;
  List<SinhVien> get danhSachSV => _danhSachSV;

  // setters
  set tenLop(String tenLop) {
    if (tenLop.isNotEmpty) {
      _tenLop = tenLop;
    }
  }

  // Thêm sinh viên
  void themSinhVien(SinhVien sv) => _danhSachSV.add(sv);

  void hienThiDanhSach() {
    print('\n----------------------------------------');
    print('\n----------------------------------------');
    print('\nDanh sách sinh viên lớp $_tenLop');
    for (var sv in _danhSachSV) {
      print('\n----------------------------------------');
      sv.hienThiThongTin();
      print('\nXếp loại: ${sv.xepLoai()}');
    }
  }
}

// Test
void main() {
  var sv = SinhVien('Nguyen Van A', 20, 'SV001', 8.5);
  print('Test getter: ${sv.hoTen}');
  sv.hoTen = 'Nguyen Van B';
  print('Sau khi test: ${sv.hoTen}');
  print('Xếp loại: ${sv.xepLoai()}');

  var lop = LopHoc('21DTHD5');
  lop.themSinhVien(SinhVien('Nguyen Van A', 20, 'SV001', 8.5));
  lop.themSinhVien(SinhVien('Nguyen Van B', 21, 'SV002', 6.5));
  lop.themSinhVien(SinhVien('Nguyen Van C', 22, 'SV003', 5.5));
  lop.themSinhVien(SinhVien('Nguyen Van D', 23, 'SV004', 4));
  lop.hienThiDanhSach();
}
