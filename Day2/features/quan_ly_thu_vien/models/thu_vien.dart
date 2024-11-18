import '../models/sach.dart';
import '../models/doc_gia.dart';

class ThuVien {
  List<Sach> _sachs = [];
  List<DocGia> _docGias = [];

  // getters
  List<Sach> get sachs => _sachs;
  List<DocGia> get docGias => _docGias;

  // phương thức thêm sách
  void themSach(Sach sach) => _sachs.add(sach);

  // phương thức thêm độc giả
  void themDocGia(DocGia docgia) => _docGias.add(docgia);

  void hienThiDanhSach() {
    if (_sachs.isEmpty) {
      print('Không có sách nào');
    } else {
      print('\n');
      print('Danh sách sách:');
      _sachs.forEach((sach) => print(
          'ID: ${sach.maSach}, Tên sách: ${sach.tenSach}, Tác giả: ${sach.tacGia}, Trạng thái: ${sach.trangThai}'));
      print('\n');
    }
  }
}
