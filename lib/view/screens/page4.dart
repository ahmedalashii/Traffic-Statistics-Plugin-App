import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trafic_static_app/controllers/page4_controller.dart';
import 'package:trafic_static_app/core/helper/global_functions.dart';
import 'package:trafic_static_app/view/widgets/no_data_widget.dart';
import 'package:trafic_static_app/view/widgets/primary_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trafic_static_app/model/traffic_by_countries_model.dart';
import 'package:trafic_static_app/view/widgets/pro_button.dart';

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<Page4Controller>(
      autoRemove: false,
      builder: (controller) => !controller.isLoading.value
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15),
                  child: const PrimaryText(
                    'Traffic By Countries (all time)',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left,
                  ),
                ),
                controller.trafficByCountryModel.data!.data!.isNotEmpty
                    ? buildPaginatedDataTable(controller)
                    : controller.trafficByCountryModel.proLink != ''?
                Stack(
                  children: [
                    SizedBox(
                        height: ScreenUtil().screenHeight*0.8,
                        width: Get.width,
                        child: Image.asset('images/traffic__bycountry_fake.jpg')),
                    Center(
                        child: ClipRect(
                          child: BackdropFilter(
                              filter:
                              ImageFilter.blur(sigmaX: 5.9, sigmaY: 5.9),
                              child: Container(
                                height: ScreenUtil().screenHeight*0.8,
                                width: Get.width,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200
                                        .withOpacity(0.1)),
                              )),
                        )),
                    ProButton(proLink: controller.trafficByCountryModel.proLink!)
                  ],
                ) : const NoDataWidget()
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  PaginatedDataTable buildPaginatedDataTable(Page4Controller controller) {
    return PaginatedDataTable(
                      columns: const [
                        DataColumn(
                            label: Expanded(
                          child: PrimaryText(
                            'Rank',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            textAlign: TextAlign.center,
                          ),
                        )),
                        DataColumn(
                            label: Expanded(
                          child: PrimaryText(
                            'Flag',
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
                            color: Colors.black87,
                            textAlign: TextAlign.center,
                          ),
                        )),
                      ],
                      rowsPerPage: 10,
                      source: MyData(
                          controller.trafficByCountryModel.data!.data!),
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
          DataCell(PrimaryText(data[index].rank!.toString())),
          DataCell(
            Image.network(
              data[index].flag!,
              width: 30.h,
            ),
          ),
          DataCell(PrimaryText(data[index].ctrName!)),
          DataCell(PrimaryText(data[index].visitors!)),
          DataCell(PrimaryText(data[index].visits!)),
        ]);
  }
}
