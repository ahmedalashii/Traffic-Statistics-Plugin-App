import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trafic_static_app/controllers/page9_controller.dart';
import 'package:trafic_static_app/core/helper/global_functions.dart';
import 'package:trafic_static_app/model/traffic_by_title_model.dart';
import 'package:trafic_static_app/view/widgets/no_data_widget.dart';
import 'package:trafic_static_app/view/widgets/primary_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Page9 extends StatelessWidget {
  const Page9({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<Page9Controller>(
      autoRemove: false,
      builder: (controller) => !controller.isLoading.value
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15),
                  child: const PrimaryText(
                    'Traffic By Title',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left,
                  ),
                ),
                controller.trafficByTitleModel.data!.data!.isNotEmpty
                    ? PaginatedDataTable(
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
                              label: PrimaryText(
                            'Title',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            textAlign: TextAlign.center,
                          )),
                          DataColumn(
                              label: Expanded(
                            child: PrimaryText(
                              'Hits',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              textAlign: TextAlign.center,
                            ),
                          )),
                          DataColumn(
                              label: Expanded(
                            child: PrimaryText(
                              'Percent',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              textAlign: TextAlign.center,
                            ),
                          )),
                        ],
                        rowsPerPage: 10,
                        source:
                            MyData(controller.trafficByTitleModel.data!.data!),
                      )
                    : const NoDataWidget()
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
            child: PrimaryText(data[index].rank.toString(),),
          )),
          DataCell(Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrimaryText(data[index].tilPageTitle!,),
            ],
          )),
          DataCell(Center(child: PrimaryText(data[index].tilHits!.toString()))),
          DataCell(Center(
            child: PrimaryText(data[index].percent!.toString()),
          )),
        ]);
  }
}
