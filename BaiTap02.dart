//Baitap02.dart
//Giai pt bac 2: ax^2+bx+c =0;
import 'dart:io';
import 'dart:math';

void main() {

  // Hàm đọc số thực với kiểm tra hợp lệ
  double readDouble(String prompt) {
    while (true) {
      stdout.write(prompt);
      String? input = stdin.readLineSync();

      double? value = double.tryParse(input ?? "");

      if (value != null) {
        return value; 
      } else {
        print("Giá trị nhập vào không hợp lệ! Vui lòng nhập lại.");
      }
    }
  }
  double a;
  while (true) {
    a = readDouble("Nhập hệ số a (a ≠ 0): ");
    if (a != 0) {
      break;
    } else {
      print("Hệ số a phải khác 0! Vui lòng nhập lại.");
    }
  }
  double b = readDouble("Nhập hệ số b: ");
  double c = readDouble("Nhập hệ số c: ");
  double delta = b * b - 4 * a * c;
  if (delta < 0) {
    print("Phương trình vô nghiệm (Delta < 0).");
  } else if (delta == 0) {
    double x = -b / (2 * a);
    print("Phương trình có nghiệm kép: x1 = x2 = $x");
  } else {
    double x1 = (-b + sqrt(delta)) / (2 * a);
    double x2 = (-b - sqrt(delta)) / (2 * a);
    print("Phương trình có hai nghiệm phân biệt:");
    print("x1 = $x1");
    print("x2 = $x2");
  }
}
