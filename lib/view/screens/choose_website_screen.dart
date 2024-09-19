import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:trafic_static_app/constants/colors.dart';
import 'package:trafic_static_app/constants/values.dart';
import 'package:trafic_static_app/core/cache_controller.dart';
import 'package:trafic_static_app/core/helper/global_functions.dart';
import 'package:trafic_static_app/model/qr_response_model.dart';
import 'package:trafic_static_app/view/screens/home_screen.dart';
import 'package:trafic_static_app/view/widgets/primary_button.dart';
import 'package:trafic_static_app/view/widgets/primary_text.dart';
import 'qr_code_scanner.dart';

class ChooseWebsiteScreen extends StatefulWidget {
  const ChooseWebsiteScreen({Key? key}) : super(key: key);

  @override
  State<ChooseWebsiteScreen> createState() => _ChooseWebsiteScreenState();
}

class _ChooseWebsiteScreenState extends State<ChooseWebsiteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const PrimaryText(
          'Choose Website',
          color: Colors.black87,
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: FutureBuilder(
          future: CacheController.instance.init(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var websites = CacheController.instance.getWebsitesArray()!;
              return  websites.isNotEmpty ?  ListView.builder(
                  itemCount: websites.length,
                  itemBuilder: (context, index) {
                    // QrResponseModel qrResponseModel = CacheController.instance.getWebsite()!;
                    return InkWell(
                      onTap: () {
                        websiteIndex = index;
                        if(websites != -1)
                        navigateAndReplace(context, HomeScreen());
                      },
                      child: Container(
                          height: 90.h,
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x29000000),
                                offset: Offset(0, 3),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Center(
                            child: ListTile(
                              contentPadding: EdgeInsets.only(right: 0,left: 15.w),
                              leading: Image.asset(
                                'images/website_icon.png',
                                height: 30.h,
                                width: 30.w,
                              ),
                              title: PrimaryText(
                                '${websites[index].title}',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.left,
                              ),
                              subtitle: PrimaryText(
                                '${websites[index].url}',
                                fontSize: 12,
                                textAlign: TextAlign.left,
                              ),
                              trailing: IconButton(
                                onPressed: (){
                                  showMyDialog(context: context,
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          height: 9.h,
                                        ),
                                        PrimaryText(
                                          'Note',
                                          fontSize: 26.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        SizedBox(
                                          height: 29.h,
                                        ),
                                        PrimaryText(
                                          'Are you sure to delete this website ?',
                                          fontSize: 14.sp,
                                          textAlign: TextAlign.center,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          height: 25.h,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 80.w,
                                              height: 44.h,
                                              child: PrimaryButton(
                                                onPressed: () {
                                                  List<QrResponseModel>? websites =
                                                  CacheController.instance.getWebsitesArray();
                                                   websites!.removeAt(index);

                                                  CacheController.instance.setWebsitesArray(QrResponseModel.encode(websites)).then((value) {
                                                    Navigator.pop(context);
                                                  }).then((value){
                                                    setState(() {

                                                    });
                                                  });

                                                },
                                                title: 'Yes',
                                                color: primaryColor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15.w,
                                            ),
                                            SizedBox(
                                              width: 80.w,
                                              height: 44.h,
                                              child: PrimaryButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                title: 'No',
                                                color: hintColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 45.h,
                                        )
                                      ],
                                    ),
                                  );
                                },
                                icon: Icon(Icons.delete),
                              ),
                            ),
                          )),
                    );
                  }) :
               Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryText(
                      'No Websites Yet!',
                      fontSize: 18,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SizedBox(
                      width: Get.width * 0.8,
                      child: PrimaryText(
                        'Go to settings of Visitor Traffic Plugin in your website and Scan QR Code',
                        fontSize: 14,
                        maxLines: 4,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );

            } else {
              return Center(
                  child: CircularProgressIndicator(
                color: primaryColor,
              ));
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateTo(context, const QRViewExample());
        },
        child: const Icon(Icons.add),
        backgroundColor: primaryColor,
      ),
    );
  }
}
