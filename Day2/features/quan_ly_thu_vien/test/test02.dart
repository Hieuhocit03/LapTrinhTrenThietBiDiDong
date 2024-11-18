import '../models/sach.dart';
import '../models/doc_gia.dart';
import '../models/thu_vien.dart';

void main() {
  // Test tạo và quản lý sách
  var sach1 = Sach('S01', 'Toán học cơ bản', 'Nguyễn Văn A', false);
  var sach2 = Sach('S02', 'Văn học cơ bản', 'Nguyễn Văn B', false);
  var sach3 = Sach('S03', 'Sinh học cơ bản', 'Nguyễn Văn C', false);
  var thuvien = ThuVien();
  thuvien.themSach(sach1);
  thuvien.themSach(sach2);
  thuvien.themSach(sach3);
  thuvien.hienThiDanhSach();

  // Test getters / setters
  print('Test getter: ${sach1.maSach}');
  sach1.maSach = 'S04';
  print('Sau khi test: ${sach1.maSach}');

  // Test quy trình mượn/trả sách
  var docGia1 = DocGia('D01', 'Họ Tên A');
  var docGia2 = DocGia('D02', 'Họ Tên B');
  var docGia3 = DocGia('D03', 'Họ Tên C');
  docGia1.muonSach(sach1);
  docGia2.muonSach(sach3);
  docGia3.muonSach(sach2);
  docGia3.traSach(sach2);

  // Kiểm tra quản lý thư viện
  thuvien.hienThiDanhSach();
}
