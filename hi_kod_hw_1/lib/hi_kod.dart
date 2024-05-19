import 'package:dart_casing/dart_casing.dart';

void main() {
  String name = "Ben Mihriban Özdemir";
  print(name);
  int age = 24;
  print(age);
  double pi = 3.14;
  print(pi);
  dynamic isdynamic = true;
  print('İlk değer: $isdynamic');
  isdynamic = false;
  print('Yeni değer: $isdynamic');
  String singlechar = 'A';
  print("Single character (Char) : $singlechar");
  String text = "hi-kod Mobile uygulama geliştirme atölyesi";

  // Camel case-pascal case- Snake case
  print(Casing.camelCase(text));
  print(Casing.pascalCase(text));
  print(Casing.snakeCase(name));

  bool resitlik_durumu;
  if (age > 18)
  {
    resitlik_durumu = true;
  }
  else {
    resitlik_durumu = false;
  }


  print(name + ", yaşım: $age" + " benim reşitlik durumum : $resitlik_durumu");
}