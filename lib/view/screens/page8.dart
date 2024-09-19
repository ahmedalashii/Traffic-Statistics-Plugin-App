import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:trafic_static_app/constants/colors.dart';
import 'package:trafic_static_app/controllers/page7_controller.dart';
import 'package:trafic_static_app/core/helper/global_functions.dart';
import 'package:trafic_static_app/view/widgets/primary_text.dart';
import 'package:trafic_static_app/model/visits_time_model.dart';

class Page8 extends StatelessWidget {
  const Page8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<Page7Controller>(
      autoRemove: false,
      builder: (controller) => !controller.isLoading.value
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15),
                  child: const PrimaryText(
                    'Visits Time Graph',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left,
                  ),
                ),
                controller.visitsTimeModel.data!.data2!.isNotEmpty
                    ? PaginatedDataTable(
                        columns: const [
                          DataColumn(
                              label: Expanded(
                            child: PrimaryText(
                              'Time',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              textAlign: TextAlign.center,
                            ),
                          )),
                          DataColumn(
                              label: Expanded(
                            child: PrimaryText(
                              'Visitor Graph',
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
                        source: MyData(controller.visitsTimeModel.data!.data2!),
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/no_data.png',
                              height: 200.h,
                              width: 200.w,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const PrimaryText(
                              'No Data',
                              fontSize: 18,
                            )
                          ],
                        ),
                      ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
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
          DataCell(Center(
              child: PrimaryText(data[index].vtmTimeFrom!.toString() +
                  " - " +
                  data[index].vtmTimeTo!.toString()))),
          DataCell(Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                child: LinearPercentIndicator(
                  width: 65.0.w,
                  lineHeight: 8.0,
                  percent: data[index].percent! / 100,
                  progressColor: primaryColor,
                ),
              ),
              PrimaryText(data[index].percent!.toString() + " %"),
            ],
          )),
          DataCell(
              Center(child: PrimaryText(data[index].vtmVisitors!.toString()))),
          DataCell(
              Center(child: PrimaryText(data[index].vtmVisits!.toString()))),
        ]);
  }
}
