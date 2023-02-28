import 'package:get/get.dart';

import '../controllers/book_table_controller.dart';

class BookTableBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookTableController>(
      () => BookTableController(),
    );
  }
}
