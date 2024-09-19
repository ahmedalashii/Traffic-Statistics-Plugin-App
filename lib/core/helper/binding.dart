import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:trafic_static_app/controllers/page2_controller.dart';
import 'package:trafic_static_app/controllers/page3_controller.dart';
import 'package:trafic_static_app/controllers/page4_controller.dart';
import 'package:trafic_static_app/controllers/page5_controller.dart';
import 'package:trafic_static_app/controllers/page6_controller.dart';
import 'package:trafic_static_app/controllers/page7_controller.dart';
import 'package:trafic_static_app/controllers/page9_controller.dart';
import 'package:trafic_static_app/controllers/qr_controller.dart';
import 'package:trafic_static_app/controllers/settings_controller.dart';
import 'package:trafic_static_app/controllers/traffics_controller.dart';

import '../cache_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    CacheController.instance.init().then((value) {

      Get.lazyPut(() => TrafficsController(), fenix: true);
      Get.lazyPut(() => Page2Controller(), fenix: true);
      Get.lazyPut(() => Page3Controller(), fenix: true);
      Get.lazyPut(() => Page4Controller(), fenix: true);
      Get.lazyPut(() => Page5Controller(), fenix: true);
      Get.lazyPut(() => Page6Controller(), fenix: true);
      Get.lazyPut(() => Page7Controller(), fenix: true);
      Get.lazyPut(() => Page9Controller(), fenix: true);
      Get.lazyPut(() => QrController(), fenix: true);
      Get.lazyPut(() => SettingsController(), fenix: true);
      // Get.put<TrafficsController>(TrafficsController());
      // Get.put<Page2Controller>(Page2Controller());
      // Get.put<Page3Controller>(Page3Controller());
      // Get.put<Page4Controller>(Page4Controller());
      // Get.put<Page5Controller>(Page5Controller());
      // Get.put<Page6Controller>(Page6Controller());
      // Get.put<Page7Controller>(Page7Controller());
      // Get.put<Page9Controller>(Page9Controller());
      // Get.put<QrController>(QrController());
    });


  }
}