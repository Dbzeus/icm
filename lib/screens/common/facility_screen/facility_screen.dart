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
                        "${controller.title}",
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
              Obx(()=>
                 Container(

                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 18),
                  child: CupertinoSlidingSegmentedControl(

                    groupValue:  controller.selectedTag.value,
                    padding: const EdgeInsets.all(6),
                    onValueChanged: (value) {
                      controller.selectedTag(value);
                      debugPrint(controller.selectedTag.value.toString());
                    },
                    children:  const  <bool, Widget> {

                      false:   Text(
                        "Pending",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          /*color: controller.selectedTag.value
                              ? primaryColor
                              : lightTextColor*/),
                      ),
                      true:  Text(
                        "Completed",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          /*color: controller.selectedTag.value
                              ? primaryColor
                              : lightTextColor*/),
                      ),

                    },
                  ),
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
              if (res != null) {

                controller.updateCompletedData(item,res);
              }
            }
          : null,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
            color: white,
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
              width: 16,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text("Opening",
                              style: TextStyle(
                                fontSize: 12,
                              )),
                          Text(item.openingReading.toString(),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      Column(
                        children: [
                          const Text("Closing",
                              style: TextStyle(
                                fontSize: 12,
                              )),
                          Text(item.closingReading.toString(),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      Column(
                        children: [
                          const Text("Running",
                              style: TextStyle(
                                fontSize: 12,
                              )),
                          Text(item.runningReading.toString(),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      Column(
                        children: [
                          const Text("Unit",
                              style: TextStyle(
                                fontSize: 12,
                              )),
                          Text(item.unitName.toString(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.deepOrangeAccent,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),

                    ],
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

  /*_buildFacilityItem1(FacilityData item, bool isClickable) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            onTap:isClickable ? ()async {
              var res =
                  await Get.toNamed(AppRoutes.readingScreen, arguments: item);
              if (res != null) {
                controller.updateCompletedData(item,res);
              }
            } : null,


            leading:  CircleAvatar(

              backgroundImage:
              CachedNetworkImageProvider(
                item.faciltyImage,


              ),

              radius: 25,
            ),
            title:  Text(
              item.meterName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 14, color: primaryColor),
            ),


            subtitle:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${item.locationName} . ${item.buildingName}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14, color: lightTextColor),
                ),
                isClickable? const SizedBox.shrink() :const Divider(),
                isClickable? const SizedBox.shrink() : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text("Opening",
                            style: TextStyle(
                              fontSize: 12,
                            )),
                        Text(item.openingReading.toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        const Text("Closing",
                            style: TextStyle(
                              fontSize: 12,
                            )),
                        Text(item.closingReading.toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        const Text("Running",
                            style: TextStyle(
                              fontSize: 12,
                            )),
                        Text(item.runningReading.toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),

                  ],
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
            isThreeLine: true,
            dense: true,
          ),
          const Divider(),
        ],
      );
  }*/
}
