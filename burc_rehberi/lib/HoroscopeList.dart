import 'package:burc_rehberi/HoroscopeItems.dart';
import 'package:burc_rehberi/data/MyStrings.dart';
import 'package:burc_rehberi/model/Horoscope.dart';
import 'package:flutter/material.dart';

class HoroscopeList extends StatelessWidget {
  late List<Horoscope> _allHoroscope;
  HoroscopeList() {
    _allHoroscope = getAllHoroscope();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Burç Rehberi",
        textAlign: TextAlign.center,
      )),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return HoroscopeItems(selectedHoroscope: _allHoroscope[index]);
          },
          itemCount: _allHoroscope.length,
        ),
      ),
    );
  }

  List<Horoscope> getAllHoroscope() {
    List<Horoscope> temporary = List.generate(
        MyStrings.BURC_ADLARI.length,
        (index) => Horoscope(
              MyStrings.BURC_ADLARI[index],
              MyStrings.BURC_TARIHLERI[index],
              MyStrings.BURC_GENEL_OZELLIKLERI[index],
              MyStrings.BURC_ADLARI[index].toLowerCase() + 'SmallImg.png',
              MyStrings.BURC_ADLARI[index].toLowerCase() + 'LargeImg.png',
            ));

    return temporary;
  }
}
