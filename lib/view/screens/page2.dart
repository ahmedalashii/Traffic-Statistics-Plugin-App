import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trafic_static_app/controllers/page2_controller.dart';
import 'package:trafic_static_app/core/helper/global_functions.dart';
import 'package:trafic_static_app/view/widgets/primary_text.dart';
import 'package:trafic_static_app/view/widgets/pro_button.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final MapController _mapController =
      MapController(); // Initializing MapController

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<Page2Controller>(
      autoRemove: false,
      builder: (controller) {
        if (!controller.isLoading.value) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 350.h,
                child: Stack(
                  children: [
                    FlutterMap(
                      options: MapOptions(
                        initialCenter: LatLng(51.5, -0.09),
                        initialZoom: 1,
                        // allowPanningOnScrollingParent: true,
                        // enableScrollWheel: true,
                        interactionOptions: InteractionOptions(
                          scrollWheelVelocity: 0.005,
                          flags:
                              InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                        ),
                      ),
                      mapController:
                          _mapController, // Linking the controller to the map
                      children: [
                        TileLayer(
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: ['a', 'b', 'c'],
                        ),
                        MarkerLayer(
                          markers: controller.markers.value,
                        ),
                      ],
                    ),
                    controller.mapDataModel.value.proLink!.isNotEmpty
                        ? Center(
                            child: ClipRect(
                            child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 5.9, sigmaY: 5.9),
                                child: Container(
                                  height: 350.h,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200
                                          .withOpacity(0.1)),
                                )),
                          ))
                        : const SizedBox(),
                    controller.mapDataModel.value.proLink!.isNotEmpty
                        ? ProButton(
                            proLink: controller.mapDataModel.value.proLink!,
                          )
                        : const SizedBox()
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child: const PrimaryText(
                  'Summary Statistics',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                width: Get.width,
                child: DataTable(
                    dataRowHeight: 45.h,
                    dividerThickness: 0,
                    columnSpacing: 28.w,
                    columns: const [
                      DataColumn(
                          label: PrimaryText(
                        '',
                      )),
                      DataColumn(
                          label: Expanded(
                        child: PrimaryText(
                          'Visitors',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          textAlign: TextAlign.center,
                        ),
                      )),
                      DataColumn(
                          label: Expanded(
                        child: PrimaryText(
                          'Visits',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                          color: Colors.black87,
                        ),
                      )),
                    ],
                    rows: [
                      DataRow(
                          color:
                              WidgetStateProperty.resolveWith(getWhiteRowColor),
                          cells: [
                            DataCell(PrimaryText(
                              controller
                                  .summaryStaticsModel.data.data2.today.title,
                              fontSize: 14,
                            )),
                            DataCell(Center(
                              child: PrimaryText(
                                controller.summaryStaticsModel.data.data2.today
                                    .visitors
                                    .toString(),
                                fontSize: 14,
                              ),
                            )),
                            DataCell(Center(
                              child: PrimaryText(
                                controller
                                    .summaryStaticsModel.data.data2.today.visits
                                    .toString(),
                                fontSize: 14,
                              ),
                            ))
                          ]),
                      DataRow(
                          color:
                              WidgetStateProperty.resolveWith(getGreyRowColor),
                          cells: [
                            DataCell(PrimaryText(
                              controller.summaryStaticsModel.data.data2
                                  .yesterday.title,
                              fontSize: 14,
                            )),
                            DataCell(Center(
                              child: PrimaryText(
                                controller.summaryStaticsModel.data.data2
                                    .yesterday.visitors
                                    .toString(),
                                fontSize: 14,
                              ),
                            )),
                            DataCell(Center(
                              child: PrimaryText(
                                controller.summaryStaticsModel.data.data2
                                    .yesterday.visits
                                    .toString(),
                                fontSize: 14,
                              ),
                            ))
                          ]),
                      DataRow(
                          color:
                              WidgetStateProperty.resolveWith(getWhiteRowColor),
                          cells: [
                            DataCell(PrimaryText(
                              controller.summaryStaticsModel.data.data2.thisWeek
                                  .title,
                              fontSize: 14,
                            )),
                            DataCell(Center(
                              child: PrimaryText(
                                controller.summaryStaticsModel.data.data2
                                    .thisWeek.visitors
                                    .toString(),
                                fontSize: 14,
                              ),
                            )),
                            DataCell(Center(
                              child: PrimaryText(
                                controller.summaryStaticsModel.data.data2
                                    .thisWeek.visits
                                    .toString(),
                                fontSize: 14,
                              ),
                            ))
                          ]),
                      DataRow(
                          color:
                              WidgetStateProperty.resolveWith(getGreyRowColor),
                          cells: [
                            DataCell(PrimaryText(
                              controller.summaryStaticsModel.data.data2
                                  .thisMonth.title,
                              fontSize: 14,
                            )),
                            DataCell(Center(
                              child: PrimaryText(
                                controller.summaryStaticsModel.data.data2
                                    .thisMonth.visitors
                                    .toString(),
                                fontSize: 14,
                              ),
                            )),
                            DataCell(Center(
                              child: PrimaryText(
                                controller.summaryStaticsModel.data.data2
                                    .thisMonth.visits
                                    .toString(),
                                fontSize: 14,
                              ),
                            ))
                          ]),
                      DataRow(
                          color:
                              WidgetStateProperty.resolveWith(getWhiteRowColor),
                          cells: [
                            DataCell(PrimaryText(
                              controller.summaryStaticsModel.data.data2.thisYesr
                                  .title,
                              fontSize: 14,
                            )),
                            DataCell(Center(
                              child: PrimaryText(
                                controller.summaryStaticsModel.data.data2
                                    .thisYesr.visitors
                                    .toString(),
                                fontSize: 14,
                              ),
                            )),
                            DataCell(Center(
                              child: PrimaryText(
                                controller.summaryStaticsModel.data.data2
                                    .thisYesr.visits
                                    .toString(),
                                fontSize: 14,
                              ),
                            ))
                          ]),
                    ]),
              )
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
