import 'dart:io';

void main() {
  // Khai bao bien co ban
  var ten = 'Hieu'; // tu suy luan
  int tuoi = 21; // khai bao ro rang

  // Su dung null Safety
  String? tenNullable;
  tenNullable = null;

  // Su dung bien late
  late String moTa;
  moTa = 'Lap trinh Dart';

  // Su dung final va const
  final String quocGia = 'VietNam';
  const int nam = 2024;

  // In gia tri bien
  print('Ten: $ten');
  print('Tuoi: $tuoi');
  print('Mo ta: $moTa');
  print('Quoc gia: $quocGia');
  print('Nam: $nam');

  // Kiem tra bien nullable
  int? soluong1 = 2;
  assert(soluong1 == null);

  // Kiem tra bien nullable
  int? soluong;
  assert(soluong == null);
}
