import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:icm/routes/app_routes.dart';
import 'package:icm/utils/custom_colors.dart';
import 'package:icm/widgets/top_bar.dart';

import '../../../model/facility.dart';
import '../../../widgets/custom_loader.dart';
import 'facility_controller.dart';

class FacilityScreen extends GetView<FacilityController> {
  @override
  final controller = Get.put(FacilityController());

  FacilityScreen({Key? key}) : super(key: key);

  Map<bool, Widget> children = <bool, Widget>{
    false: const Text(
      "Pending",
    ),
    true: const Text("Completed"),
  };

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Column(
            children: [
              TopBar(
                  widget: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: bgColor),
                        child: const Icon(
                          Icons.arrow_back_ios_outlined,
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    Expanded(
                      child: Text(
                        "${controller.facility['FacilityName']}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icon/search.svg',
                      width: 18,
                      height: 18,
                    )
                  ],
                ),
              )),
              const SizedBox(
                height: 16,
              ),
              Obx(
                () => CupertinoSegmentedControl<bool>(
                  children: const <bool, Widget>{
                    false: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Pending",
                      ),
                    ),
                    true: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Completed",
                      ),
                    ),
                  },
                  onValueChanged: (value) {
                    controller.selectedTag(value);
                  },
                  selectedColor: primaryColor,
                  unselectedColor: Colors.white,
                  borderColor: Colors.grey,
                  pressedColor: Colors.grey,
                  groupValue: controller.selectedTag.value,
                ),
              ),
              Expanded(
                child: Obx(() => controller.selectedTag.value
                    ? controller.completedList.isEmpty
                        ? const Center(child: Text('No Records Found'))
                        : ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: controller.completedList.length,
                            itemBuilder: (_, index) => _buildFacilityItem(
                                controller.completedList[index], false))
                    : controller.pendingList.isEmpty
                        ? const Center(child: Text('No Records Found'))
                        : ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: controller.pendingList.length,
                            itemBuilder: (_, index) => _buildFacilityItem(
                                controller.pendingList[index], true))),
              ),
            ],
          ),
        ),
        Obx(() => controller.isLoading.value
            ? CustomLoader(
                overlayColor: Colors.transparent,
              )
            : const SizedBox.shrink())
      ],
    );
  }

  _buildFacilityItem(FacilityData item, bool isClickable) {
    return InkWell(
      onTap: isClickable
          ? () async {
              var res =
                  await Get.toNamed(AppRoutes.readingScreen, arguments: item);
              if (res != null && res) {
                controller.updateCompletedData(item);
              }
            }
          : null,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: taskLightColor)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: item.faciltyImage,
                width: 50,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.meterName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: primaryColor),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "${item.locationName} . ${item.buildingName}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12, color: lightTextColor),
                  ),
                  const Divider(),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundImage: CachedNetworkImageProvider(
                          item.logoPath,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        item.tenantName,
                        style: const TextStyle(fontSize: 10),
                      ),
                      const Spacer(),
                      Text(
                        item.lastReadingDate,
                        style: const TextStyle(fontSize: 10),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
