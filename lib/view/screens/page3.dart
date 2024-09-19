import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trafic_static_app/constants/colors.dart';
import 'package:trafic_static_app/controllers/page3_controller.dart';
import 'package:trafic_static_app/core/helper/global_functions.dart';
import 'package:trafic_static_app/model/visitors_by_id_model.dart';
import 'package:trafic_static_app/view/widgets/primary_button.dart';
import 'package:trafic_static_app/view/widgets/primary_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<Page3Controller>(
      autoRemove: false,
      builder: (controller) => !controller.isLoading.value
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15),
                  child: PrimaryText(
                    controller.visitorsModel.data!.title!,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.left,
                  ),
                ),
                controller.visitorsModel.data!.data!.isNotEmpty
                    ? PaginatedDataTable(
                      columns: const [
                        DataColumn(
                            label: Expanded(
                          child: PrimaryText(
                            'IP Address',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            textAlign: TextAlign.center,
                          ),
                        )),
                        DataColumn(
                            label: Expanded(
                          child: PrimaryText(
                            'Location',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            textAlign: TextAlign.center,
                          ),
                        )),
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
                            'Hits',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            textAlign: TextAlign.center,
                          ),
                        )),
                      ],
                      rowsPerPage: 10,
                      source: MyData(
                          controller.visitorsModel.data!.data!, context),
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
          DataCell(PrimaryText(data[index].hitIpAddress!)),
          DataCell(Row(
            children: [
              Image.network(
                data[index].cityImage!,
                width: 20.w,
                fit: BoxFit.contain,
              ),
              SizedBox(
                width: 4.h,
              ),
              PrimaryText(data[index].ctrName!),
            ],
          )),
          DataCell(PrimaryText(data[index].time!)),
          DataCell(data[index].modallDayHits! == '/'
              ? Center(child: PrimaryText(data[index].modallDayHits!))
              : GetX<Page3Controller>(
                  builder: (controller) {
                    return !controller.isLoading.value
                        ? Center(
                            child: InkWell(
                              onTap: () {
                                showMyDialog(
                                    context: context,
                                    content: FutureBuilder(
                                        future: controller.getPopUp(
                                            data[index].modallHitIpAddress,
                                            data[index].modallCtrNameAhcCity!,
                                            data[index].modallHitDate),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.done) {
                                            return SizedBox(
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    SizedBox(
                                                      height: 15.h,
                                                    ),
                                                    const PrimaryText(
                                                      "IP Tracking",
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                    const Divider(),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10.w,
                                                              vertical: 5.h),
                                                      child: SizedBox(
                                                        width: double.infinity,
                                                        child: DataTable(
                                                            dataRowHeight: 90.h,
                                                            columns: const [
                                                              DataColumn(
                                                                  label:
                                                                      PrimaryText(
                                                                'Page Title',
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black87,
                                                              )),
                                                              DataColumn(
                                                                  label:
                                                                      PrimaryText(
                                                                'Time',
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black87,
                                                              )),
                                                            ],
                                                            rows: List.generate(
                                                                controller
                                                                    .popUpModel
                                                                    .data!
                                                                    .data!
                                                                    .length,
                                                                (index) =>
                                                                    DataRow(
                                                                        cells: [
                                                                          DataCell(
                                                                              Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              InkWell(
                                                                                onTap: () async {
                                                                                  var url = controller.popUpModel.data!.data![index].requestUri;
                                                                                  try {
                                                                                    if (await canLaunch(url!)) {
                                                                                      await launch(url);
                                                                                    } else {
                                                                                      throw "Could not launch $url";
                                                                                    }
                                                                                  } on Exception catch (_) {
                                                                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cannot Launch URL')));
                                                                                  }
                                                                                },
                                                                                child: PrimaryText(
                                                                                  '${controller.popUpModel.data!.data![index].hitPageTitle}',
                                                                                  textAlign: TextAlign.start,
                                                                                  color: Colors.blue,
                                                                                ),
                                                                              ),

                                                                            ],
                                                                          )),
                                                                          DataCell(
                                                                              PrimaryText('${controller.popUpModel.data!.data![index].hitDate}\n${controller.popUpModel.data!.data![index].hitTime} '))
                                                                        ]))),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 15.h,
                                                    ),
                                                    PrimaryButton(
                                                      color: primaryColor,
                                                      title: 'Close',
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                    SizedBox(
                                                      height: 15.h,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          } else {
                                            return SizedBox(
                                              height: 250.h,
                                              child: const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                        }));
                              },
                              child: Container(
                                height: 30.h,
                                width: 30.w,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: PrimaryText(
                                    data[index].modallDayHits!,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const Center(child: CircularProgressIndicator());
                  },
                )),
        ]);
  }
}
