class Takim {
  String _ad = '';
  int _skor = 0;
  int pas = 3;
  void skorArti() {
    this._skor++;
  }

  void setAd(String ad) {
    this._ad = ad;
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
