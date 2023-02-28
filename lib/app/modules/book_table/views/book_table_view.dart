import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:igmi_machine_test/app/data/model/search_table_model.dart';
import 'package:igmi_machine_test/app/theme/colors.dart';

import '../controllers/book_table_controller.dart';

class BookTableView extends GetView<BookTableController> {
  const BookTableView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.chevron_left,
            size: 40,
            color: AppColors.white,
          ),
        ),
        title: const Text('Book Table'),
        centerTitle: true,
      ),
      body: controller.obx(
        (List<ListedBusniess>? listedBusniess) =>
            NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowIndicator();
            return true;
          },
          child: listedBusniess == null
              ? Center(
                  child: Text(
                    'No restaurants available',
                    textScaleFactor: Get.textScaleFactor,
                    style: Get.theme.textTheme.bodyLarge?.copyWith(
                      fontSize: 16,
                      color: Get.theme.disabledColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : CustomScrollView(
                  slivers: listedBusniess
                      .map(
                        (ListedBusniess busniess) => _buildBusniessTile(
                          busniess,
                          listedBusniess.indexOf(busniess),
                          listedBusniess.length,
                        ),
                      )
                      .toList(),
                ),
        ),
        onLoading: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }

  Widget _buildBusniessTile(
      ListedBusniess busniess, int itemIndex, int totalItemsLength) {
    return SliverPadding(
      padding: EdgeInsets.fromLTRB(
        16.0,
        itemIndex == 0 ? 20.0 : 0,
        16.0,
        itemIndex == totalItemsLength ? 20.0 : 10.0,
      ),
      sliver: SliverToBoxAdapter(
        child: Material(
          elevation: 2,
          shadowColor: AppColors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Material(
                      color: Get.theme.disabledColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: SizedBox.square(
                        dimension: 100,
                        child: busniess.image == null
                            ? Center(
                                child: Icon(
                                  Icons.business_rounded,
                                  size: 50,
                                  color: Get.theme.disabledColor,
                                ),
                              )
                            : Image.network(
                                busniess.image!,
                                scale: 1,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(
                                    Icons.business_rounded,
                                    size: 50,
                                    color: Get.theme.disabledColor,
                                  );
                                },
                              ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    busniess.businessName ?? "",
                                    textScaleFactor: Get.textScaleFactor,
                                    style: Get.theme.textTheme.headlineSmall
                                        ?.copyWith(
                                      fontSize: 16,
                                      color: AppColors.darkCerulean,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    busniess.description ?? "",
                                    textScaleFactor: Get.textScaleFactor,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: Get.theme.textTheme.headlineSmall
                                        ?.copyWith(
                                      fontSize: 16,
                                      color: AppColors.cyberspace,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ShaderMask(
                                  child: const Icon(
                                    Icons.star_rate_rounded,
                                    size: 20,
                                    color: Colors.yellow,
                                  ),
                                  shaderCallback: (Rect bounds) {
                                    return LinearGradient(
                                      colors: <Color>[
                                        Colors.white,
                                        Colors.yellow[700]!,
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ).createShader(bounds);
                                  },
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  "${busniess.rating!}/5",
                                  textScaleFactor: Get.textScaleFactor,
                                  style:
                                      Get.theme.textTheme.bodyLarge?.copyWith(
                                    fontSize: 16,
                                    color: AppColors.teal,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    text: "Location: ",
                    children: [
                      TextSpan(
                        text: busniess.address ?? "",
                      ),
                    ],
                  ),
                  textScaleFactor: Get.textScaleFactor,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Get.theme.textTheme.headlineSmall?.copyWith(
                    fontSize: 16,
                    color: AppColors.darkCerulean,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Select Time Slot:",
                  textScaleFactor: Get.textScaleFactor,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Get.theme.textTheme.headlineSmall?.copyWith(
                    fontSize: 16,
                    color: AppColors.darkCerulean,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                if (busniess.timeAvailable.isEmpty)
                  Text(
                    "No time slots available",
                    textScaleFactor: Get.textScaleFactor,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Get.theme.textTheme.headlineSmall?.copyWith(
                      fontSize: 14,
                      color: Get.theme.disabledColor,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                else
                  Wrap(
                    spacing: 5.0,
                    runSpacing: 5.0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.spaceEvenly,
                    children: busniess.timeAvailable
                        .where((TimeAvailable element) => element.time != null)
                        .map(
                          (TimeAvailable availableTime) => MaterialButton(
                            onPressed: () {
                              Get.log(
                                  "Selected time slot: ${availableTime.time}");
                            },
                            color: AppColors.flatteredFlamingo,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            minWidth: 64,
                            height: 32,
                            padding: EdgeInsets.zero,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            child: Text(
                              availableTime.time!,
                              textScaleFactor: Get.textScaleFactor,
                              style: Get.theme.textTheme.bodyMedium?.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                SizedBox(height: busniess.timeAvailable.isEmpty ? 10 : 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
