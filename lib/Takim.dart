class Takim {
  String _ad = '';
  int _skor = 0;
  int pas = 3;
  void skorArti() {
    _skor++;
  }

  void setAd(String ad) {
    _ad = ad;
  }

  void skorEksi() {
    _skor--;
  }

  String getAd() {
    return _ad;
  }

  int getSkor() {
    return _skor;
  }
}
