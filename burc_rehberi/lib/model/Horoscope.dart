class Horoscope {
  final String _horoscopeName;
  final String _horoscopeDate;
  final String _horoscopeDetails;
  final String _horoscopeSmallImg;
  final String _horoscopeLargeImg;
  get horoscopeName => this._horoscopeName;
  get horoscopeDate => this._horoscopeDate;
  get horoscopeDetails => this._horoscopeDetails;
  get horoscopeSmallImg => this._horoscopeSmallImg;
  get horoscopeLargeImg => this._horoscopeLargeImg;
  Horoscope(this._horoscopeName, this._horoscopeDate, this._horoscopeDetails,
      this._horoscopeSmallImg, this._horoscopeLargeImg);
  @override
  String toString() {
    // TODO: implement toString
    return 'Name: $_horoscopeName\nDate:$_horoscopeDate\nDetails:$_horoscopeDetails\nSmall Image Name:$_horoscopeSmallImg\nLarge Image Name:$_horoscopeLargeImg';
  }
}
