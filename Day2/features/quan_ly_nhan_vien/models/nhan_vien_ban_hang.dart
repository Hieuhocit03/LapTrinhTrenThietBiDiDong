import 'nhan_vien.dart';

class NhanVienBanHang extends NhanVien {
  double _doanhSo;
  double _hoaHong;

  // constructor
  NhanVienBanHang(String maNV, String hoTen, double luongCoBan, this._doanhSo,
      this._hoaHong)
      : super(maNV, hoTen, luongCoBan);

  // getters
  double get doanhSo => _doanhSo;
  double get hoaHong => _hoaHong;

  // setters
  set doanhSo(double doanhSo) {
    if (doanhSo >= 0) {
      _doanhSo = doanhSo;
    }
  }

  set hoaHong(double hoaHong) {
    if (hoaHong >= 0 && hoaHong <= 1) {
      _hoaHong = hoaHong;
    }
  }

  @override
  double tinhLuong() {
    return luongCoBan + (_doanhSo * _hoaHong);
  }

  @override
  void hienThiThongTin() {
    super.hienThiThongTin();
    print('Doanh số: $doanhSo');
    print('Tỷ lệ Hoa hồng: ${hoaHong * 100}%');
  }
}
