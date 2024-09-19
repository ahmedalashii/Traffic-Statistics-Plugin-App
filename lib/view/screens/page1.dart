import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:trafic_static_app/constants/colors.dart';
import 'package:trafic_static_app/controllers/traffics_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trafic_static_app/view/widgets/default_line_chart.dart';
import 'package:trafic_static_app/view/widgets/primary_text.dart';
import 'package:url_launcher/url_launcher.dart';

import 'error_screen.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String proLink =
        'https://www.wp-buy.com/product/visitors-traffic-real-time-statistics-pro/?attribute_license=Single%20License%2029\$&box=true';
    return GetX<TrafficsController>(
      init: TrafficsController(),
      autoRemove: false,
      builder: (controller) {
        if (controller.isError.value) {
          Future.delayed(const Duration(milliseconds: 100), () {})
              .then((value) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const ErrorScreen();
            }));
          });
        }
        return controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                color: primaryColor,
              ))
            : !controller.isError.value
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GridView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 1.7),
                            children: [
                              Container(
                                width: 200.w,
                                decoration: BoxDecoration(
                                  color: greenColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    controller
                                            .topStaticModel.data!.data![3].total
                                            .toString()
                                            .isEmpty
                                        ? SizedBox(
                                            width: 110.w,
                                            child: InkWell(
                                              onTap: () async {
                                                try {
                                                  if (await canLaunch(
                                                      proLink)) {
                                                    await launch(proLink);
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                            const SnackBar(
                                                                content: Text(
                                                                    'Cannot Launch URL')));
                                                    throw "Could not launch $proLink";
                                                  }
                                                } on Exception catch (_) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(const SnackBar(
                                                          content: Text(
                                                              'Cannot Launch URL')));
                                                }
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.w),
                                                    color: orangeColor),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8.w,
                                                    vertical: 10.h),
                                                child: FittedBox(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        color: darkBlue,
                                                        size: 20.w,
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      const PrimaryText(
                                                        'Upgrade to Pro',
                                                        color: darkBlue,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ))
                                        : PrimaryText(
                                            controller.topStaticModel.data!
                                                .data![3].total
                                                .toString(),
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                          ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    PrimaryText(
                                      controller
                                          .topStaticModel.data!.data![3].title
                                          .toString(),
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 200.w,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    PrimaryText(
                                      controller
                                          .topStaticModel.data!.data![1].total
                                          .toString(),
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    PrimaryText(
                                      controller
                                          .topStaticModel.data!.data![1].title
                                          .toString(),
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 200.w,
                                decoration: BoxDecoration(
                                  color: pinkColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    PrimaryText(
                                      controller
                                          .topStaticModel.data!.data![2].total
                                          .toString(),
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    PrimaryText(
                                      controller
                                          .topStaticModel.data!.data![2].title
                                          .toString(),
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 200.w,
                                decoration: BoxDecoration(
                                  color: yellowColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    PrimaryText(
                                      controller
                                          .topStaticModel.data!.data![0].total
                                          .toString(),
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    PrimaryText(
                                      controller
                                          .topStaticModel.data!.data![0].title
                                          .toString(),
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          const PrimaryText(
                            'Traffic Report',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          LineDefault(
                            trafficModel: controller.trafficReportModel,
                          )
                        ]))
                : Center(
                    child: PrimaryText('Error'),
                  );
      },
    );
  }
}
