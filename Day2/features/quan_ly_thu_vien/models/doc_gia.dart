import '../models/sach.dart';

class DocGia {
  String _maDocGia;
  String _hoTen;
  List<Sach> _sachDangMuon = [];

  // constructor
  DocGia(this._maDocGia, this._hoTen);

  // getters
  String get maDocGia => _maDocGia;
  String get hoTen => _hoTen;
  List<Sach> get sachDangMuon => _sachDangMuon;

  // setters
  set maDocGia(String maDocGia) {
    if (maDocGia.isNotEmpty) {
      _maDocGia = maDocGia;
    }
  }

  set hoTen(String hoTen) {
    if (hoTen.isNotEmpty) {
      _hoTen = hoTen;
    }
  }

  // phương thức mượn sách
  void muonSach(Sach sach) {
    if (!_sachDangMuon.contains(sach)) {
      _sachDangMuon.add(sach);
      sach.trangThai = true;
    } else {
      print('Sách đã được đăng ký.');
    }
  }

  // phương thức trả sách
  void traSach(Sach sach) {
    if (_sachDangMuon.contains(sach)) {
      _sachDangMuon.remove(sach);
      sach.trangThai = false;
    } else {
      print('Sách không đang mượn.');
    }
  }
}

void main() {
  DocGia docGia = new DocGia('DG001', 'Nguyễn Văn A');
  Sach sach1 = Sach('S01', 'Toán học cơ bản', 'Nguyễn Văn B', false);
  Sach sach2 = Sach('S02', 'Văn học cơ bản', 'Nguyễn Văn C', false);
  docGia.muonSach(sach1);
  docGia.muonSach(sach2);
  print('Sách đang mượn:');
  for (Sach sach in docGia.sachDangMuon) {
    print(sach.maSach);
    print(
        'Trạng thái sách (true = mượn, false = không mượn): ${sach.trangThai}');
  }
}
