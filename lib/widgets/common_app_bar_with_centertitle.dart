import 'package:airportdemo1/app/app_colors.dart';
import 'package:airportdemo1/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonAppBarWithCenterTitle extends StatelessWidget {
  final List<Widget>? actions;
  final bool? isVisibleIcon;
  final String title;
  final VoidCallback? onLeadingPressed;
  final VoidCallback? onActionPressed;
  final String? actionText;

  const CommonAppBarWithCenterTitle({ super.key,
    this.actions,
    required this.title,
    this.onLeadingPressed,
    this.isVisibleIcon,
    this.onActionPressed,
    this.actionText });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.to.primaryColor,
      centerTitle: true,
      elevation: 0,
      toolbarHeight: 61.h,
      automaticallyImplyLeading: false,
      leading: isVisibleIcon == true ? Container(
        alignment: Alignment.centerLeft,
        child: IconButton(
          onPressed: onLeadingPressed,
          icon: Icon(Icons.arrow_back_rounded,color: AppColors.colorWhite,),
        ),
      ) : Container(),
      title: CommonSoraText(text: title,textSize: 16.sp,),
     actions: actions,
    );
  }
}
