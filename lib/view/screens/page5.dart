import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trafic_static_app/controllers/page5_controller.dart';
import 'package:trafic_static_app/view/widgets/pie_chart.dart';
import 'package:trafic_static_app/view/widgets/primary_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<Page5Controller>(
      autoRemove: false,
      builder: (controller) => !controller.isLoading.value ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: const PrimaryText(
              'Browsers',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: SizedBox(
                width: Get.width,
                child: PieDataLabels(controller.browsersData)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: const PrimaryText(
              'Search Engines',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
              child: SizedBox(
                  width: Get.width, child: PieDataLabels(controller.searchEnginesData))),
        ],
      ):const  Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
