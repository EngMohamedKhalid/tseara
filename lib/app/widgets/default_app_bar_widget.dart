import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/notifications_feature/presentation/screens/notifications_screen.dart';
import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';
import '../utils/helper.dart';
import 'text_widget.dart';

class DefaultAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final bool actions;
  final bool notify;
  final bool? centerTitle;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final bool  shapeBorder;
  final Widget? titleWidget;
  final VoidCallback? onPop;
  final VoidCallback? actionsOnPressed;
  final bool canBack;
  final Color ? backColor;
  final double? leadingWidth;
  final SystemUiOverlayStyle? systemUiOverlayStyle;
  final List<Widget>? actionsWidgets;

  const DefaultAppBarWidget(
      {this.title,
      this.actions = false,
      Key? key,
      this.onPop,
      this.canBack = true, this.leading,  this.notify=true, this.actionsOnPressed, this.titleWidget,
        this.leadingWidth,
        this.actionsWidgets, this.backColor, this.systemUiOverlayStyle, this.centerTitle, this.shapeBorder = false, this.bottom,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      bottom: bottom,
      shape: shapeBorder?const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )
      ):const RoundedRectangleBorder(),
      centerTitle: centerTitle,
      systemOverlayStyle: systemUiOverlayStyle??SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),

      backgroundColor:backColor??Colors.transparent,
      leading: canBack?
      leading ??
          IconButton(
        alignment: Alignment.center,
              onPressed: onPop ??
                  () {
                    Navigator.pop(context);
                  },
              icon: leading?? Icon(
                Icons.arrow_back,
                color:AppColors.black,
                size: 20.sp,
              ),
            )
          :0.horizontalSpace,
      title: titleWidget?? TextWidget(
        title: title??"",
        fontFamily: AppFonts.semiBold,
        titleSize: 24.sp,
          titleFontWeight: AppFonts.semiBold500,
          titleColor: AppColors.black
      ),
      actions: notify ?
           [
              IconButton(
                onPressed: () {
                  navigateTo(NotificationsScreen());
                },
                icon: Icon(
                  Icons.notifications_outlined,
                  color:AppColors.black,
                  size: 24.sp,
                ),
              ),
              IconButton(
                onPressed: () {
                  //navigateTo(SettingScreen());
                },
                icon: Icon(
                  Icons.settings_outlined,
                  color:AppColors.black,
                  size: 24.sp,
                ),
              ),
            ] : actionsWidgets,
      leadingWidth:leadingWidth ,
      toolbarHeight: 70.h,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(500, 66);
}
