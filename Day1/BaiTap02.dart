// BaiTap02.dart;
// Giai phuong trinh bac 2: ax^2+bx+c = 0;
import 'dart:io';
import 'dart:math';

void main() {
  // Khai bao he so a
  double? a;
  // Kiem tra he so a co dap ung dieu kien khong ?
  do {
    // Nhap he so a
    stdout.write('Nhập hệ số a (a != 0): ');
    a = double.tryParse(stdin.readLineSync() ?? "");
    // Kiem tra dieu kien
    if (a == null || a == 0) {
      // In thong bao loi
      print('Hệ số a phải là số và khác 0. Vui lòng nhập lại!');
    }
  } while (a == null || a == 0);

  // Nhap he so b
  double b;
  // Kiem tra he so b co dap ung dieu kien khong ?
  do {
    stdout.write('Nhập hệ số b: ');
    b = double.tryParse(stdin.readLineSync() ?? "") ?? double.nan;
    // Kiem tra dieu kien
    if (b.isNaN) {
      // In thong bao loi
      print('Hệ số b phải là số. Vui lòng nhập lại!');
    }
  } while (b.isNaN);

  // Nhap he so c
  double c;
  // Kiem tra he so c co dap ung dieu kien khong?
  do {
    stdout.write('Nhập hệ số c: ');
    c = double.tryParse(stdin.readLineSync() ?? "") ?? double.nan;
    // Kiem tra dieu kien
    if (c.isNaN) {
      // In thong bao loi
      print('Hệ số c phải là số. Vui lòng nhập lại!');
    }
  } while (c.isNaN);

  // Tinh delta
  double delta = pow(b, 2) - 4 * a * c;
  print('Delta: $delta');

  // Giai phuong trinh bac 2
  if (delta > 0) {
    // Tinh x1, x2
    double x1 = (-b + sqrt(delta)) / (2 * a);
    double x2 = (-b - sqrt(delta)) / (2 * a);
    // In thong bao phuong trinh co 2 nghiem phan biet
    print('Phương trình có 2 nghiệm phân biệt: x1 = $x1, x2 = $x2');
  } else if (delta == 0) {
    // Tinh x1 = x2
    double x = -b / (2 * a);
    // In thong bao phuong trinh co nghiem kep
    print('Phương trình có nghiệm kép: x1 = x2 = $x');
  } else {
    // In thong bao phuong trinh vo nghiem
    print('Phương trình vô nghiệm!');
  }
}
