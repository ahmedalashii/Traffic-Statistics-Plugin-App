import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trafic_static_app/constants/colors.dart';
import 'package:trafic_static_app/controllers/settings_controller.dart';
import 'package:trafic_static_app/core/helper/global_functions.dart';
import 'package:trafic_static_app/view/widgets/auto_complete_dropdown.dart';
import 'package:trafic_static_app/view/widgets/primary_button.dart';
import 'package:trafic_static_app/view/widgets/primary_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trafic_static_app/view/widgets/primary_textfield.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late TextEditingController timeZoneController;
  late TextEditingController ipToExcludeController;
  late TextEditingController pluginAccessController;
  late TextEditingController mapWillDisplayController;
  late FocusNode timeZoneFocus;
  late FocusNode mapWillDisplayFocus;
  late FocusNode accessFocus;
  List<String> mapWillDisplay = [];
  List<String> accessibality = [];

  @override
  void initState() {
    super.initState();
    timeZoneController = TextEditingController();
    ipToExcludeController = TextEditingController();
    pluginAccessController = TextEditingController();
    mapWillDisplayController = TextEditingController();
    timeZoneFocus = FocusNode();
    accessFocus = FocusNode();
    mapWillDisplayFocus = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    timeZoneController.dispose();
    ipToExcludeController.dispose();
    pluginAccessController.dispose();
    mapWillDisplayController.dispose();
    timeZoneFocus.dispose();
    accessFocus.dispose();
    mapWillDisplayFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black87),
        title: const PrimaryText(
          'Settings',
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      body: GetX<SettingsController>(
        builder: (controller) {
          if (!controller.isLoading.value) {
            controller.settingsModel.data!.data2!.mapWillDisplay!.data!
                .forEach((element) {
              mapWillDisplay.add(element.value!);
            });
            controller.settingsModel.data!.data2!.pluginAccessibility!.data!
                .forEach((element) {
              accessibality.add(element.value!);
            });

            timeZoneController.text =
            controller.settingsModel.data!.data2!.selectTimezone!.value!;
            ipToExcludeController.text =
            controller.settingsModel.data!.data2!.iPsToExclude!.value!;
            pluginAccessController.text =
            controller.settingsModel.data!.data2!.pluginAccessibility!
                .value![0];
            mapWillDisplayController.text =
            controller.settingsModel.data!.data2!.mapWillDisplay!.value!;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PrimaryText(
                        'Select Timezone',
                        fontSize: 15,
                      ),
                      AutoCompleteDropdown(
                        focusNode: timeZoneFocus,
                        controller: timeZoneController,
                        hintText: 'Select Timezone',
                        suggestions:
                        controller.settingsModel.data!.data2!.selectTimezone!
                            .data!,)
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PrimaryText(
                        'IP to Exclude',
                        fontSize: 15,
                      ),

                      PrimaryTextField(
                        controller: ipToExcludeController,
                        validator: (v) {
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        hintText: 'Ex: 192.168.1.1',
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PrimaryText(
                        'Plugin Accessibility',
                        fontSize: 15,
                      ),

                      AutoCompleteDropdown(
                        focusNode: accessFocus,
                        controller: pluginAccessController,
                        hintText: 'Ex: Administration',
                        isAccess: true,
                        suggestions:
                        accessibality,)
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      const PrimaryText(
                        'Map Will Display',
                        fontSize: 15,
                      ),
                      AutoCompleteDropdown(
                        focusNode: mapWillDisplayFocus,
                        controller: mapWillDisplayController,
                        hintText: 'Map Will Display',
                        suggestions:
                        mapWillDisplay,)
                    ],
                  ),
                  // CheckboxListTile(
                  //   contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                  //     activeColor: primaryColor,
                  //     title:const PrimaryText('Hash IP',fontSize: 15,textAlign: TextAlign.left,),
                  //     subtitle:const PrimaryText('If Checked, Will Be hide the last 3 Digits in IP.',fontSize: 13,textAlign: TextAlign.left,color: Colors.grey,) ,
                  //     value: true, onChanged: (v){
                  // }),

                  SizedBox(
                    width: Get.width,
                    height: 50.h,
                    child: PrimaryButton(
                      color: primaryColor,
                      title: 'Save Settings',
                      onPressed: () async {
                        showLoaderDialog(context);
                        await controller.setSettings(
                            timeZone: timeZoneController.text,
                            ipToExclude: ipToExcludeController.text,
                            pluginAccess: pluginAccessController.text,
                            mapWillDisplay: mapWillDisplayController.text).then((value) {
                              Navigator.pop(context);

                              if(controller.isError.value){
                                Get.showSnackbar(GetBar(
                                  message: 'Something Wrong',
                                  isDismissible: true,
                                  duration: Duration(milliseconds: 3000),
                                ));
                              }else{
                                Get.showSnackbar(GetBar(
                                  message: 'Settings Saved Successfully',
                                  isDismissible: true,
                                  duration: Duration(milliseconds: 3000),
                                ));
                              }

                        });
                      },
                    ),
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
