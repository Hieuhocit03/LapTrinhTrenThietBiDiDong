import 'dart:io';

void main() {
  int a = 5;
  final value = 0x22;
  final bitmask = 0x0f;
  print((value ^ bitmask).toRadixString(16));
  print((value & ~bitmask).toRadixString(16));
  print(a++); // Step 1
  print(++a); // Step 2
  print(a--); // Step 3
  print(--a); // Step 4
  print(a); // Step 5
}
