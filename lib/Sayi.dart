import 'dart:math';

class SayiRa {
  List<int> cikanSayilar = [];
  final Random _random = Random();

  int sayiUret() {
    if (cikanSayilar.length >= 5) {
      return cikanSayilar
          .last; // Eğer tüm sayılar üretildiyse son üretileni döndür
    }

    int sayi;
    do {
      sayi = _random.nextInt(5);
    } while (cikanSayilar.contains(sayi));

    cikanSayilar.add(sayi);
    print(cikanSayilar);
    return sayi;
  }

  int sayiGoster() {
    if (cikanSayilar.isEmpty) {
      return sayiUret(); // Eğer hiç sayı üretilmediyse yeni bir sayı üret
    } else {
      return cikanSayilar.last; // Son üretilen sayıyı döndür
    }
  }
}
