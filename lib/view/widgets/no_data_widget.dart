import 'package:flutter/cupertino.dart';
import 'package:trafic_static_app/view/widgets/primary_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}