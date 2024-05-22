import 'package:flutter_riverpod/flutter_riverpod.dart';

final categorySelectedProvider = StateProvider<String>(
  (ref) => '전체',
);

final categoriesProvider = StateProvider<List<String>>(
  (ref) => [
    '전체',
    '한식',
    '중식',
    '일식',
    '양식',
    '동남아',
    '멕시칸',
    '기타',
  ],
);
