import 'package:burc_rehberi/model/Horoscope.dart';
import 'package:flutter/material.dart';

class HoroscopeItems extends StatelessWidget {
  final Horoscope selectedHoroscope;
  const HoroscopeItems({super.key, required this.selectedHoroscope});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        onTap: () {
          Navigator.of(context)
              .pushNamed("/Details", arguments: selectedHoroscope);
        },
        leading: CircleAvatar(child: Text(selectedHoroscope.horoscopeName)),
        title: Text(selectedHoroscope.horoscopeName),
        subtitle: Text(selectedHoroscope.horoscopeDate),
        trailing: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed("/Details", arguments: selectedHoroscope);
          },
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.pink.shade300,
          ),
        ),
      ),
    );
  }
}
