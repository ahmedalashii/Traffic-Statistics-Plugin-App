import 'package:flutter/material.dart';
import 'package:trafic_static_app/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'primary_text.dart';
class ProButton extends StatelessWidget {
  final String proLink;

  const ProButton({
    Key? key,required this.proLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 20,
        right: 10,
        child: InkWell(
          onTap: () async{
            try {
              if (await canLaunch(proLink)) {
            await launch(proLink);
            } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Cannot Launch URL')));
            throw "Could not launch $proLink";
            }
            } on Exception catch (_) {
            ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Cannot Launch URL')));
            }

          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.w),
                color: orangeColor),
            padding: EdgeInsets.symmetric(
                horizontal: 8.w, vertical: 10.h),
            child: FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
        ));
  }
}