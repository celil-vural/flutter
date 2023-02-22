import 'package:burc_rehberi/model/Horoscope.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class HoroscopeDetails extends StatefulWidget {
  final Horoscope selectedHoroscope;
  const HoroscopeDetails({super.key, required this.selectedHoroscope});

  @override
  State<HoroscopeDetails> createState() => _HoroscopeDetailsState();
}

class _HoroscopeDetailsState extends State<HoroscopeDetails> {
  Color appBarColor = Colors.pink.shade300;
  late PaletteGenerator _genrator;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      searchAppBarColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 250,
          flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(widget.selectedHoroscope.horoscopeName +
                  " Burcu ve Özellikleri"),
              background: Image.asset(
                "assets/images/cars.jpg",
                fit: BoxFit.cover,
              )),
          backgroundColor: appBarColor,
          floating: false, //aşağı çektiğinde app bar gözükür
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: SingleChildScrollView(
            child: Text(
              widget.selectedHoroscope.horoscopeDetails,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        )
      ],
    ));
  }

  void searchAppBarColor() async {
    _genrator = await PaletteGenerator.fromImageProvider(
        AssetImage("assets/images/cars.jpg"));
    setState(() {
      appBarColor = _genrator.dominantColor!.color;
    });
  }
}
