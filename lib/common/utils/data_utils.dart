import 'dart:math';

import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class DataUtils {
  static String convertDateTimeToDateString({
    required DateTime datetime,
  }) {
    return '${datetime.year}년 ${datetime.month.toString().padLeft(2, '0')}월 ${datetime.day.toString().padLeft(2, '0')}일';
  }

  static String convertDateTimeToDateTimeString({
    required DateTime datetime,
  }) {
    return '${datetime.year}.${datetime.month.toString().padLeft(2, '0')}.${datetime.day.toString().padLeft(2, '0')} (${datetime.hour.toString().padLeft(2, '0')}시 ${datetime.minute.toString().padLeft(2, '0')}분)';
  }

  static String convertDateTimeToTimeString({
    required DateTime datetime,
  }) {
    return '${datetime.hour.toString().padLeft(2, '0')}:${datetime.minute.toString().padLeft(2, '0')}';
  }

  static String convertPriceToMoneyString({
    required int price,
  }) {
    final NumberFormat numberFormat = NumberFormat('###,###,###,###');

    return numberFormat.format(price);
  }

  static int getRandomNumber({
    required int dividerNumber,
  }) {
    final randomObj = Random();
    return randomObj.nextInt(dividerNumber);
  }

  static List<String> getRandomId({
    required int dividerNumber,
    required int count,
  }) {
    final randomObj = Random();

    final List<String> ids = [];

    for (int i = 0; i < count; i++) {
      ids.add(randomObj.nextInt(dividerNumber).toString());
    }

    return ids;
  }

  static List<T> getRandomShuffledList<T>(List<T> items) {
    List<T> newList = List.from(items); // 원본 리스트의 복사본 생성
    newList.shuffle(Random()); // 복사본 리스트를 랜덤으로 섞기
    return newList; // 섞인 리스트 반환
  }

  static String getUuid() {
    final uuid = Uuid();
    return uuid.v4();
  }

  static String extractNumbers(String input) {
    // 숫자만을 찾기 위한 정규 표현식
    RegExp numRegExp = RegExp(r'\d');

    // 입력된 문자열에서 모든 숫자를 찾아 하나의 문자열로 결합
    String extractedNumbers = input.splitMapJoin(numRegExp,
        onMatch: (m) => m.group(0)!, onNonMatch: (_) => '');
    return extractedNumbers;
  }
}
