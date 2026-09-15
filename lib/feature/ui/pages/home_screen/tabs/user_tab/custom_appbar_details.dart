import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Core/cache/shared_preference_utils.dart';
import '../../../../../../Core/utils/app_styles.dart';

class CustomAppbarDetails extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        Image.asset("assets/images/route_icon_leading.png"),
        SizedBox(height: 24.h),
        Row(
          children: [
            Text(
              "Welcome, ${(SharedPreferenceUtils.getData(key: "name"))}",
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Text(
          SharedPreferenceUtils.getData(key: "email"),
          style: AppStyle.light14grey.copyWith(fontSize: 12),
        ),
      ],
    )
    ;
  }

}