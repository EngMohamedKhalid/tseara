
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tseara/features/bottom_navigation_feature/presentation/screens/bottom_navigation_screen.dart';
import 'package:tseara/features/intro_feature/presentation/screens/get_started_screen.dart';

import '../../../../app/services/cache_service.dart';
import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/get_it_injection.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../auth_feature/presentation/screens/login_screen.dart';
import 'on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    late Widget widget;
    Future.delayed(Duration(seconds: 1),(){
      if(getIt<CacheService>().getUserToken() == null){
        widget = const GetStartedScreen();
      }else{
        widget = const BNBScreen();
      }
      navigateTo(widget,removeAll: true);
    });
  }
  @override
  Widget build(BuildContext context) {
    return ImageWidget(
      imageUrl: AppImages.splash,
      fit: BoxFit.fill,
      width: double.infinity.w,
      height: double.infinity.h,
    );
  }
}
