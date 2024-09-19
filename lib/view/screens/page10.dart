import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trafic_static_app/controllers/page9_controller.dart';
import 'package:trafic_static_app/core/helper/global_functions.dart';
import 'package:trafic_static_app/model/last_search_words.dart';
import 'package:trafic_static_app/view/widgets/primary_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class Page10 extends StatelessWidget {
  const Page10({Key? key}) : super(key: key);

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
                    'Last Search Words',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left,
                  ),
                ),
                controller.lastSearchWordsModel.data!.data2!.isNotEmpty
                    ? PaginatedDataTable(
                        columns: const [
                          DataColumn(
                              label: Expanded(
                            child: PrimaryText(
                              'Country/SE/Browser',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              textAlign: TextAlign.center,
                            ),
                          )),
                          DataColumn(
                              label: PrimaryText(
                            'Keywords',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            textAlign: TextAlign.center,
                          )),
                          DataColumn(
                              label: PrimaryText(
                            'Date',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            textAlign: TextAlign.center,
                          )),
                        ],
                        rowsPerPage: 10,
                        source: MyData(
                            controller.lastSearchWordsModel.data!.data2!,
                            context),
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
  final BuildContext context;

  MyData(this.data, this.context);

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
          DataCell(Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                '${data[index].ctrInternetCode}',
                width: 20.w,
              ),
              SizedBox(
                width: 4.w,
              ),
              Image.network('${data[index].eurl}', width: 20.w),
              SizedBox(
                width: 4.w,
              ),
              Image.network('${data[index].burl}', width: 20.w),
            ],
          )),
          DataCell(InkWell(
              onTap: () async {
                var url = data[index].hitReferer.toString();
                try {
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw "Could not launch $url";
                  }
                } on Exception catch (_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Cannot Launch URL')));
                }
              },
              child: PrimaryText(
                data[index].hitSearchWords!.toString(),
                color: Colors.blue,
              ))),
          DataCell(Center(
            child: PrimaryText(data[index].dt!.toString()),
          )),
        ]);
  }
}
