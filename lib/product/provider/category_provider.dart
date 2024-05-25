import 'package:flutter_riverpod/flutter_riverpod.dart';

final tasteSelectedProvider = StateProvider<String>(
  (ref) => '어떤',
);

final tasteProvider = StateProvider<List<String>>(
  (ref) => ['단', '신', '짠', '쓴', '감칠', '매운'],
);

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
