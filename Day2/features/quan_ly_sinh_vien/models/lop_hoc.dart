import '../models/sinh_vien.dart';

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
