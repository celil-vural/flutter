import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
class TranslationsHelper{
  TranslationsHelper._();
  static getDevixeLanguage(BuildContext context){
    var deviceLanguage=context.deviceLocale.countryCode!.toLowerCase();
    switch(deviceLanguage){
      case 'tr':
        return LocaleType.tr;
      default:
        return LocaleType.en;
    }
  }
}