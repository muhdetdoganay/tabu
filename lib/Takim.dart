class Takim {
  String _ad = '';
  int _skor = 0;
  int pas = 3;
  Takim(String ad, int skor) {
    this._skor = skor;
    this._ad = ad;
  }
  void skorArti() {
    this._skor++;
  }

  void skorEksi() {
    this._skor--;
  }

  String getAd() {
    return _ad;
  }

  int getSkor() {
    return _skor;
  }
}
