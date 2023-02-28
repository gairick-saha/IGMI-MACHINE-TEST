import 'package:get/get.dart';
import 'package:igmi_machine_test/app/data/model/search_table_model.dart';
import 'package:intl/intl.dart';

class SearchTableRepo extends GetConnect {
  final String _baseUrl = "https://igmiweb.com";

  Future<List<ListedBusniess>> getData({
    required DateTime date,
    required int totalPersons,
    required double latitude,
    required double longitude,
  }) async =>
      await post(
        "$_baseUrl/gladdenhub/Api/search_table",
        FormData(
          {
            "date": DateFormat('yyyy-MM-dd').format(date),
            "time": DateFormat('HH:mm').format(date),
            "person": totalPersons,
            "latitude": latitude,
            "longitude": longitude,
          },
        ),
        headers: {
          "x-api-key": "NB10SKS20AS30",
        },
      ).then(
        (Response response) {
          if (response.status.isOk) {
            if (response.body['status'] == 1 &&
                response.body['message'] == "Data found") {
              return Future.value(
                (response.body['listed'] as List<dynamic>)
                    .map((e) => ListedBusniess.fromJson(e))
                    .toList(),
              );
            }

            return Future.error(
              response.body['message'] ??
                  "Something went wrong, Please refresh the page",
            );
          } else {
            return Future.error(
              response.statusText ??
                  "Something went wrong, Please refresh the page",
            );
          }
        },
      );
}
