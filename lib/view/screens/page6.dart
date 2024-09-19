import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trafic_static_app/controllers/page6_controller.dart';
import 'package:get/get.dart';
import 'package:trafic_static_app/core/helper/global_functions.dart';
import 'package:trafic_static_app/model/sample_view.dart';
import 'package:trafic_static_app/model/traffic_by_contry_model.dart';
import 'package:trafic_static_app/view/widgets/no_data_widget.dart';
import 'package:trafic_static_app/view/widgets/pie_chart.dart';
import 'package:trafic_static_app/view/widgets/primary_text.dart';
import 'package:trafic_static_app/view/widgets/pro_button.dart';

class Page6 extends StatelessWidget {
  const Page6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<Page6Controller>(
      autoRemove: false,
      builder: (controller) => !controller.isLoading.value
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15),
                  child: const PrimaryText(
                    'Top Referring Countries',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left,
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: controller.topReferringCountriesModel.proLink != ''
                        ? Stack(
                            children: [
                              PieDataLabels([
                                ChartSampleData(x: 'USA', y: 9),
                                ChartSampleData(x: 'Egypt', y: 40),
                                ChartSampleData(x: 'UAE', y: 9),
                                ChartSampleData(x: 'Palestine', y: 9)
                              ].obs),
                              Center(
                                  child: ClipRect(
                                child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 5.9, sigmaY: 5.9),
                                    child: Container(
                                      height: ScreenUtil().screenHeight * 0.3,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade200
                                              .withOpacity(0.1)),
                                    )),
                              )),
                              ProButton(
                                  proLink: controller
                                      .topReferringCountriesModel.proLink!)
                            ],
                          )
                        : controller.referringCountriesData!.isNotEmpty
                            ? SizedBox(
                                width: Get.width,
                                child: PieDataLabels(
                                    controller.referringCountriesData))
                            : const NoDataWidget()),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
                  child: const PrimaryText(
                    'Today Traffic By Country',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: controller.trafficByCountryModel.proLink != ''
                      ? Stack(
                          children: [
                            SizedBox(
                              height: ScreenUtil().screenHeight * 0.4,
                              width: Get.width,
                              child: Image.asset(
                                'images/today_traffic_fake.jpg',
                              ),
                            ),
                            Center(
                                child: ClipRect(
                              child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 5.9, sigmaY: 5.9),
                                  child: Container(
                                    height: ScreenUtil().screenHeight * 0.4,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200
                                            .withOpacity(0.1)),
                                  )),
                            )),
                            ProButton(
                                proLink:
                                    controller.trafficByCountryModel.proLink!)
                          ],
                        )
                      : controller.trafficByCountryModel.data!.data!.isNotEmpty
                          ? buildPaginatedDataTable(controller)
                          : const NoDataWidget(),
                )
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  PaginatedDataTable buildPaginatedDataTable(Page6Controller controller) {
    return PaginatedDataTable(
      columns: const [
        DataColumn(
            label: Expanded(
          child: PrimaryText(
            'No.',
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            textAlign: TextAlign.center,
          ),
        )),
        DataColumn(
            label: Expanded(
          child: PrimaryText(
            'Country',
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            textAlign: TextAlign.center,
          ),
        )),
        DataColumn(
            label: Expanded(
          child: PrimaryText(
            'Country Name',
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            textAlign: TextAlign.center,
          ),
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
      ],
      rowsPerPage: 3,
      source: MyData(controller.trafficByCountryModel.data!.data!),
    );
  }
}

class MyData extends DataTableSource {
  final List<Data2> data;

  MyData(this.data);

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    return DataRow(
        color: MaterialStateProperty.resolveWith(
            index % 2 == 0 ? getWhiteRowColor : getGreyRowColor),
        cells: [
          DataCell(PrimaryText(data[index].no!.toString())),
          DataCell(
            Image.network(
              data[index].country!,
              width: 30.h,
            ),
          ),
          DataCell(PrimaryText(data[index].ctrName!)),
          DataCell(PrimaryText(data[index].total!)),
        ]);
  }
}
