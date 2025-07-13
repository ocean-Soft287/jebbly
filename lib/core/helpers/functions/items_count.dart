import 'package:number_to_word_arabic/number_to_word_arabic.dart';
import 'package:number_to_words_english/number_to_words_english.dart';

class ItemsCount {
  static String count(int number, String locale, {bool? upperFirst}) {
    bool isArabic = locale.startsWith('ar');
    String numberInWords = isArabic
        ? Tafqeet.convert(number.toString())
        : NumberToWordsEnglish.convert(number);

    if (isArabic) {
      if (number == 1) return 'عنصر واحد';
      if (number == 2) return 'عنصران';
      if (number >= 3 && number <= 10) return '$numberInWords عناصر';
      return '$numberInWords عنصراً';
    } else {
      if (number == 1) return upperFirst == true? 'One item' :'one item';
      if (number == 2) return upperFirst == true? 'Two items': 'two items';
      return upperFirst == true
          ? '$numberInWords items'[0].toUpperCase() +
              '$numberInWords items'.substring(1)
          : '$numberInWords items';
    }
  }
}