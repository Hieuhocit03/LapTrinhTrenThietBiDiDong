import '../models/sach.dart';
import '../models/doc_gia.dart';

class ThuVien {
  List<Sach> _sachs = [];
  List<DocGia> _docGias = [];

  // getters
  List<Sach> get sachs => _sachs;
  List<DocGia> get docGias => _docGias;

  // methods
  void themSach(Sach sach) => _sachs.add(sach);

  void themDocGia(DocGia docgia) => _docGias.add(docgia);

  void hienThiDanhSach() {
    if (_sachs.isEmpty) {
      print('Không có sách nào');
    } else {
      print('Danh sách sách:');
      _sachs.forEach((sach) => print(
          'ID: ${sach.maSach}, Tên sách: ${sach.tenSach}, Tác giả: ${sach.tacGia}, Trạng thái: ${sach.trangThai}'));
    }
  }
}
