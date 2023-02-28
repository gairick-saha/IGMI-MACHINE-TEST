import 'package:get/get.dart';
import 'package:igmi_machine_test/app/data/model/search_table_model.dart';
import 'package:igmi_machine_test/app/data/repository/search_table_repo.dart';

class BookTableController extends GetxController
    with StateMixin<List<ListedBusniess>> {
  @override
  Future<void> onInit() async {
    await SearchTableRepo()
        .getData(
          date: DateTime.now(),
          totalPersons: 2,
          latitude: 53.798407,
          longitude: -1.548248,
        )
        .then(
          (List<ListedBusniess> response) => change(
            response,
            status: RxStatus.success(),
          ),
          onError: (dynamic error) => change(
            null,
            status: RxStatus.error(error is String ? error : null),
          ),
        );
    super.onInit();
  }
}
