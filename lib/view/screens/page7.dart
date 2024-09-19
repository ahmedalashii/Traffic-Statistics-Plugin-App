import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trafic_static_app/controllers/page7_controller.dart';
import 'package:trafic_static_app/core/helper/global_functions.dart';
import 'package:trafic_static_app/model/top_referring_sites_model.dart';
import 'package:trafic_static_app/view/widgets/primary_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
class Page7 extends StatelessWidget {
  const Page7({Key? key}) : super(key: key);

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
            child: PrimaryText(
              controller.topReferringSitesModel.data!.title!,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            width: Get.width ,
            child: controller.topReferringSitesModel.data!.data!.isNotEmpty ? PaginatedDataTable(
              columnSpacing: Get.width/3,
              columns: const [
                DataColumn(
                    label: PrimaryText(
                      'Site Name',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      textAlign: TextAlign.center,
                    )),
                DataColumn(
                    label: PrimaryText(
                      'Times',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      textAlign: TextAlign.center,
                    )),

              ],
              rowsPerPage: 10,
              source: MyData(controller.topReferringSitesModel.data!.data!,context),
            ): Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/no_data.png',height: 200.h,width: 200.w,),
                  const SizedBox(
                    height: 5,
                  ),
                  const PrimaryText('No Data',
                    fontSize: 18,)
                ],
              ),),
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
        color: MaterialStateProperty
            .resolveWith( index%2 == 0 ? getWhiteRowColor  : getGreyRowColor),
        cells: [
      DataCell(InkWell(
          onTap: () async{
            var url = data[index].link.toString();
            try {
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw "Could not launch $url";
              }
            } on Exception catch (_) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cannot Launch URL')));
            }
          },
          child: PrimaryText(data[index].siteName!.toString(),color: Colors.blue,))),
      DataCell(PrimaryText(data[index].totalHits!.toString())),

    ]);
  }
}
