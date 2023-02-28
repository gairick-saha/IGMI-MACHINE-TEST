import 'package:get/get.dart';

import '../modules/book_table/bindings/book_table_binding.dart';
import '../modules/book_table/views/book_table_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BOOK_TABLE;

  static final routes = [
    GetPage(
      name: _Paths.BOOK_TABLE,
      page: () => const BookTableView(),
      binding: BookTableBinding(),
    ),
  ];
}
